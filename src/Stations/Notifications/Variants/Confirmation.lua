--[[
	Production identifier: NTF-001_GOLD.
	Design reference: Benchmarks/004_Notification/GOLD_DIRECTION.md (authoritative),
	closest to VISUAL_CONCEPT_REVIEW.md's Confirmation Variation A (Faithful).
	This is the first production-quality Notification for the Lab, not a
	prototype - see the Gold Direction's own wording.

	Non-negotiables carried over from the Gold Direction:
	- The signal appears at/beside the interacted element, never in a fixed,
	  disconnected screen location - see the badge being parented directly to
	  the trigger button below, rather than to `stage`.
	- One saturated color only (Theme.Colors.Success), no gold/festive tint.
	- No overshoot beyond a single controlled rise - a plain Quad Out scale,
	  not the chained-overshoot technique used by Premium Simulator and
	  RWD-001_GOLD, because Confirmation's whole premise is restraint, not
	  impact.
	- No particles, no glow/bloom - the badge is a flat fill, nothing more.
	- No text beyond the checkmark glyph itself.
	- Must still feel identical on the tenth replay as the first - see the
	  tween-tracking/cancellation below, the same pattern RWD-001_GOLD uses.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)
local AssetIds = require(Lab.Assets.AssetIds)

local BUTTON_SIZE = UDim2.new(0, 200, 0, 50)

-- The badge rises into place and later dissolves - two different exits on
-- purpose. Rising needs a little presence to register ("there"); leaving
-- should read as quietly resolving ("gone"), not as a second motion event
-- competing for attention. See GOLD_DIRECTION.md Section 6: "whichever
-- reads as less like an additional event."
local BADGE_DIAMETER = 24
local BADGE_MARGIN = 4
local BADGE_HIDDEN_SIZE = UDim2.fromOffset(0, 0)
local BADGE_SHOWN_SIZE = UDim2.fromOffset(BADGE_DIAMETER, BADGE_DIAMETER)
local BADGE_SHOW_INFO = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local BADGE_HOLD_DURATION = 0.45
local BADGE_HIDE_INFO = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

return {
	Name = "Confirmation",
	Description = "NTF-001_GOLD: a quiet checkmark badge anchored to the exact control the player just used.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "TriggerButton",
			Text = "Show Notification",
			Size = BUTTON_SIZE,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		-- Parented to the button itself, not to `stage` - this is what
		-- "anchored to the point of interaction" (Visual Priority #1)
		-- actually means in practice. The badge has no location of its own;
		-- it inherits the button's, permanently.
		local badge = UIBuilder.frame({
			Parent = triggerButton,
			Name = "ConfirmBadge",
			Size = BADGE_HIDDEN_SIZE,
			Position = UDim2.new(1, BADGE_MARGIN, 0, -BADGE_MARGIN),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Theme.Colors.Success,
		})
		badge.Visible = false
		UIBuilder.corner(UDim.new(1, 0)).Parent = badge

		local checkmark = UIBuilder.label({
			Parent = badge,
			Name = "Checkmark",
			Text = "\u{2713}",
			Font = Theme.FontBold,
			TextColor3 = Theme.Colors.Text,
			TextSize = 14,
			Size = UDim2.fromScale(1, 1),
			TextXAlignment = Enum.TextXAlignment.Center,
		})

		local sound = Instance.new("Sound")
		sound.Name = "ConfirmTick"
		sound.SoundId = AssetIds.Sounds.Notification
		sound.Volume = 0.5
		sound.Parent = SoundService

		local state = { Generation = 0 }
		local activeTweens = {}

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

		local function setIdleState()
			cancelActiveTweens()
			badge.Visible = false
			badge.Size = BADGE_HIDDEN_SIZE
			badge.BackgroundTransparency = 0
			checkmark.TextTransparency = 0
		end

		local function confirm()
			state.Generation += 1
			local generation = state.Generation

			setIdleState()
			badge.Visible = true
			sound:Play()

			local showTween = tweenProperty(badge, BADGE_SHOW_INFO, { Size = BADGE_SHOWN_SIZE })
			showTween.Completed:Connect(function(playbackState)
				if generation ~= state.Generation or playbackState ~= Enum.PlaybackState.Completed then
					return
				end

				task.delay(BADGE_HOLD_DURATION, function()
					if generation ~= state.Generation then
						return
					end

					local hideTween = tweenProperty(badge, BADGE_HIDE_INFO, { BackgroundTransparency = 1 })
					tweenProperty(checkmark, BADGE_HIDE_INFO, { TextTransparency = 1 })
					hideTween.Completed:Connect(function(hidePlaybackState)
						if generation ~= state.Generation or hidePlaybackState ~= Enum.PlaybackState.Completed then
							return
						end
						badge.Visible = false
						badge.Size = BADGE_HIDDEN_SIZE
					end)
				end)
			end)
		end

		local connection = triggerButton.MouseButton1Click:Connect(confirm)

		return {
			Confirm = confirm,
			SetIdleState = setIdleState,
			Sound = sound,
			State = state,
			Connections = { connection },
		}
	end,

	Play = function(handle)
		handle.Confirm()
	end,

	Reset = function(handle)
		handle.State.Generation += 1
		handle.SetIdleState()
	end,

	-- The Sound lives in SoundService, not under `stage` like everything else
	-- this variant creates, so it's the one thing LabController's
	-- stage:ClearAllChildren() won't sweep up for free between mounts - see
	-- the identical reasoning in RWD-001_GOLD's Destroy.
	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
		handle.Sound:Destroy()
	end,
}
