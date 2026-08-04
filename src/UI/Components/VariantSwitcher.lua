-- Station title, description, and the row of variant tabs used to switch
-- between alternatives within the current station.

local Theme = require(script.Parent.Parent.Parent.Shared.Theme)
local UIBuilder = require(script.Parent.Parent.Parent.Shared.UIBuilder)

local VariantSwitcher = {}

function VariantSwitcher.Mount(parent, controller)
	local titleLabel = UIBuilder.label({
		Parent = parent,
		Name = "StationTitle",
		Position = UDim2.new(0, 24, 0, 10),
		Size = UDim2.new(1, -48, 0, 26),
		TextSize = 22,
		Font = Theme.FontBold,
	})

	local descriptionLabel = UIBuilder.label({
		Parent = parent,
		Name = "StationDescription",
		Position = UDim2.new(0, 24, 0, 36),
		Size = UDim2.new(1, -48, 0, 18),
		TextSize = 13,
		TextColor3 = Theme.Colors.TextMuted,
	})

	local tabRow = UIBuilder.frame({
		Parent = parent,
		Name = "VariantTabs",
		Position = UDim2.new(0, 24, 0, 58),
		Size = UDim2.new(1, -48, 0, 30),
		BackgroundTransparency = 1,
	})

	local function rebuildTabs()
		tabRow:ClearAllChildren()

		local layout = Instance.new("UIListLayout")
		layout.FillDirection = Enum.FillDirection.Horizontal
		layout.Padding = UDim.new(0, 8)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent = tabRow

		local station = controller:GetCurrentStation()
		titleLabel.Text = station.Name
		descriptionLabel.Text = station.Description or ""

		for index, variant in ipairs(station.Variants) do
			local tab = UIBuilder.button({
				Parent = tabRow,
				Name = variant.Name,
				Text = variant.Name,
				Size = UDim2.new(0, 130, 1, 0),
				BackgroundColor3 = (index == 1) and Theme.Colors.AccentAlt or Theme.Colors.Panel,
			})
			tab.LayoutOrder = index
			UIBuilder.corner().Parent = tab

			tab.MouseButton1Click:Connect(function()
				controller:SelectVariant(index)
			end)
		end
	end

	local function refreshActiveTab()
		local activeVariant = controller:GetCurrentVariant()
		for _, child in ipairs(tabRow:GetChildren()) do
			if child:IsA("TextButton") then
				child.BackgroundColor3 = (child.Name == activeVariant.Name) and Theme.Colors.AccentAlt or Theme.Colors.Panel
			end
		end
	end

	rebuildTabs()
	controller.StationChanged:Connect(rebuildTabs)
	controller.VariantChanged:Connect(refreshActiveTab)
end

return VariantSwitcher
