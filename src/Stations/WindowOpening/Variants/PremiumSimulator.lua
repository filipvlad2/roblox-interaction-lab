--[[
	Design reference: Window Opening Benchmark 001, Concept B ("Premium Simulator"),
	the recommended concept from the Interaction Lab creative review.

	Approved motion spec: 170-190ms total, scale 90% -> 103% -> 100%, exactly one
	overshoot, no secondary oscillation, no elastic bounce, decisive rather than
	springy. Approved visual spec: very light shadow lift, very subtle highlight,
	minimal background dim, no particles, no camera movement.

	Roblox's built-in Back easing style overshoots by a fixed, undocumented amount
	that can't be tuned to land exactly on 103%. To hit the approved keyframes
	precisely, the scale is driven by hand as two chained tweens (closed -> peak,
	then peak -> rest) instead of relying on a single built-in easing curve. Every
	tween below is driven by TweenService, which advances on elapsed real time, not
	frames, so this animation plays identically regardless of frame rate.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)

-- Motion timing (approved range: 170-190ms; 180ms sits at the midpoint).
local OPEN_DURATION = 0.18
local OVERSHOOT_SHARE = 0.65 -- fraction of OPEN_DURATION spent rising to the overshoot peak
local OVERSHOOT_DURATION = OPEN_DURATION * OVERSHOOT_SHARE
local SETTLE_DURATION = OPEN_DURATION - OVERSHOOT_DURATION

-- Closing motion isn't covered by the design reference (only opening is
-- specified). Kept quick and free of overshoot so it reads as the reverse of a
-- decisive action rather than a new, unspecified flourish.
local CLOSE_DURATION = 0.12

-- Scale keyframes: 90% -> 103% -> 100%.
local START_SCALE = 0.9
local PEAK_SCALE = 1.03
local REST_SCALE = 1.0

-- Position lift: window rises 6px into its resting place as it opens.
local LIFT_OFFSET = 6

-- Very light shadow lift and very subtle highlight - both stay mostly
-- transparent on purpose; these are polish, not focal points.
local SHADOW_PEAK_TRANSPARENCY = 0.88
local HIGHLIGHT_PEAK_TRANSPARENCY = 0.82

-- Minimal background dim - the stage behind the window must stay visibly present.
local DIM_PEAK_TRANSPARENCY = 0.9

-- Base window geometry the scale keyframes are relative to. 320x200 matches the
-- other Window Opening variants so a side-by-side comparison is judging motion
-- and polish only, not different window content.
local BASE_SIZE = UDim2.new(0, 320, 0, 200)
local REST_POSITION = UDim2.fromScale(0.5, 0.5)

local function sizeAtScale(scale: number)
	return UDim2.new(0, BASE_SIZE.X.Offset * scale, 0, BASE_SIZE.Y.Offset * scale)
end

local START_SIZE = sizeAtScale(START_SCALE)
local PEAK_SIZE = sizeAtScale(PEAK_SCALE)
local REST_SIZE = sizeAtScale(REST_SCALE)
local START_POSITION = REST_POSITION + UDim2.fromOffset(0, LIFT_OFFSET)

