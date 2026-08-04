local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local POP_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local BURST_INFO = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local BADGE_SIZE = UDim2.fromOffset(200, 80)
local CONFETTI_PIECES = 10

local CONFETTI_COLORS = {
	Theme.Colors.AccentAlt,
	Theme.Colors.Accent,
	Theme.Colors.Success,
}

local function spawnConfetti(container)
	for i = 1, CONFETTI_PIECES do
		local piece = Instance.new("Frame")
		piece.Name = "Confetti"
		piece.AnchorPoint = Vector2.new(0.5, 0.5)
		piece.Position = UDim2.fromScale(0.5, 0.5)
		piece.Size = UDim2.fromOffset(8, 8)
		piece.BackgroundColor3 = CONFETTI_COLORS[(i % #CONFETTI_COLORS) + 1]
		piece.BorderSizePixel = 0
		piece.Rotation = math.random(0, 360)
		piece.Parent = container

		local angle = (i / CONFETTI_PIECES) * math.pi * 2
		local distance = 70 + math.random(0, 30)
		local offsetX = math.cos(angle) * distance
		local offsetY = math.sin(angle) * distance

		local tween = TweenService:Create(piece, BURST_INFO, {
			Position = UDim2.new(0.5, offsetX, 0.5, offsetY),
			BackgroundTransparency = 1,
			Rotation = piece.Rotation + 180,
		})
		tween:Play()
		tween.Completed:Connect(function()
			piece:Destroy()
		end)
	end
end

return {
	Name = "Confetti",
	Description = "Reward badge pops in and bursts a handful of confetti pieces outward.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "ClaimButton",
			Text = "Claim Reward",
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.fromScale(0.5, 0.78),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		local burstContainer = UIBuilder.frame({
			Parent = stage,
			Name = "BurstContainer",
			Size = UDim2.fromOffset(1, 1),
			Position = UDim2.fromScale(0.5, 0.35),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
		})

		local badge = UIBuilder.frame({
			Parent = burstContainer,
			Name = "RewardBadge",
			Size = UDim2.fromOffset(0, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.AccentAlt,
		})
		badge.ZIndex = 2
		UIBuilder.corner(UDim.new(0, 16)).Parent = badge
		badge.Visible = false

		UIBuilder.label({
			Parent = badge,
			Name = "Text",
			Text = "+10 Coins",
			Size = UDim2.fromScale(1, 1),
			TextSize = 24,
			Font = Theme.FontBold,
			TextXAlignment = Enum.TextXAlignment.Center,
		})

		local function claim()
			badge.Visible = true
			badge.Size = UDim2.fromOffset(0, 0)
			TweenService:Create(badge, POP_INFO, { Size = BADGE_SIZE }):Play()
			spawnConfetti(burstContainer)
		end

		local connection = triggerButton.MouseButton1Click:Connect(claim)

		return { Badge = badge, BurstContainer = burstContainer, Claim = claim, Connections = { connection } }
	end,

	Play = function(handle)
		handle.Claim()
	end,

	Reset = function(handle)
		handle.Badge.Visible = false
		handle.Badge.Size = UDim2.fromOffset(0, 0)
		for _, child in ipairs(handle.BurstContainer:GetChildren()) do
			if child.Name == "Confetti" then
				child:Destroy()
			end
		end
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
