-- Station list. Highlights whichever station the controller currently has active.

local Theme = require(script.Parent.Parent.Parent.Shared.Theme)
local UIBuilder = require(script.Parent.Parent.Parent.Shared.UIBuilder)

local Sidebar = {}

function Sidebar.Mount(parent, controller)
	UIBuilder.label({
		Parent = parent,
		Name = "Title",
		Text = "STATIONS",
		Size = UDim2.new(1, -24, 0, 30),
		Position = UDim2.new(0, 12, 0, 12),
		TextColor3 = Theme.Colors.TextMuted,
		TextSize = 13,
		Font = Theme.FontBold,
	})

	local list = UIBuilder.frame({
		Parent = parent,
		Name = "List",
		Position = UDim2.new(0, 0, 0, 50),
		Size = UDim2.new(1, 0, 1, -50),
		BackgroundTransparency = 1,
	})

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 4)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = list

	local entries = {}

	local function refreshHighlight()
		local current = controller:GetCurrentStation()
		for _, entry in ipairs(entries) do
			entry.Button.BackgroundColor3 = (entry.Station == current) and Theme.Colors.Accent or Theme.Colors.Panel
		end
	end

	for index, station in ipairs(controller:GetStations()) do
		local button = UIBuilder.button({
			Parent = list,
			Name = station.Id,
			Text = station.Name,
			Size = UDim2.new(1, -24, 0, 44),
			Position = UDim2.new(0, 12, 0, 0),
			BackgroundColor3 = Theme.Colors.Panel,
		})
		button.TextXAlignment = Enum.TextXAlignment.Left
		button.LayoutOrder = index
		UIBuilder.corner().Parent = button

		local padding = Instance.new("UIPadding")
		padding.PaddingLeft = UDim.new(0, 14)
		padding.Parent = button

		button.MouseButton1Click:Connect(function()
			controller:SelectStation(index)
		end)

		table.insert(entries, { Button = button, Station = station })
	end

	refreshHighlight()
	controller.StationChanged:Connect(refreshHighlight)
end

return Sidebar
