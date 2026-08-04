-- Compact station picker: a single toggle button showing the current
-- station, opening a short list on click. Replaces the old always-expanded
-- Sidebar, which assumed a full-height column that a compact floating panel
-- doesn't have room for.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local ROW_HEIGHT = 30
local OPTION_HEIGHT = 26
local OPTION_GAP = 4
local POPOUT_MARGIN = 4

local BenchmarkSelector = {}
BenchmarkSelector.HEIGHT = ROW_HEIGHT

function BenchmarkSelector.Mount(parent, controller)
	local root = UIBuilder.frame({
		Parent = parent,
		Name = "BenchmarkSelector",
		Size = UDim2.new(1, 0, 0, ROW_HEIGHT),
		BackgroundTransparency = 1,
	})

	local toggleButton = UIBuilder.button({
		Parent = root,
		Name = "Toggle",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme.Colors.PanelAlt,
		TextSize = 13,
	})
	toggleButton.TextXAlignment = Enum.TextXAlignment.Left
	UIBuilder.corner(UDim.new(0, 6)).Parent = toggleButton
	local togglePadding = Instance.new("UIPadding")
	togglePadding.PaddingLeft = UDim.new(0, 10)
	togglePadding.PaddingRight = UDim.new(0, 10)
	togglePadding.Parent = toggleButton

	local stations = controller:GetStations()
	local popoutHeight = #stations * OPTION_HEIGHT + math.max(0, #stations - 1) * OPTION_GAP

	-- Opens upward from the selector row rather than downward: the panel this
	-- lives in is anchored to the bottom of the screen, so a downward popout
	-- would render past the bottom edge and be invisible.
	local popout = UIBuilder.frame({
		Parent = root,
		Name = "Popout",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 0, -POPOUT_MARGIN),
		Size = UDim2.new(1, 0, 0, popoutHeight),
		BackgroundColor3 = Theme.Colors.PanelAlt,
	})
	popout.ZIndex = 5
	popout.Visible = false
	UIBuilder.corner(UDim.new(0, 6)).Parent = popout

	local optionsLayout = Instance.new("UIListLayout")
	optionsLayout.Padding = UDim.new(0, OPTION_GAP)
	optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
	optionsLayout.Parent = popout

	-- Oversized and centered on root rather than screen-sized: this avoids
	-- needing a reference to the ScreenGui just to cover "everything else."
	-- Sits below the popout's own ZIndex (5) so its option buttons still
	-- receive clicks normally, and above everything else in the panel and
	-- the game behind it, so a click anywhere outside the open list closes
	-- it instead of silently doing nothing and leaving it floating open.
	local scrim = UIBuilder.button({
		Parent = root,
		Name = "Scrim",
		Text = "",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(20, 0, 20, 0),
		BackgroundTransparency = 1,
	})
	scrim.AutoButtonColor = false
	scrim.ZIndex = 4
	scrim.Visible = false

	local function setOpen(open: boolean)
		popout.Visible = open
		scrim.Visible = open
	end

	local function refreshToggleText()
		toggleButton.Text = controller:GetCurrentStation().Name .. "  \226\150\190"
	end

	for index, station in ipairs(stations) do
		local option = UIBuilder.button({
			Parent = popout,
			Name = station.Id,
			Text = station.Name,
			Size = UDim2.new(1, 0, 0, OPTION_HEIGHT),
			BackgroundColor3 = Theme.Colors.Panel,
			TextSize = 12,
		})
		option.TextXAlignment = Enum.TextXAlignment.Left
		option.LayoutOrder = index
		UIBuilder.corner(UDim.new(0, 4)).Parent = option
		local optionPadding = Instance.new("UIPadding")
		optionPadding.PaddingLeft = UDim.new(0, 10)
		optionPadding.Parent = option

		option.MouseButton1Click:Connect(function()
			controller:SelectStation(index)
			setOpen(false)
		end)
	end

	toggleButton.MouseButton1Click:Connect(function()
		setOpen(not popout.Visible)
	end)
	scrim.MouseButton1Click:Connect(function()
		setOpen(false)
	end)

	refreshToggleText()
	controller.StationChanged:Connect(function()
		refreshToggleText()
		setOpen(false)
	end)

	return root
end

return BenchmarkSelector
