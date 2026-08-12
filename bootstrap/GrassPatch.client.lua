local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
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
-- Cumulative (Root + Mid + Tip) lands near 90 deg: rotating Root still
-- pivots at its own origin, so the ground-contact point stays put even
-- though the whole visible blade above it sweeps down.
local ROOT_LEAN_ANGLE_DEGREES = 40
local MID_LEAN_ANGLE_DEGREES = 30
local TIP_EXTRA_LEAN_ANGLE_DEGREES = 20
local DENSE_LEAN_TIME = 0.12
local DENSE_RETURN_TIME = 0.45
local BEND_RADIUS_STUDS = 4
local PROXIMITY_CHECK_INTERVAL = 0.1

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
						root = bone,
						mid = mid,
						tip = tip,
						rootWorldPosition = bone.WorldPosition,
						state = "idle", -- "idle" | "leaning" | "bent" | "returning"
						tweens = {},
					})
				end
			end
		end
	end

	print(string.format("GrassPatch: DenseGrass_Skinned wired up with %d blades", #blades))

	local function cancelTweens(blade)
		for _, tween in pairs(blade.tweens) do
			tween:Cancel()
		end
		blade.tweens = {}
	end

	-- Bends the blade and holds it there (doesn't auto-return); the
	-- proximity sweep below is what decides when to call setBladeUpright.
	local function setBladeBent(blade, localTiltAxis)
		if blade.state == "leaning" or blade.state == "bent" then
			return
		end
		cancelTweens(blade)
		blade.state = "leaning"

		local rootLean = CFrame.fromAxisAngle(localTiltAxis, math.rad(ROOT_LEAN_ANGLE_DEGREES))
		local midLean = CFrame.fromAxisAngle(localTiltAxis, math.rad(MID_LEAN_ANGLE_DEGREES))
		local tipLean = CFrame.fromAxisAngle(localTiltAxis, math.rad(TIP_EXTRA_LEAN_ANGLE_DEGREES))
		local tweenInfo = TweenInfo.new(DENSE_LEAN_TIME, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

		blade.tweens.root = TweenService:Create(blade.root, tweenInfo, { Transform = rootLean })
		blade.tweens.mid = TweenService:Create(blade.mid, tweenInfo, { Transform = midLean })
		blade.tweens.tip = TweenService:Create(blade.tip, tweenInfo, { Transform = tipLean })

		blade.tweens.root.Completed:Connect(function(playbackState)
			if playbackState == Enum.PlaybackState.Completed and blade.state == "leaning" then
				blade.state = "bent"
			end
		end)

		blade.tweens.tip:Play()
		blade.tweens.mid:Play()
		blade.tweens.root:Play()
	end

	local function setBladeUpright(blade)
		if blade.state == "idle" or blade.state == "returning" then
			return
		end
		cancelTweens(blade)
		blade.state = "returning"

		local tweenInfo = TweenInfo.new(DENSE_RETURN_TIME, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
		blade.tweens.root = TweenService:Create(blade.root, tweenInfo, { Transform = CFrame.new() })
		blade.tweens.mid = TweenService:Create(blade.mid, tweenInfo, { Transform = CFrame.new() })
		blade.tweens.tip = TweenService:Create(blade.tip, tweenInfo, { Transform = CFrame.new() })

		blade.tweens.root.Completed:Connect(function(playbackState)
			if playbackState == Enum.PlaybackState.Completed and blade.state == "returning" then
				blade.state = "idle"
			end
		end)

		blade.tweens.tip:Play()
		blade.tweens.mid:Play()
		blade.tweens.root:Play()
	end

	-- Runs a few times a second (not every frame) rather than reacting to
	-- Touched, so a blade stays bent for as long as the player lingers in
	-- range and only springs back once they actually step away.
	local accumulated = 0
	RunService.Heartbeat:Connect(function(dt)
		accumulated += dt
		if accumulated < PROXIMITY_CHECK_INTERVAL then
			return
		end
		accumulated = 0

		local character = localPlayer.Character
		local rootPart = character and character:FindFirstChild("HumanoidRootPart")

		for _, blade in ipairs(blades) do
			local withinRadius = false
			local localTiltAxis

			if rootPart then
				local delta = blade.rootWorldPosition - rootPart.Position
				local horizontalDelta = Vector3.new(delta.X, 0, delta.Z)
				if horizontalDelta.Magnitude <= BEND_RADIUS_STUDS then
					withinRadius = true
					local awayDirection = horizontalDelta.Magnitude > 0.01 and horizontalDelta.Unit
						or meshPart.CFrame.LookVector
					local worldTiltAxis = Vector3.new(-awayDirection.Z, 0, awayDirection.X)
					localTiltAxis = meshPart.CFrame:VectorToObjectSpace(worldTiltAxis).Unit
				end
			end

			if withinRadius then
				setBladeBent(blade, localTiltAxis)
			else
				setBladeUpright(blade)
			end
		end
	end)
end

-- FindFirstChild would silently find nothing if this ran before the model
-- had replicated in; WaitForChild yields for it instead of giving up.
task.spawn(function()
	local denseGrassRoot = Workspace:WaitForChild(DENSE_GRASS_ROOT_NAME, 10)
	if not denseGrassRoot then
		warn("GrassPatch: " .. DENSE_GRASS_ROOT_NAME .. " not found in Workspace after 10s")
		return
	end

	local denseGrassMesh = denseGrassRoot:WaitForChild(DENSE_GRASS_MESH_NAME, 10)
	if not denseGrassMesh then
		warn("GrassPatch: " .. DENSE_GRASS_MESH_NAME .. " not found under " .. DENSE_GRASS_ROOT_NAME .. " after 10s")
		return
	end

	setupDenseGrassPatch(denseGrassMesh)
end)
