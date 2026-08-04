local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

local OPEN_INFO = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local CLOSE_INFO = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local OPEN_SIZE = UDim2.new(0, 320, 0, 200)
local CLOSED_SIZE = UDim2.new(0, 272, 0, 170)

return {
	Name = "FadeScale",
	Description = "Window fades in while scaling up from 85% size.",

	Mount = function(stage)
		local window = UIBuilder.frame({
			Parent = stage,
			Name = "Window",
			Size = CLOSED_SIZE,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.Panel,
			BackgroundTransparency = 1,
		})
		UIBuilder.corner().Parent = window
		window.Visible = false

		local titleBar = UIBuilder.frame({
			Parent = window,
			Name = "TitleBar",
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundColor3 = Theme.Colors.PanelAlt,
			BackgroundTransparency = 1,
		})
		UIBuilder.corner().Parent = titleBar

		UIBuilder.label({
			Parent = titleBar,
			Name = "Title",
			Text = "Window Title",
			Position = UDim2.new(0, 14, 0, 0),
			Size = UDim2.new(1, -60, 1, 0),
			Font = Theme.FontBold,
			TextTransparency = 1,
		})

		local closeButton = UIBuilder.button({
			Parent = titleBar,
			Name = "CloseButton",
			Text = "X",
			Size = UDim2.new(0, 32, 0, 32),
			Position = UDim2.new(1, -36, 0.5, -16),
			BackgroundColor3 = Theme.Colors.Background,
			TextColor3 = Theme.Colors.Text,
		})
		UIBuilder.corner().Parent = closeButton
		closeButton.BackgroundTransparency = 1
		closeButton.TextTransparency = 1

		local body = UIBuilder.label({
			Parent = window,
			Name = "Body",
			Text = "This window fades and scales in smoothly.",
			Position = UDim2.new(0, 14, 0, 52),
			Size = UDim2.new(1, -28, 1, -66),
			TextWrapped = true,
			TextColor3 = Theme.Colors.TextMuted,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextTransparency = 1,
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

		local function setClosedState()
			window.Visible = false
			window.Size = CLOSED_SIZE
			window.BackgroundTransparency = 1
			titleBar.BackgroundTransparency = 1
			closeButton.BackgroundTransparency = 1
			closeButton.TextTransparency = 1
			body.TextTransparency = 1
		end

		local function open()
			setClosedState()
			window.Visible = true
			TweenService:Create(window, OPEN_INFO, { Size = OPEN_SIZE, BackgroundTransparency = 0 }):Play()
			TweenService:Create(titleBar, OPEN_INFO, { BackgroundTransparency = 0 }):Play()
			TweenService:Create(closeButton, OPEN_INFO, { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
			TweenService:Create(body, OPEN_INFO, { TextTransparency = 0 }):Play()
		end

		local function close()
			TweenService:Create(window, CLOSE_INFO, { Size = CLOSED_SIZE, BackgroundTransparency = 1 }):Play()
			TweenService:Create(titleBar, CLOSE_INFO, { BackgroundTransparency = 1 }):Play()
			TweenService:Create(closeButton, CLOSE_INFO, { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
			TweenService:Create(body, CLOSE_INFO, { TextTransparency = 1 }):Play()
			task.delay(CLOSE_INFO.Time, function()
				if window.Parent then
					window.Visible = false
				end
			end)
		end

		local connections = {
			openButton.MouseButton1Click:Connect(open),
			closeButton.MouseButton1Click:Connect(close),
		}

		return { Window = window, Open = open, SetClosedState = setClosedState, Connections = connections }
	end,

	Play = function(handle)
		handle.Open()
	end,

	Reset = function(handle)
		handle.SetClosedState()
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
