-- Small instance-construction helpers to keep station variants short and consistent.
-- Every field is optional; sensible theme defaults are used when omitted.

local Theme = require(script.Parent.Theme)

local UIBuilder = {}

function UIBuilder.corner(radius: UDim?)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = radius or Theme.CornerRadius
	return corner
end

function UIBuilder.frame(props)
	local frame = Instance.new("Frame")
	frame.Name = props.Name or "Frame"
	frame.BackgroundColor3 = props.BackgroundColor3 or Theme.Colors.Panel
	frame.BackgroundTransparency = props.BackgroundTransparency or 0
	frame.BorderSizePixel = 0
	frame.Size = props.Size or UDim2.fromScale(1, 1)
	frame.Position = props.Position or UDim2.fromScale(0, 0)
	frame.AnchorPoint = props.AnchorPoint or Vector2.new(0, 0)
	frame.Parent = props.Parent
	return frame
end

function UIBuilder.label(props)
	local label = Instance.new("TextLabel")
	label.Name = props.Name or "Label"
	label.BackgroundTransparency = 1
	label.Font = props.Font or Theme.Font
	label.TextColor3 = props.TextColor3 or Theme.Colors.Text
	label.TextTransparency = props.TextTransparency or 0
	label.TextSize = props.TextSize or 16
	label.TextWrapped = props.TextWrapped or false
	label.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Left
	label.TextYAlignment = props.TextYAlignment or Enum.TextYAlignment.Center
	label.Text = props.Text or ""
	label.Size = props.Size or UDim2.fromScale(1, 1)
	label.Position = props.Position or UDim2.fromScale(0, 0)
	label.AnchorPoint = props.AnchorPoint or Vector2.new(0, 0)
	label.Parent = props.Parent
	return label
end

function UIBuilder.button(props)
	local button = Instance.new("TextButton")
	button.Name = props.Name or "Button"
	button.AutoButtonColor = false
	button.BackgroundColor3 = props.BackgroundColor3 or Theme.Colors.Accent
	button.BackgroundTransparency = props.BackgroundTransparency or 0
	button.BorderSizePixel = 0
	button.Font = props.Font or Theme.FontBold
	button.TextColor3 = props.TextColor3 or Theme.Colors.Text
	button.TextSize = props.TextSize or 16
	button.Text = props.Text or "Button"
	button.Size = props.Size or UDim2.new(0, 160, 0, 44)
	button.Position = props.Position or UDim2.fromScale(0, 0)
	button.AnchorPoint = props.AnchorPoint or Vector2.new(0, 0)
	button.Parent = props.Parent
	return button
end

return UIBuilder
