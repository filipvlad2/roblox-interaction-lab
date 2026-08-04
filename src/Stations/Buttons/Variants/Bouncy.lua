local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local PRESS_INFO = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local BOUNCE_INFO = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)

return {
	Name = "Bouncy",
	Description = "Press squashes the button, release triggers an elastic overshoot bounce.",

	Mount = function(stage)
		local button = UIBuilder.button({
			Parent = stage,
			Name = "BouncyButton",
			Text = "Click Me",
			Size = UDim2.new(0, 200, 0, 60),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.AccentAlt,
		})
		UIBuilder.corner().Parent = button

		local baseSize = button.Size
		local squashSize = UDim2.new(baseSize.X.Scale, baseSize.X.Offset + 14, baseSize.Y.Scale, baseSize.Y.Offset - 14)

		local function squash()
			TweenService:Create(button, PRESS_INFO, { Size = squashSize }):Play()
		end

		local function bounce()
			TweenService:Create(button, BOUNCE_INFO, { Size = baseSize }):Play()
		end

		local connections = {
			button.MouseButton1Down:Connect(squash),
			button.MouseButton1Up:Connect(bounce),
			button.MouseLeave:Connect(bounce),
		}

		return { Button = button, BaseSize = baseSize, SquashSize = squashSize, Connections = connections }
	end,

	Play = function(handle)
		TweenService:Create(handle.Button, PRESS_INFO, { Size = handle.SquashSize }):Play()
		task.delay(PRESS_INFO.Time, function()
			if handle.Button.Parent then
				TweenService:Create(handle.Button, BOUNCE_INFO, { Size = handle.BaseSize }):Play()
			end
		end)
	end,

	Reset = function(handle)
		handle.Button.Size = handle.BaseSize
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
