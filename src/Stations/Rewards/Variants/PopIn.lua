local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local POP_INFO = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local BADGE_SIZE = UDim2.fromOffset(200, 80)

return {
	Name = "PopIn",
	Description = "Reward badge scales in from nothing with an elastic overshoot.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "ClaimButton",
			Text = "Claim Reward",
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.fromScale(0.5, 0.75),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		local badge = UIBuilder.frame({
			Parent = stage,
			Name = "RewardBadge",
			Size = UDim2.fromOffset(0, 0),
			Position = UDim2.fromScale(0.5, 0.35),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.AccentAlt,
		})
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
		end

		local connection = triggerButton.MouseButton1Click:Connect(claim)

		return { Badge = badge, Claim = claim, Connections = { connection } }
	end,

	Play = function(handle)
		handle.Claim()
	end,

	Reset = function(handle)
		handle.Badge.Visible = false
		handle.Badge.Size = UDim2.fromOffset(0, 0)
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
