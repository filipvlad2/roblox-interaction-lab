local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local SHOW_INFO = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local HIDE_INFO = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local VISIBLE_DURATION = 1.6

local HIDDEN_POSITION = UDim2.new(0.5, 0, 1, 40)
local SHOWN_POSITION = UDim2.new(0.5, 0, 1, -30)

return {
	Name = "Toast",
	Description = "Small toast slides up from the bottom edge and auto-dismisses after a moment.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "TriggerButton",
			Text = "Show Notification",
			Size = UDim2.new(0, 200, 0, 48),
			Position = UDim2.fromScale(0.5, 0.3),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		local toast = UIBuilder.frame({
			Parent = stage,
			Name = "Toast",
			Size = UDim2.new(0, 260, 0, 50),
			Position = HIDDEN_POSITION,
			AnchorPoint = Vector2.new(0.5, 1),
			BackgroundColor3 = Theme.Colors.PanelAlt,
		})
		UIBuilder.corner().Parent = toast

		UIBuilder.label({
			Parent = toast,
			Name = "Text",
			Text = "Saved successfully",
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Center,
		})

		local state = { Generation = 0 }

		local function show()
			state.Generation += 1
			local thisGeneration = state.Generation

			toast.Position = HIDDEN_POSITION
			TweenService:Create(toast, SHOW_INFO, { Position = SHOWN_POSITION }):Play()

			task.delay(VISIBLE_DURATION, function()
				if thisGeneration == state.Generation then
					TweenService:Create(toast, HIDE_INFO, { Position = HIDDEN_POSITION }):Play()
				end
			end)
		end

		local connection = triggerButton.MouseButton1Click:Connect(show)

		return { Toast = toast, Show = show, State = state, Connections = { connection } }
	end,

	Play = function(handle)
		handle.Show()
	end,

	Reset = function(handle)
		handle.State.Generation += 1
		handle.Toast.Position = HIDDEN_POSITION
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
