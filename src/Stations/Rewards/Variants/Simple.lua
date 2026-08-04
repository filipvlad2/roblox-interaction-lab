local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

return {
	Name = "Simple",
	Description = "Reward text simply appears with no animation, as a baseline.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "ClaimButton",
			Text = "Claim Reward",
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.fromScale(0.5, 0.7),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		local rewardLabel = UIBuilder.label({
			Parent = stage,
			Name = "RewardLabel",
			Text = "+10 Coins",
			Position = UDim2.fromScale(0.5, 0.35),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0, 200, 0, 40),
			TextSize = 28,
			Font = Theme.FontBold,
			TextColor3 = Theme.Colors.AccentAlt,
			TextXAlignment = Enum.TextXAlignment.Center,
		})
		rewardLabel.Visible = false

		local connection = triggerButton.MouseButton1Click:Connect(function()
			rewardLabel.Visible = true
		end)

		return { RewardLabel = rewardLabel, Connections = { connection } }
	end,

	Play = function(handle)
		handle.RewardLabel.Visible = false
		handle.RewardLabel.Visible = true
	end,

	Reset = function(handle)
		handle.RewardLabel.Visible = false
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
