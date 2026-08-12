local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local GRASS_NAME_FRAGMENT = "1f56"
local LEAN_ANGLE_DEGREES = 18
local LEAN_TIME = 0.12
local RETURN_TIME = 0.45

local localPlayer = Players.LocalPlayer

-- Grass part names come from a mesh import (e.g. "Part|1f56"), not the bare
-- fragment, so match on substring rather than exact equality.
local function isGrassPart(name)
	return string.find(name, GRASS_NAME_FRAGMENT, 1, true) ~= nil
end

local function setupGrassPart(part)
	if not part:IsA("BasePart") then
		return
	end

	-- CFrame tweens are fought by the physics engine on unanchored parts,
	-- so every grass part gets pinned in place before it can react to touch.
	part.Anchored = true

	local baseCFrame = part.CFrame
	-- Pivot at the bottom face (assumes the blade stands upright along its
	-- own local Y axis), so rotating around it leaves the base in place and
	-- only the top of the part swings.
	local pivotPoint = (baseCFrame * CFrame.new(0, -part.Size.Y / 2, 0)).Position
	local debounce = false
	local leanTween, returnTween

	local function playLean(awayDirection)
		if leanTween then
			leanTween:Cancel()
		end
		if returnTween then
			returnTween:Cancel()
		end

		local tiltAxis = Vector3.new(-awayDirection.Z, 0, awayDirection.X)
		local rotation = CFrame.fromAxisAngle(tiltAxis, math.rad(LEAN_ANGLE_DEGREES))
		local leanCFrame = CFrame.new(pivotPoint) * rotation * CFrame.new(-pivotPoint) * baseCFrame

		leanTween = TweenService:Create(
			part,
			TweenInfo.new(LEAN_TIME, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{ CFrame = leanCFrame }
		)
		leanTween.Completed:Connect(function(playbackState)
			if playbackState ~= Enum.PlaybackState.Completed then
				debounce = false
				return
			end
			returnTween = TweenService:Create(
				part,
				TweenInfo.new(RETURN_TIME, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
				{ CFrame = baseCFrame }
			)
			returnTween.Completed:Connect(function()
				debounce = false
			end)
			returnTween:Play()
		end)
		leanTween:Play()
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

		local rootPart = character:FindFirstChild("HumanoidRootPart")
		local awayDirection = rootPart and (part.Position - rootPart.Position) or part.CFrame.LookVector
		awayDirection = Vector3.new(awayDirection.X, 0, awayDirection.Z)
		if awayDirection.Magnitude < 0.01 then
			awayDirection = part.CFrame.LookVector
		end
		awayDirection = awayDirection.Unit

		debounce = true
		playLean(awayDirection)
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

--[[
	DenseGrass_Skinned: a single skinned MeshPart covering many grass blades.
	Each blade is a 3-bone chain (<name>_Root -> _Mid -> _Tip, one stud apart).
	Root is left alone so the base never moves; only Mid (and a smaller extra
	amount on Tip, for a natural curve) gets rotated, which bends just the
	upper portion of that blade via skinning.
]]

local DENSE_GRASS_ROOT_NAME = "DenseGrass_Skinned_Roblox"
local DENSE_GRASS_MESH_NAME = "DenseGrass_Skinned"
local MID_LEAN_ANGLE_DEGREES = 25
local TIP_EXTRA_LEAN_ANGLE_DEGREES = 15
local DENSE_LEAN_TIME = 0.12
local DENSE_RETURN_TIME = 0.45
local BEND_RADIUS_STUDS = 4
local TOUCH_SWEEP_COOLDOWN = 0.1

local function setupDenseGrassPatch(meshPart)
	meshPart.Anchored = true

	local blades = {}
	for _, bone in ipairs(meshPart:GetChildren()) do
		if bone:IsA("Bone") then
			local prefix = string.match(bone.Name, "^(.*)_Root$")
			if prefix then
				local mid = bone:FindFirstChild(prefix .. "_Mid")
				local tip = mid and mid:FindFirstChild(prefix .. "_Tip")
				if mid and tip then
					table.insert(blades, {
						mid = mid,
						tip = tip,
						rootWorldPosition = bone.WorldPosition,
						debounce = false,
					})
				end
			end
		end
	end

	local function playBladeLean(blade, localTiltAxis)
		local midLean = CFrame.fromAxisAngle(localTiltAxis, math.rad(MID_LEAN_ANGLE_DEGREES))
		local tipLean = CFrame.fromAxisAngle(localTiltAxis, math.rad(TIP_EXTRA_LEAN_ANGLE_DEGREES))

		local midLeanTween = TweenService:Create(
			blade.mid,
			TweenInfo.new(DENSE_LEAN_TIME, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{ Transform = midLean }
		)
		local tipLeanTween = TweenService:Create(
			blade.tip,
			TweenInfo.new(DENSE_LEAN_TIME, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			{ Transform = tipLean }
		)

		midLeanTween.Completed:Connect(function(playbackState)
			if playbackState ~= Enum.PlaybackState.Completed then
				blade.debounce = false
				return
			end
			local midReturnTween = TweenService:Create(
				blade.mid,
				TweenInfo.new(DENSE_RETURN_TIME, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
				{ Transform = CFrame.new() }
			)
			local tipReturnTween = TweenService:Create(
				blade.tip,
				TweenInfo.new(DENSE_RETURN_TIME, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
				{ Transform = CFrame.new() }
			)
			tipReturnTween:Play()
			midReturnTween.Completed:Connect(function()
				blade.debounce = false
			end)
			midReturnTween:Play()
		end)

		tipLeanTween:Play()
		midLeanTween:Play()
	end

	local sweepOnCooldown = false

	meshPart.Touched:Connect(function(hit)
		local character = hit.Parent
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoid or character ~= localPlayer.Character then
			return
		end

		if sweepOnCooldown then
			return
		end
		sweepOnCooldown = true
		task.delay(TOUCH_SWEEP_COOLDOWN, function()
			sweepOnCooldown = false
		end)

		local rootPart = character:FindFirstChild("HumanoidRootPart")
		if not rootPart then
			return
		end
		local playerPosition = rootPart.Position

		for _, blade in ipairs(blades) do
			if not blade.debounce then
				local delta = blade.rootWorldPosition - playerPosition
				local horizontalDelta = Vector3.new(delta.X, 0, delta.Z)
				if horizontalDelta.Magnitude <= BEND_RADIUS_STUDS then
					local awayDirection = horizontalDelta.Magnitude > 0.01 and horizontalDelta.Unit
						or meshPart.CFrame.LookVector
					local worldTiltAxis = Vector3.new(-awayDirection.Z, 0, awayDirection.X)
					local localTiltAxis = meshPart.CFrame:VectorToObjectSpace(worldTiltAxis).Unit

					blade.debounce = true
					playBladeLean(blade, localTiltAxis)
				end
			end
		end
	end)
end

local denseGrassRoot = Workspace:FindFirstChild(DENSE_GRASS_ROOT_NAME)
if denseGrassRoot then
	local denseGrassMesh = denseGrassRoot:FindFirstChild(DENSE_GRASS_MESH_NAME)
	if denseGrassMesh then
		setupDenseGrassPatch(denseGrassMesh)
	end
end