return {
	Name = "PremiumSimulator",
	Description = "Premium Simulator: a decisive pop with a single overshoot, very light shadow lift and minimal dim.",

	Mount = function(stage)
		local dimOverlay = UIBuilder.frame({
			Parent = stage,
			Name = "DimOverlay",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
		})
		dimOverlay.ZIndex = 1
		dimOverlay.Visible = false

		-- The shadow stays at rest size and only fades - it doesn't share the
		-- window's overshoot, so it reads as a stable base the window lands on
		-- rather than a second bouncing element.
		local shadow = UIBuilder.frame({
			Parent = stage,
			Name = "Shadow",
			Size = REST_SIZE,
			Position = REST_POSITION + UDim2.fromOffset(0, 4),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1,
		})
		shadow.ZIndex = 2
		shadow.Visible = false
		UIBuilder.corner().Parent = shadow

		local window = UIBuilder.frame({
			Parent = stage,
			Name = "Window",
			Size = START_SIZE,
			Position = START_POSITION,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.Panel,
			BackgroundTransparency = 1,
		})
		window.ZIndex = 3
		window.Visible = false
		UIBuilder.corner().Parent = window

		-- Very subtle warm highlight - a thin rim, never fully opaque.
		local highlight = Instance.new("UIStroke")
		highlight.Name = "Highlight"
		highlight.Color = Theme.Colors.AccentAlt
		highlight.Thickness = 1
		highlight.Transparency = 1
		highlight.Parent = window

		local titleBar = UIBuilder.frame({
			Parent = window,
			Name = "TitleBar",
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundColor3 = Theme.Colors.PanelAlt,
			BackgroundTransparency = 1,
		})
		UIBuilder.corner().Parent = titleBar

		local titleLabel = UIBuilder.label({
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
		})
		UIBuilder.corner().Parent = closeButton
		closeButton.BackgroundTransparency = 1
		closeButton.TextTransparency = 1

		local body = UIBuilder.label({
			Parent = window,
			Name = "Body",
			Text = "This window opens with a decisive pop and a single overshoot.",
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
		openButton.ZIndex = 4

		local state = { Generation = 0 }
		local activeTweens = {}

		-- Cancels any tweens left over from an interrupted open()/close() so a
		-- new call - or an instant Reset - always starts from a clean slate
		-- instead of fighting a still-running animation for the same properties.
		local function cancelActiveTweens()
			for _, tween in ipairs(activeTweens) do
				tween:Cancel()
			end
			table.clear(activeTweens)
		end

		local function tweenProperty(instance, info, goal)
			local tween = TweenService:Create(instance, info, goal)
			table.insert(activeTweens, tween)
			tween:Play()
			return tween
		end

		local function setClosedState()
			cancelActiveTweens()

			window.Visible = false
			shadow.Visible = false
			dimOverlay.Visible = false

			window.Size = START_SIZE
			window.Position = START_POSITION
			window.BackgroundTransparency = 1
			titleBar.BackgroundTransparency = 1
			titleLabel.TextTransparency = 1
			closeButton.BackgroundTransparency = 1
			closeButton.TextTransparency = 1
			body.TextTransparency = 1
			highlight.Transparency = 1
			shadow.BackgroundTransparency = 1
			dimOverlay.BackgroundTransparency = 1
		end

		-- Position, opacity, shadow, highlight and dim all move smoothly across
		-- the full open duration - only Size carries the approved overshoot
		-- keyframe, so it's the one property animated in two chained phases.
		local function open()
			state.Generation += 1
			local generation = state.Generation

			setClosedState()
			window.Visible = true
			shadow.Visible = true
			dimOverlay.Visible = true

			local revealInfo = TweenInfo.new(OPEN_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

			tweenProperty(window, revealInfo, { Position = REST_POSITION, BackgroundTransparency = 0 })
			tweenProperty(titleBar, revealInfo, { BackgroundTransparency = 0 })
			tweenProperty(titleLabel, revealInfo, { TextTransparency = 0 })
			tweenProperty(closeButton, revealInfo, { BackgroundTransparency = 0, TextTransparency = 0 })
			tweenProperty(body, revealInfo, { TextTransparency = 0 })
			tweenProperty(highlight, revealInfo, { Transparency = HIGHLIGHT_PEAK_TRANSPARENCY })
			tweenProperty(shadow, revealInfo, { BackgroundTransparency = SHADOW_PEAK_TRANSPARENCY })
			tweenProperty(dimOverlay, revealInfo, { BackgroundTransparency = DIM_PEAK_TRANSPARENCY })

			local overshootInfo = TweenInfo.new(OVERSHOOT_DURATION, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
			local settleInfo = TweenInfo.new(SETTLE_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

			local overshootTween = tweenProperty(window, overshootInfo, { Size = PEAK_SIZE })
			overshootTween.Completed:Connect(function(playbackState)
				-- Belt-and-suspenders alongside cancelActiveTweens(): a Cancelled
				-- tween fires Completed too, so this still needs to check both the
				-- generation and the playback state before chaining the settle phase.
				if generation ~= state.Generation or playbackState ~= Enum.PlaybackState.Completed then
					return
				end
				tweenProperty(window, settleInfo, { Size = REST_SIZE })
			end)
		end

		local function close()
			cancelActiveTweens()
			state.Generation += 1
			local generation = state.Generation

			local closeInfo = TweenInfo.new(CLOSE_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenProperty(window, closeInfo, {
				Size = START_SIZE,
				Position = START_POSITION,
				BackgroundTransparency = 1,
			})
			tweenProperty(titleBar, closeInfo, { BackgroundTransparency = 1 })
			tweenProperty(titleLabel, closeInfo, { TextTransparency = 1 })
			tweenProperty(closeButton, closeInfo, { BackgroundTransparency = 1, TextTransparency = 1 })
			tweenProperty(body, closeInfo, { TextTransparency = 1 })
			tweenProperty(highlight, closeInfo, { Transparency = 1 })
			tweenProperty(shadow, closeInfo, { BackgroundTransparency = 1 })
			tweenProperty(dimOverlay, closeInfo, { BackgroundTransparency = 1 })

			task.delay(CLOSE_DURATION, function()
				if generation == state.Generation and window.Parent then
					window.Visible = false
					shadow.Visible = false
					dimOverlay.Visible = false
				end
			end)
		end

		local connections = {
			openButton.MouseButton1Click:Connect(open),
			closeButton.MouseButton1Click:Connect(close),
		}

		return {
			Open = open,
			SetClosedState = setClosedState,
			State = state,
			Connections = connections,
		}
	end,

	Play = function(handle)
		handle.Open()
	end,

	Reset = function(handle)
		handle.State.Generation += 1
		handle.SetClosedState()
	end,

	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
	end,
}
