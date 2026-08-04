local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local SEGMENT_COUNT = 8
local STEP_DELAY = 0.12
local FILL_INFO = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

return {
	Name = "Segmented",
	Description = "Progress bar split into discrete chunks that light up one at a time.",

	Mount = function(stage)
		local track = UIBuilder.frame({
			Parent = stage,
			Name = "Track",
			Size = UDim2.new(0, 320, 0, 24),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
		})

		local layout = Instance.new("UIListLayout")
		layout.FillDirection = Enum.FillDirection.Horizontal
		layout.Padding = UDim.new(0, 4)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent = track

		local segments = {}
		for i = 1, SEGMENT_COUNT do
			local segment = UIBuilder.frame({
				Parent = track,
				Name = "Segment" .. i,
				Size = UDim2.new(1 / SEGMENT_COUNT, -4, 1, 0),
				BackgroundColor3 = Theme.Colors.PanelAlt,
			})
			segment.LayoutOrder = i
			UIBuilder.corner(UDim.new(0, 4)).Parent = segment
			table.insert(segments, segment)
		end

		return { Segments = segments, Generation = 0 }
	end,

	Play = function(handle)
		for _, segment in ipairs(handle.Segments) do
			segment.BackgroundColor3 = Theme.Colors.PanelAlt
		end

		handle.Generation += 1
		local generation = handle.Generation

		task.spawn(function()
			for _, segment in ipairs(handle.Segments) do
				if generation ~= handle.Generation then
					return
				end
				TweenService:Create(segment, FILL_INFO, { BackgroundColor3 = Theme.Colors.Accent }):Play()
				task.wait(STEP_DELAY)
			end
		end)
	end,

	Reset = function(handle)
		handle.Generation += 1
		for _, segment in ipairs(handle.Segments) do
			segment.BackgroundColor3 = Theme.Colors.PanelAlt
		end
	end,

	Destroy = function(handle)
		handle.Generation += 1
	end,
}
