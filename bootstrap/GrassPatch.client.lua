local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local LEAN_ANGLE_DEGREES = 18
local LEAN_TIME = 0.12
local RETURN_TIME = 0.45

local localPlayer = Players.LocalPlayer

local grass = Workspace:WaitForChild("1f56")
local baseCFrame = grass.CFrame

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
		grass,
		TweenInfo.new(LEAN_TIME, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		{ CFrame = leanCFrame }
	)
	leanTween.Completed:Connect(function(playbackState)
		if playbackState ~= Enum.PlaybackState.Completed then
			debounce = false
			return
		end
		returnTween = TweenService:Create(
			grass,
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

local function onTouched(hit)
	if debounce then
		return
	end

	local character = hit.Parent
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if not humanoid or character ~= localPlayer.Character then
		return
	end

	local rootPart = character:FindFirstChild("HumanoidRootPart")
	local awayDirection = rootPart and (grass.Position - rootPart.Position) or grass.CFrame.LookVector
	awayDirection = Vector3.new(awayDirection.X, 0, awayDirection.Z)
	if awayDirection.Magnitude < 0.01 then
		awayDirection = grass.CFrame.LookVector
	end
	awayDirection = awayDirection.Unit

	debounce = true
	playLean(awayDirection)
end

grass.Touched:Connect(onTouched)
