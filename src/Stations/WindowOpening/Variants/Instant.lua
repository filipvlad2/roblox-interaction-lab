local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

return {
	Name = "Instant",
	Description = "Baseline: window appears and disappears with no animation.",

	Mount = function(stage)
		local window = UIBuilder.frame({
			Parent = stage,
			Name = "Window",
			Size = UDim2.new(0, 320, 0, 200),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = window
		window.Visible = false

		local titleBar = UIBuilder.frame({
			Parent = window,
			Name = "TitleBar",
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundColor3 = Theme.Colors.PanelAlt,
		})
		UIBuilder.corner().Parent = titleBar

		UIBuilder.label({
			Parent = titleBar,
			Name = "Title",
			Text = "Window Title",
			Position = UDim2.new(0, 14, 0, 0),
			Size = UDim2.new(1, -60, 1, 0),
			Font = Theme.FontBold,
		})

		local closeButton = UIBuilder.button({
			Parent = titleBar,
			Name = "CloseButton",
			Text = "X",
			Size = UDim2.new(0, 32, 0, 32),
			Position = UDim2.new(1, -36, 0.5, -16),
			BackgroundColor3 = Theme.Colors.Background,
		})
		UIBuilder.corner().Parent = closeButton

		UIBuilder.label({
			Parent = window,
			Name = "Body",
			Text = "This window opened instantly, with no transition.",
			Position = UDim2.new(0, 14, 0, 52),
			Size = UDim2.new(1, -28, 1, -66),
			TextWrapped = true,
			TextColor3 = Theme.Colors.TextMuted,
			TextYAlignment = Enum.TextYAlignment.Top,
		})

		local openButton = UIBuilder.button({
			Parent = stage,
			Name = "OpenButton",
			Text = "Open Window",
			Size = UDim2.new(0, 180, 0, 48),
			Position = UDim2.fromScale(0.5, 0.85),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = openButton

		local connections = {
			openButton.MouseButton1Click:Connect(function()
				window.Visible = true
			end),
			closeButton.MouseButton1Click:Connect(function()
				window.Visible = false
			end),
		}

		return { Window = window, Connections = connections }
	end,

	Play = function(handle)
		handle.Window.Visible = false
		handle.Window.Visible = true
	end,

	Reset = function(handle)
		handle.Window.Visible = false
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
