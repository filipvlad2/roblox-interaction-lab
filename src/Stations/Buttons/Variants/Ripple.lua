local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local RIPPLE_INFO = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function spawnRipple(button)
	local ripple = Instance.new("Frame")
	ripple.Name = "Ripple"
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Position = UDim2.fromScale(0.5, 0.5)
	ripple.Size = UDim2.fromOffset(0, 0)
	ripple.BackgroundColor3 = Color3.new(1, 1, 1)
	ripple.BackgroundTransparency = 0.5
	ripple.BorderSizePixel = 0
	ripple.ZIndex = 2
	ripple.Parent = button

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = ripple

	local diameter = button.AbsoluteSize.X * 1.6
	local tween = TweenService:Create(ripple, RIPPLE_INFO, {
		Size = UDim2.fromOffset(diameter, diameter),
		BackgroundTransparency = 1,
	})
	tween:Play()
	tween.Completed:Connect(function()
		ripple:Destroy()
	end)
end

return {
	Name = "Ripple",
	Description = "Click spawns an expanding ripple from the center, similar to material-style feedback.",

	Mount = function(stage)
		local button = UIBuilder.button({
			Parent = stage,
			Name = "RippleButton",
			Text = "Click Me",
			Size = UDim2.new(0, 200, 0, 60),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.Success,
		})
		UIBuilder.corner().Parent = button
		button.ClipsDescendants = true

		local connection = button.MouseButton1Click:Connect(function()
			spawnRipple(button)
		end)

		return { Button = button, Connections = { connection } }
	end,

	Play = function(handle)
		spawnRipple(handle.Button)
	end,

	Reset = function(handle)
		for _, child in ipairs(handle.Button:GetChildren()) do
			if child.Name == "Ripple" then
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
