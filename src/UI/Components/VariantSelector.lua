-- Compact, horizontally-scrolling row of variant tabs. Replaces the old
-- VariantSwitcher's tab row; drops its station title/description text since
-- the companion panel's content is limited to selectors and actions only.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local ROW_HEIGHT = 28
local TAB_HEIGHT = 24
local TAB_GAP = 6
local TAB_HORIZONTAL_PADDING = 20
local MIN_TAB_WIDTH = 56
local ESTIMATED_CHAR_WIDTH = 7

local VariantSelector = {}
VariantSelector.HEIGHT = ROW_HEIGHT

local function estimateTabWidth(text: string)
	return math.max(MIN_TAB_WIDTH, #text * ESTIMATED_CHAR_WIDTH + TAB_HORIZONTAL_PADDING)
end

function VariantSelector.Mount(parent, controller)
	local root = UIBuilder.frame({
		Parent = parent,
		Name = "VariantSelector",
		Size = UDim2.new(1, 0, 0, ROW_HEIGHT),
		BackgroundTransparency = 1,
	})

	local scroller = Instance.new("ScrollingFrame")
	scroller.Name = "Tabs"
	scroller.Size = UDim2.fromScale(1, 1)
	scroller.BackgroundTransparency = 1
	scroller.BorderSizePixel = 0
	scroller.ScrollBarThickness = 3
	scroller.ScrollBarImageColor3 = Theme.Colors.TextMuted
	scroller.ScrollingDirection = Enum.ScrollingDirection.X
	scroller.AutomaticCanvasSize = Enum.AutomaticSize.X
	scroller.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroller.Parent = root

	local function rebuildTabs()
		scroller:ClearAllChildren()

		local layout = Instance.new("UIListLayout")
		layout.FillDirection = Enum.FillDirection.Horizontal
		layout.Padding = UDim.new(0, TAB_GAP)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.VerticalAlignment = Enum.VerticalAlignment.Center
		layout.Parent = scroller

		local station = controller:GetCurrentStation()
		for index, variant in ipairs(station.Variants) do
			local isActive = (variant == controller:GetCurrentVariant())
			local tab = UIBuilder.button({
				Parent = scroller,
				Name = variant.Name,
				Text = variant.Name,
				Size = UDim2.new(0, estimateTabWidth(variant.Name), 0, TAB_HEIGHT),
				BackgroundColor3 = isActive and Theme.Colors.Accent or Theme.Colors.PanelAlt,
				TextSize = 12,
			})
			tab.LayoutOrder = index
			UIBuilder.corner(UDim.new(0, 6)).Parent = tab

			tab.MouseButton1Click:Connect(function()
				controller:SelectVariant(index)
			end)
		end
	end

	local function refreshActiveTab()
		local activeVariant = controller:GetCurrentVariant()
		for _, child in ipairs(scroller:GetChildren()) do
			if child:IsA("TextButton") then
				child.BackgroundColor3 = (child.Name == activeVariant.Name) and Theme.Colors.Accent or Theme.Colors.PanelAlt
			end
		end
	end

	rebuildTabs()
	controller.StationChanged:Connect(rebuildTabs)
	controller.VariantChanged:Connect(refreshActiveTab)

	return root
end

return VariantSelector
