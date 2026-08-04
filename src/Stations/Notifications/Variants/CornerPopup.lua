local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local SHOW_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local HIDE_INFO = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local VISIBLE_DURATION = 1.8
local CARD_SIZE = UDim2.fromOffset(220, 60)
local EMPTY_SIZE = UDim2.fromOffset(0, 0)

return {
	Name = "CornerPopup",
	Description = "Card scales in from the top-right corner and shrinks away after a moment.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "TriggerButton",
			Text = "Show Notification",
			Size = UDim2.new(0, 200, 0, 48),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		local card = UIBuilder.frame({
			Parent = stage,
			Name = "Card",
			Size = EMPTY_SIZE,
			Position = UDim2.new(1, -20, 0, 20),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Theme.Colors.PanelAlt,
		})
		UIBuilder.corner().Parent = card

		UIBuilder.label({
			Parent = card,
			Name = "Text",
			Text = "New message received",
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextWrapped = true,
		})

		local state = { Generation = 0 }

		local function show()
			state.Generation += 1
			local thisGeneration = state.Generation

			card.Size = EMPTY_SIZE
			TweenService:Create(card, SHOW_INFO, { Size = CARD_SIZE }):Play()

			task.delay(VISIBLE_DURATION, function()
				if thisGeneration == state.Generation then
					TweenService:Create(card, HIDE_INFO, { Size = EMPTY_SIZE }):Play()
				end
			end)
		end

		local connection = triggerButton.MouseButton1Click:Connect(show)

		return { Card = card, Show = show, State = state, Connections = { connection } }
	end,

	Play = function(handle)
		handle.Show()
	end,

	Reset = function(handle)
		handle.State.Generation += 1
		handle.Card.Size = EMPTY_SIZE
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
