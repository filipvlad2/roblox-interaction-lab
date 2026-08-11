local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local AssetService = game:GetService("AssetService")
local Workspace = game:GetService("Workspace")

local GRASS_NAME_FRAGMENT = "1f56"
local LEAN_ANGLE_DEGREES = 35
local BEND_START_FRACTION = 0.5 -- vertices below this height (0 = base, 1 = tip) never move
local LEAN_TIME = 0.12
local RETURN_TIME = 0.45

local localPlayer = Players.LocalPlayer

-- Grass part names come from a mesh import (e.g. "Part|1f56"), not the bare
-- fragment, so match on substring rather than exact equality.
local function isGrassPart(name)
	return string.find(name, GRASS_NAME_FRAGMENT, 1, true) ~= nil
end

local function smoothstep(t)
	t = math.clamp(t, 0, 1)
	return t * t * (3 - 2 * t)
end

local function setupGrassPart(part)
	if not part:IsA("MeshPart") then
		return
	end

	part.Anchored = true

	local debounce = false
	local liveMesh -- created lazily on first touch
	local affectedVertices -- {id, offset (local, relative to pivot), heightFactor}
	local renderConnection

	-- Loads an editable copy of this part's mesh, splits its vertices into
	-- "below the bend line" (left alone) and "above it" (the ones we'll
	-- rotate), and swaps the part over to rendering that editable copy.
	local function ensureLiveMesh()
		if liveMesh then
			return true
		end

		local ok, editableMesh = pcall(function()
			return AssetService:CreateEditableMeshAsync(Content.fromUri(part.MeshId))
		end)
		if not ok or not editableMesh then
			warn("GrassPatch: failed to load editable mesh for", part:GetFullName(), editableMesh)
			return false
		end

		local vertexIds = editableMesh:GetVertices()
		local originalPositions = {}
		local minY, maxY = math.huge, -math.huge
		for _, id in ipairs(vertexIds) do
			local pos = editableMesh:GetPosition(id)
			originalPositions[id] = pos
			minY = math.min(minY, pos.Y)
			maxY = math.max(maxY, pos.Y)
		end

		local pivotY = minY + (maxY - minY) * BEND_START_FRACTION
		local pivotLocal = Vector3.new(0, pivotY, 0)

		local affected = {}
		for _, id in ipairs(vertexIds) do
			local pos = originalPositions[id]
			if pos.Y > pivotY then
				table.insert(affected, {
					id = id,
					offset = pos - pivotLocal,
					heightFactor = smoothstep((pos.Y - pivotY) / (maxY - pivotY)),
				})
			end
		end

		local assignOk, assignErr = pcall(function()
			part.MeshContent = Content.fromObject(editableMesh)
		end)
		if not assignOk then
			warn("GrassPatch: failed to assign live mesh for", part:GetFullName(), assignErr)
			return false
		end

		liveMesh = editableMesh
		affectedVertices = affected
		return true
	end

	local function animateBend(localTiltAxis)
		local pivotLocal = Vector3.new(0, 0, 0) -- offsets are already pivot-relative
		local startTime = os.clock()

		if renderConnection then
			renderConnection:Disconnect()
		end

		renderConnection = RunService.RenderStepped:Connect(function()
			local elapsed = os.clock() - startTime
			local alpha

			if elapsed < LEAN_TIME then
				alpha = smoothstep(elapsed / LEAN_TIME)
			elseif elapsed < LEAN_TIME + RETURN_TIME then
				alpha = 1 - smoothstep((elapsed - LEAN_TIME) / RETURN_TIME)
			else
				alpha = 0
			end

			for _, vertex in ipairs(affectedVertices) do
				local angle = LEAN_ANGLE_DEGREES * alpha * vertex.heightFactor
				local rotatedOffset = CFrame.fromAxisAngle(localTiltAxis, math.rad(angle)):VectorToWorldSpace(vertex.offset)
				liveMesh:SetPosition(vertex.id, pivotLocal + rotatedOffset)
			end

			if elapsed >= LEAN_TIME + RETURN_TIME then
				renderConnection:Disconnect()
				renderConnection = nil
				debounce = false
			end
		end)
	end

	part.Touched:Connect(function(hit)
		if debounce then
			return
		end

		local character = hit.Parent
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoid or character ~= localPlayer.Character then
			return
		end

		if not ensureLiveMesh() then
			return
		end

		local rootPart = character:FindFirstChild("HumanoidRootPart")
		local awayDirection = rootPart and (part.Position - rootPart.Position) or part.CFrame.LookVector
		awayDirection = Vector3.new(awayDirection.X, 0, awayDirection.Z)
		if awayDirection.Magnitude < 0.01 then
			awayDirection = part.CFrame.LookVector
		end
		awayDirection = awayDirection.Unit

		local worldTiltAxis = Vector3.new(-awayDirection.Z, 0, awayDirection.X)
		local localTiltAxis = part.CFrame:VectorToObjectSpace(worldTiltAxis).Unit

		debounce = true
		animateBend(localTiltAxis)
	end)
end

-- Grass parts are nested under folders/models, not direct children of
-- Workspace, so every existing "1f56" part in the whole tree is wired up...
for _, descendant in ipairs(Workspace:GetDescendants()) do
	if isGrassPart(descendant.Name) then
		setupGrassPart(descendant)
	end
end

-- ...and any added later (e.g. streamed in) are picked up as they appear.
Workspace.DescendantAdded:Connect(function(descendant)
	if isGrassPart(descendant.Name) then
		setupGrassPart(descendant)
	end
end)
