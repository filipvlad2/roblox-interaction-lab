-- Replay plus the three comparison-mode entry points. Only Replay is wired
-- up today; Compare, Blind Test, and Presentation Mode are visible,
-- correctly labeled placeholders (see IMPLEMENTATION_NOTES.md) so the panel
-- already shows its intended final shape without pretending unbuilt features
-- work. Reset is deliberately not present - the approved panel content list
-- doesn't include it.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local REPLAY_HEIGHT = 32
local SECONDARY_HEIGHT = 26
local ROW_GAP = 6
local SECONDARY_GAP = 6

local PLACEHOLDER_LABELS = { "Compare", "Blind Test", "Present" }

local ActionRow = {}
ActionRow.HEIGHT = REPLAY_HEIGHT + ROW_GAP + SECONDARY_HEIGHT

function ActionRow.Mount(parent, controller)
	local root = UIBuilder.frame({
		Parent = parent,
		Name = "ActionRow",
		Size = UDim2.new(1, 0, 0, ActionRow.HEIGHT),
		BackgroundTransparency = 1,
	})

	local replayButton = UIBuilder.button({
		Parent = root,
		Name = "ReplayButton",
		Text = "Replay",
		Size = UDim2.new(1, 0, 0, REPLAY_HEIGHT),
		BackgroundColor3 = Theme.Colors.Accent,
		TextSize = 14,
	})
	UIBuilder.corner(UDim.new(0, 6)).Parent = replayButton

	replayButton.MouseButton1Click:Connect(function()
		controller:Replay()
	end)

	local secondaryRow = UIBuilder.frame({
		Parent = root,
		Name = "SecondaryActions",
		Position = UDim2.new(0, 0, 0, REPLAY_HEIGHT + ROW_GAP),
		Size = UDim2.new(1, 0, 0, SECONDARY_HEIGHT),
		BackgroundTransparency = 1,
	})

	local secondaryLayout = Instance.new("UIListLayout")
	secondaryLayout.FillDirection = Enum.FillDirection.Horizontal
	secondaryLayout.Padding = UDim.new(0, SECONDARY_GAP)
	secondaryLayout.SortOrder = Enum.SortOrder.LayoutOrder
	secondaryLayout.Parent = secondaryRow

	-- Three equal-width slots that still add up to the full row width once
	-- the two inter-button gaps are subtracted: each slot is 1/3 of the row
	-- (Scale) minus its share of the gaps (Offset), so the layout doesn't
	-- overflow regardless of the panel's pixel width.
	local slotCount = #PLACEHOLDER_LABELS
	local slotScale = 1 / slotCount
	local slotOffset = -(SECONDARY_GAP * (slotCount - 1)) / slotCount

	for index, label in ipairs(PLACEHOLDER_LABELS) do
		local button = UIBuilder.button({
			Parent = secondaryRow,
			Name = label:gsub("%s", "") .. "Button",
			Text = label,
			Size = UDim2.new(slotScale, slotOffset, 1, 0),
			BackgroundColor3 = Theme.Colors.PanelAlt,
			TextColor3 = Theme.Colors.TextMuted,
			TextSize = 11,
		})
		button.LayoutOrder = index
		button.AutoButtonColor = false
		button.Active = false
		-- Deliberately ghosted, not just "a quieter button": PanelAlt at full
		-- opacity reads as an ordinary secondary control (like the benchmark
		-- selector's toggle), which invited clicking these expecting
		-- something to happen. Lower opacity on both layers reads as
		-- genuinely disabled at a glance instead.
		button.BackgroundTransparency = 0.5
		button.TextTransparency = 0.35
		UIBuilder.corner(UDim.new(0, 6)).Parent = button
	end

	return root
end

return ActionRow
