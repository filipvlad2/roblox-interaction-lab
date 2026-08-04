local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local SHOW_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local HIDE_INFO = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local VISIBLE_DURATION = 1.6

local HIDDEN_POSITION = UDim2.new(0, 0, 0, -60)
local SHOWN_POSITION = UDim2.new(0, 0, 0, 0)

return {
	Name = "Banner",
	Description = "Full-width banner drops down from the top edge and retracts after a moment.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "TriggerButton",
			Text = "Show Notification",
			Size = UDim2.new(0, 200, 0, 48),
			Position = UDim2.fromScale(0.5, 0.6),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		local banner = UIBuilder.frame({
			Parent = stage,
			Name = "Banner",
			Size = UDim2.new(1, 0, 0, 56),
			Position = HIDDEN_POSITION,
			BackgroundColor3 = Theme.Colors.Accent,
		})

		UIBuilder.label({
			Parent = banner,
			Name = "Text",
			Text = "Update available - click to learn more",
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = Theme.FontBold,
		})

		local state = { Generation = 0 }

		local function show()
			state.Generation += 1
			local thisGeneration = state.Generation

			banner.Position = HIDDEN_POSITION
			TweenService:Create(banner, SHOW_INFO, { Position = SHOWN_POSITION }):Play()

			task.delay(VISIBLE_DURATION, function()
				if thisGeneration == state.Generation then
					TweenService:Create(banner, HIDE_INFO, { Position = HIDDEN_POSITION }):Play()
				end
			end)
		end

		local connection = triggerButton.MouseButton1Click:Connect(show)

		return { Banner = banner, Show = show, State = state, Connections = { connection } }
	end,

	Play = function(handle)
		handle.Show()
	end,

	Reset = function(handle)
		handle.State.Generation += 1
		handle.Banner.Position = HIDDEN_POSITION
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
