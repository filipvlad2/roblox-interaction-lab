local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local OPEN_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local CLOSE_INFO = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local OPEN_POSITION = UDim2.fromScale(0.5, 0.5)
local CLOSED_POSITION = UDim2.fromScale(0.5, 1.3)

return {
	Name = "SlideIn",
	Description = "Window slides up from below the stage and settles with a slight overshoot.",

	Mount = function(stage)
		local window = UIBuilder.frame({
			Parent = stage,
			Name = "Window",
			Size = UDim2.new(0, 320, 0, 200),
			Position = CLOSED_POSITION,
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
			Text = "This window slides in from below with a slight overshoot.",
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

		local function open()
			window.Visible = true
			window.Position = CLOSED_POSITION
			TweenService:Create(window, OPEN_INFO, { Position = OPEN_POSITION }):Play()
		end

		local function close()
			local tween = TweenService:Create(window, CLOSE_INFO, { Position = CLOSED_POSITION })
			tween.Completed:Connect(function()
				window.Visible = false
			end)
			tween:Play()
		end

		local connections = {
			openButton.MouseButton1Click:Connect(open),
			closeButton.MouseButton1Click:Connect(close),
		}

		return { Window = window, Open = open, Connections = connections }
	end,

	Play = function(handle)
		handle.Open()
	end,

	Reset = function(handle)
		handle.Window.Visible = false
		handle.Window.Position = CLOSED_POSITION
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
