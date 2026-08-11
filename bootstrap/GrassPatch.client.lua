local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local GRASS_PART_NAME = "1f56"
local LEAN_ANGLE_DEGREES = 18
local LEAN_TIME = 0.12
local RETURN_TIME = 0.45

local localPlayer = Players.LocalPlayer

local function setupGrassPart(part)
	if not part:IsA("BasePart") then
		return
	end

	-- CFrame tweens are fought by the physics engine on unanchored parts,
	-- so every grass part gets pinned in place before it can react to touch.
	part.Anchored = true

	local baseCFrame = part.CFrame
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
		local leanCFrame = baseCFrame * CFrame.fromAxisAngle(tiltAxis, math.rad(LEAN_ANGLE_DEGREES))

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
	if descendant.Name == GRASS_PART_NAME then
		setupGrassPart(descendant)
	end
end

-- ...and any added later (e.g. streamed in) are picked up as they appear.
Workspace.DescendantAdded:Connect(function(descendant)
	if descendant.Name == GRASS_PART_NAME then
		setupGrassPart(descendant)
	end
end)
