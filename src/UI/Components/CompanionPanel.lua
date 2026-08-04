-- The floating companion: a compact, draggable, collapsible control surface
-- that sits alongside the game instead of covering it. It only ever
-- controls the benchmark running out in the world - it never hosts a
-- preview of its own (see WorldStage in LabApp.lua).
--
-- Three states, deliberately distinct:
--   Expanded  - full panel: title bar + benchmark/variant selectors + actions.
--   Collapsed - title bar only, body hidden. A lighter touch than minimizing.
--   Minimized - the whole panel shrinks to a small pill naming the current
--               benchmark; clicking it restores whichever of the above two
--               states was active before minimizing.
-- The panel Frame instance itself is created once and never destroyed, so
-- its dragged Position is naturally remembered for the rest of the session
-- without any extra bookkeeping.

local UserInputService = game:GetService("UserInputService")

local Theme = require(script.Parent.Parent.Parent.Shared.Theme)
local UIBuilder = require(script.Parent.Parent.Parent.Shared.UIBuilder)
local Draggable = require(script.Parent.Parent.Parent.Shared.Draggable)

local BenchmarkSelector = require(script.Parent.BenchmarkSelector)
local VariantSelector = require(script.Parent.VariantSelector)
local ActionRow = require(script.Parent.ActionRow)

-- Bottom-left, and small: every current benchmark positions its content
-- centered or against a different edge (see IMPLEMENTATION_NOTES.md for the
-- collision check), so this corner stays clear of all of them by default.
-- Still fully draggable if a future benchmark ever wants this corner too.
local PANEL_WIDTH = 280
local SCREEN_MARGIN = 16

local TITLE_BAR_HEIGHT = 32
local TITLE_BUTTON_WIDTH = 34
local TITLE_BUTTON_GAP = 4
local TITLE_BUTTON_COUNT = 3
local TITLE_BUTTONS_RIGHT_MARGIN = 8

-- Drag affordance: a small always-visible grip and a subtle hover tint on
-- the draggable region, so "this moves the panel" reads at a glance without
-- adding a border or icon that competes with the title text.
local GRIP_DOT_SIZE = 3
local GRIP_DOT_GAP = 3
local HOVER_TINT_TRANSPARENCY = 0.88

local BODY_PADDING = 10
local ROW_GAP = 8

local CHIP_WIDTH = 220
local CHIP_HEIGHT = 28

local BODY_HEIGHT = BODY_PADDING * 2
	+ BenchmarkSelector.HEIGHT
	+ ROW_GAP
	+ VariantSelector.HEIGHT
	+ ROW_GAP
	+ ActionRow.HEIGHT

local EXPANDED_HEIGHT = TITLE_BAR_HEIGHT + BODY_HEIGHT
local COLLAPSED_HEIGHT = TITLE_BAR_HEIGHT

local TITLE_BUTTONS_WIDTH = TITLE_BUTTON_WIDTH * TITLE_BUTTON_COUNT
	+ TITLE_BUTTON_GAP * (TITLE_BUTTON_COUNT - 1)

local CompanionPanel = {}

local function makeTitleButton(parent, text, layoutOrder)
	local button = UIBuilder.button({
		Parent = parent,
		Name = text .. "Button",
		Text = text,
		Size = UDim2.new(0, TITLE_BUTTON_WIDTH, 1, 0),
		BackgroundColor3 = Theme.Colors.Background,
		TextColor3 = Theme.Colors.TextMuted,
		TextSize = 11,
	})
	button.LayoutOrder = layoutOrder
	UIBuilder.corner(UDim.new(0, 4)).Parent = button
	return button
end

