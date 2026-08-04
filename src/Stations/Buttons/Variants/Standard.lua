local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local UIBuilder = require(Lab.Shared.UIBuilder)

local PRESS_INFO = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local RELEASE_INFO = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

return {
	Name = "Standard",
	Description = "Default press: quick scale-down on click, no overshoot.",

	Mount = function(stage)
		local button = UIBuilder.button({
			Parent = stage,
			Name = "StandardButton",
			Text = "Click Me",
			Size = UDim2.new(0, 200, 0, 60),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = button

		local baseSize = button.Size
		local pressedSize = UDim2.new(baseSize.X.Scale, baseSize.X.Offset - 10, baseSize.Y.Scale, baseSize.Y.Offset - 6)

		local function press()
			TweenService:Create(button, PRESS_INFO, { Size = pressedSize }):Play()
		end

		local function release()
			TweenService:Create(button, RELEASE_INFO, { Size = baseSize }):Play()
		end

		local connections = {
			button.MouseButton1Down:Connect(press),
			button.MouseButton1Up:Connect(release),
			button.MouseLeave:Connect(release),
		}

		return { Button = button, BaseSize = baseSize, PressedSize = pressedSize, Connections = connections }
	end,

	Play = function(handle)
		TweenService:Create(handle.Button, PRESS_INFO, { Size = handle.PressedSize }):Play()
		task.delay(PRESS_INFO.Time, function()
			if handle.Button.Parent then
				TweenService:Create(handle.Button, RELEASE_INFO, { Size = handle.BaseSize }):Play()
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
