local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local DOT_COUNT = 12
local RADIUS = 60
local STEP_DELAY = 0.06
local LIGHT_INFO = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

return {
	Name = "Circular",
	Description = "Progress expressed as dots arranged in a ring, lighting up clockwise.",

	Mount = function(stage)
		local ring = UIBuilder.frame({
			Parent = stage,
			Name = "Ring",
			Size = UDim2.fromOffset(RADIUS * 2 + 24, RADIUS * 2 + 24),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
		})

		local dots = {}
		for i = 1, DOT_COUNT do
			local angle = (i / DOT_COUNT) * math.pi * 2 - (math.pi / 2)
			local x = math.cos(angle) * RADIUS
			local y = math.sin(angle) * RADIUS

			local dot = Instance.new("Frame")
			dot.Name = "Dot" .. i
			dot.AnchorPoint = Vector2.new(0.5, 0.5)
			dot.Position = UDim2.new(0.5, x, 0.5, y)
			dot.Size = UDim2.fromOffset(12, 12)
			dot.BackgroundColor3 = Theme.Colors.PanelAlt
			dot.BorderSizePixel = 0
			dot.Parent = ring

			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(1, 0)
			corner.Parent = dot

			table.insert(dots, dot)
		end

		return { Dots = dots, Generation = 0 }
	end,

	Play = function(handle)
		for _, dot in ipairs(handle.Dots) do
			dot.BackgroundColor3 = Theme.Colors.PanelAlt
		end

		handle.Generation += 1
		local generation = handle.Generation

		task.spawn(function()
			for _, dot in ipairs(handle.Dots) do
				if generation ~= handle.Generation then
					return
				end
				TweenService:Create(dot, LIGHT_INFO, { BackgroundColor3 = Theme.Colors.Accent }):Play()
				task.wait(STEP_DELAY)
			end
		end)
	end,

	Reset = function(handle)
		handle.Generation += 1
		for _, dot in ipairs(handle.Dots) do
			dot.BackgroundColor3 = Theme.Colors.PanelAlt
		end
	end,

	Destroy = function(handle)
		handle.Generation += 1
	end,
}