function CompanionPanel.Mount(parent, controller)
	local panel = UIBuilder.frame({
		Parent = parent,
		Name = "CompanionPanel",
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, SCREEN_MARGIN, 1, -SCREEN_MARGIN),
		Size = UDim2.new(0, PANEL_WIDTH, 0, EXPANDED_HEIGHT),
		BackgroundColor3 = Theme.Colors.Panel,
	})
	panel.ZIndex = 10
	UIBuilder.corner().Parent = panel

	-- Title bar --------------------------------------------------------
	local titleBar = UIBuilder.frame({
		Parent = panel,
		Name = "TitleBar",
		Size = UDim2.new(1, 0, 0, TITLE_BAR_HEIGHT),
		BackgroundColor3 = Theme.Colors.PanelAlt,
	})

	local dragHandle = UIBuilder.frame({
		Parent = titleBar,
		Name = "DragHandle",
		Size = UDim2.new(1, -(TITLE_BUTTONS_WIDTH + TITLE_BUTTONS_RIGHT_MARGIN + 4), 1, 0),
		BackgroundTransparency = 1,
	})
	UIBuilder.corner(UDim.new(0, 6)).Parent = dragHandle

	-- Grip dots (always visible) plus a hover tint make "this area drags the
	-- panel" legible at a glance, without adding a border, icon font, or
	-- anything that competes with the title text for attention.
	local gripDots = UIBuilder.frame({
		Parent = dragHandle,
		Name = "GripDots",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 10, 0.5, 0),
		Size = UDim2.new(0, GRIP_DOT_SIZE * 3 + GRIP_DOT_GAP * 2, 0, GRIP_DOT_SIZE),
		BackgroundTransparency = 1,
	})
	local gripDotsLayout = Instance.new("UIListLayout")
	gripDotsLayout.FillDirection = Enum.FillDirection.Horizontal
	gripDotsLayout.Padding = UDim.new(0, GRIP_DOT_GAP)
	gripDotsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	gripDotsLayout.Parent = gripDots
	for dotIndex = 1, 3 do
		local dot = Instance.new("Frame")
		dot.Name = "Dot" .. dotIndex
		dot.LayoutOrder = dotIndex
		dot.Size = UDim2.fromOffset(GRIP_DOT_SIZE, GRIP_DOT_SIZE)
		dot.BackgroundColor3 = Theme.Colors.TextMuted
		dot.BorderSizePixel = 0
		dot.Parent = gripDots
		UIBuilder.corner(UDim.new(1, 0)).Parent = dot
	end

	UIBuilder.label({
		Parent = dragHandle,
		Name = "Title",
		Text = "Interaction Lab",
		Position = UDim2.new(0, 10 + GRIP_DOT_SIZE * 3 + GRIP_DOT_GAP * 2 + 8, 0, 0),
		Size = UDim2.new(1, -(10 + GRIP_DOT_SIZE * 3 + GRIP_DOT_GAP * 2 + 8), 1, 0),
		Font = Theme.FontBold,
		TextSize = 13,
	})

	dragHandle.MouseEnter:Connect(function()
		dragHandle.BackgroundTransparency = HOVER_TINT_TRANSPARENCY
		dragHandle.BackgroundColor3 = Theme.Colors.Background
	end)
	dragHandle.MouseLeave:Connect(function()
		dragHandle.BackgroundTransparency = 1
	end)

	local titleButtons = UIBuilder.frame({
		Parent = titleBar,
		Name = "TitleButtons",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -TITLE_BUTTONS_RIGHT_MARGIN, 0.5, 0),
		Size = UDim2.new(0, TITLE_BUTTONS_WIDTH, 0, TITLE_BAR_HEIGHT - 8),
		BackgroundTransparency = 1,
	})
	local titleButtonsLayout = Instance.new("UIListLayout")
	titleButtonsLayout.FillDirection = Enum.FillDirection.Horizontal
	titleButtonsLayout.Padding = UDim.new(0, TITLE_BUTTON_GAP)
	titleButtonsLayout.SortOrder = Enum.SortOrder.LayoutOrder
	titleButtonsLayout.Parent = titleButtons

	local collapseButton = makeTitleButton(titleButtons, "Less", 1)
	local minimizeButton = makeTitleButton(titleButtons, "Min", 2)
	local settingsButton = makeTitleButton(titleButtons, "...", 3)
	-- Ghosted rather than just inactive: at matching opacity to the working
	-- Less/Min buttons next to it, an inert button gives no feedback when
	-- clicked and reads as broken rather than "not built yet."
	settingsButton.Active = false
	settingsButton.BackgroundTransparency = 0.5
	settingsButton.TextTransparency = 0.35

	-- Body ---------------------------------------------------------------
	local body = UIBuilder.frame({
		Parent = panel,
		Name = "Body",
		Position = UDim2.new(0, 0, 0, TITLE_BAR_HEIGHT),
		Size = UDim2.new(1, 0, 0, BODY_HEIGHT),
		BackgroundTransparency = 1,
	})
	local bodyPadding = Instance.new("UIPadding")
	bodyPadding.PaddingTop = UDim.new(0, BODY_PADDING)
	bodyPadding.PaddingBottom = UDim.new(0, BODY_PADDING)
	bodyPadding.PaddingLeft = UDim.new(0, BODY_PADDING)
	bodyPadding.PaddingRight = UDim.new(0, BODY_PADDING)
	bodyPadding.Parent = body
	local bodyLayout = Instance.new("UIListLayout")
	bodyLayout.Padding = UDim.new(0, ROW_GAP)
	bodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
	bodyLayout.Parent = body

	local benchmarkRow = BenchmarkSelector.Mount(body, controller)
	benchmarkRow.LayoutOrder = 1
	local variantRow = VariantSelector.Mount(body, controller)
	variantRow.LayoutOrder = 2
	local actionRow = ActionRow.Mount(body, controller)
	actionRow.LayoutOrder = 3

	-- Minimized chip -------------------------------------------------------
	local chip = UIBuilder.button({
		Parent = panel,
		Name = "Chip",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme.Colors.Panel,
		TextSize = 12,
	})
	chip.TextXAlignment = Enum.TextXAlignment.Left
	chip.TextTruncate = Enum.TextTruncate.AtEnd
	chip.Visible = false
	UIBuilder.corner().Parent = chip
	local chipPadding = Instance.new("UIPadding")
	chipPadding.PaddingLeft = UDim.new(0, 10)
	chipPadding.PaddingRight = UDim.new(0, 10)
	chipPadding.Parent = chip

	chip.MouseEnter:Connect(function()
		chip.BackgroundColor3 = Theme.Colors.PanelAlt
	end)
	chip.MouseLeave:Connect(function()
		chip.BackgroundColor3 = Theme.Colors.Panel
	end)

	Draggable.enable(dragHandle, panel)
	Draggable.enable(chip, panel)

	-- State ----------------------------------------------------------------
	local uiState = { collapsed = false, minimized = false }

	local function currentLabel()
		local station = controller:GetCurrentStation()
		local variant = controller:GetCurrentVariant()
		return station.Name .. " \226\128\148 " .. variant.Name
	end

	local function applyState()
		if uiState.minimized then
			titleBar.Visible = false
			body.Visible = false
			chip.Visible = true
			chip.Text = currentLabel()
			panel.Size = UDim2.new(0, CHIP_WIDTH, 0, CHIP_HEIGHT)
		elseif uiState.collapsed then
			titleBar.Visible = true
			body.Visible = false
			chip.Visible = false
			panel.Size = UDim2.new(0, PANEL_WIDTH, 0, COLLAPSED_HEIGHT)
		else
			titleBar.Visible = true
			body.Visible = true
			chip.Visible = false
			panel.Size = UDim2.new(0, PANEL_WIDTH, 0, EXPANDED_HEIGHT)
		end
		collapseButton.Text = uiState.collapsed and "More" or "Less"
	end

	collapseButton.MouseButton1Click:Connect(function()
		uiState.collapsed = not uiState.collapsed
		applyState()
	end)

	minimizeButton.MouseButton1Click:Connect(function()
		uiState.minimized = true
		applyState()
	end)

	chip.MouseButton1Click:Connect(function()
		uiState.minimized = false
		applyState()
	end)

	controller.StationChanged:Connect(function()
		if uiState.minimized then
			chip.Text = currentLabel()
		end
	end)
	controller.VariantChanged:Connect(function()
		if uiState.minimized then
			chip.Text = currentLabel()
		end
	end)

	-- F8 hides or restores the whole panel, independent of expanded/
	-- collapsed/minimized - a way to get the Lab fully out of the way (for a
	-- screenshot, a demo, or just a clean look at the game) without losing
	-- whatever state it was left in. Ignores input already claimed by
	-- another UI element (typing in a chat box, a TextBox, etc.) so it never
	-- fires while the player is typing "F8" as part of something else.
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent then
			return
		end
		if input.KeyCode == Enum.KeyCode.F8 then
			panel.Visible = not panel.Visible
		end
	end)

	applyState()

	return panel
end

return CompanionPanel
