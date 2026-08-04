local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local FILL_INFO = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local EMPTY_SIZE = UDim2.new(0, 0, 1, 0)
local FULL_SIZE = UDim2.new(1, 0, 1, 0)

return {
	Name = "LinearFill",
	Description = "Classic horizontal bar that fills smoothly left to right.",

	Mount = function(stage)
		local track = UIBuilder.frame({
			Parent = stage,
			Name = "Track",
			Size = UDim2.new(0, 320, 0, 24),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.PanelAlt,
		})
		UIBuilder.corner(UDim.new(0, 12)).Parent = track

		local fill = UIBuilder.frame({
			Parent = track,
			Name = "Fill",
			Size = EMPTY_SIZE,
			BackgroundColor3 = Theme.Colors.Accent,
		})
		UIBuilder.corner(UDim.new(0, 12)).Parent = fill

		return { Fill = fill, Tween = nil }
	end,

	Play = function(handle)
		if handle.Tween then
			handle.Tween:Cancel()
		end
		handle.Fill.Size = EMPTY_SIZE
		handle.Tween = TweenService:Create(handle.Fill, FILL_INFO, { Size = FULL_SIZE })
		handle.Tween:Play()
	end,

	Reset = function(handle)
		if handle.Tween then
			handle.Tween:Cancel()
		end
		handle.Fill.Size = EMPTY_SIZE
	end,

	Destroy = function(handle)
		if handle.Tween then
			handle.Tween:Cancel()
		end
	end,
}
