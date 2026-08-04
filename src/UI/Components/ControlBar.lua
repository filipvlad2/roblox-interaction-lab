-- Replay / Reset controls, shared by every station regardless of variant.

local Theme = require(script.Parent.Parent.Parent.Shared.Theme)
local UIBuilder = require(script.Parent.Parent.Parent.Shared.UIBuilder)

local ControlBar = {}

function ControlBar.Mount(parent, controller)
	local replayButton = UIBuilder.button({
		Parent = parent,
		Name = "ReplayButton",
		Text = "Replay",
		Size = UDim2.new(0, 140, 0, 44),
		Position = UDim2.new(0, 24, 0.5, -22),
		BackgroundColor3 = Theme.Colors.Accent,
	})
	UIBuilder.corner().Parent = replayButton

	local resetButton = UIBuilder.button({
		Parent = parent,
		Name = "ResetButton",
		Text = "Reset",
		Size = UDim2.new(0, 140, 0, 44),
		Position = UDim2.new(0, 176, 0.5, -22),
		BackgroundColor3 = Theme.Colors.PanelAlt,
	})
	UIBuilder.corner().Parent = resetButton

	replayButton.MouseButton1Click:Connect(function()
		controller:Replay()
	end)

	resetButton.MouseButton1Click:Connect(function()
		controller:Reset()
	end)
end

return ControlBar
