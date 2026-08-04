--[[
	Production identifier: RWD-001_GOLD.
	Design reference: Benchmarks/003_Reward_Reveal/GOLD_DIRECTION.md (authoritative)
	and VISUAL_CONCEPTS.md's "Satisfying" concept, Variation A with the docking
	idea borrowed from Variation C. This is the first production-quality Reward
	Reveal for the Lab, not a prototype - see the Gold Direction's own wording.

	Non-negotiables carried over from the Gold Direction:
	- One unbroken beat: instant arrival, no anticipation pause, fast settle.
	- The icon is never obscured by the flash or particles, even briefly.
	- No text or copy anywhere in the reveal.
	- The flash is a camera-flash hit, not a lingering glow.
	- Must still feel identical on the tenth replay as the first - see the
	  tween-tracking/cancellation below, which exists specifically for that.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lab = ReplicatedStorage:WaitForChild("Lab")
local Theme = require(Lab.Shared.Theme)
local UIBuilder = require(Lab.Shared.UIBuilder)
local AssetIds = require(Lab.Assets.AssetIds)

-- Motion: fast, single beat. The overshoot is driven as two chained tweens
-- rather than Roblox's built-in Back/Elastic easing, same reasoning as the
-- Window Opening station's Premium Simulator variant - the built-in curves
-- overshoot by an undocumented, uncontrollable amount, and "sharp and
-- decisive rather than floaty" needs a controlled peak.
local SNAP_DURATION = 0.16
local OVERSHOOT_SHARE = 0.6
local OVERSHOOT_DURATION = SNAP_DURATION * OVERSHOOT_SHARE
local SETTLE_DURATION = SNAP_DURATION - OVERSHOOT_DURATION

local FLASH_DURATION = 0.1
local FLASH_PEAK_TRANSPARENCY = 0.1
local PARTICLE_DURATION = 0.14
local PARTICLE_COUNT = 6
local PARTICLE_TRAVEL_DISTANCE = 26
local PARTICLE_SIZE = 5

local DOCK_DURATION = 0.12

-- Icon arrives already at less than rest scale and overshoots past it - see
-- the Gold Reference: "appears already in motion," never grows from nothing.
local ICON_DIAMETER = 56
local ICON_START_SCALE = 0.85
local ICON_PEAK_SCALE = 1.08
local ICON_REST_SCALE = 1.0
local FLASH_DIAMETER = ICON_DIAMETER * 1.5

local COUNTER_DIAMETER = 28
local COUNTER_MARGIN = 24

return {
	Name = "Satisfying",
	Description = "RWD-001_GOLD: a fast, tight snap-and-flash reveal built to repeat hundreds of times without becoming tiring.",

	Mount = function(stage)
		local triggerButton = UIBuilder.button({
			Parent = stage,
			Name = "ClaimButton",
			Text = "Claim Reward",
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.fromScale(0.5, 0.75),
			AnchorPoint = Vector2.new(0.5, 0.5),
		})
		UIBuilder.corner().Parent = triggerButton

		-- Docking target. Standalone in this Lab benchmark there's no real
		-- inventory/currency counter to land in, so this is a stand-in for
		-- wherever a real HUD's counter would be - see the self-review for
		-- why a fake, labeled counter wasn't built instead.
		local counter = UIBuilder.frame({
			Parent = stage,
			Name = "Counter",
			Size = UDim2.fromOffset(COUNTER_DIAMETER, COUNTER_DIAMETER),
			Position = UDim2.new(1, -COUNTER_MARGIN, 0, COUNTER_MARGIN),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Theme.Colors.PanelAlt,
		})
		UIBuilder.corner(UDim.new(1, 0)).Parent = counter

		local effectContainer = UIBuilder.frame({
			Parent = stage,
			Name = "EffectContainer",
			Size = UDim2.fromOffset(1, 1),
			Position = UDim2.fromScale(0.5, 0.35),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
		})

		-- Flash sits behind the icon (lower ZIndex) so the icon is never
		-- obscured by it, even for a single frame.
		local flash = UIBuilder.frame({
			Parent = effectContainer,
			Name = "Flash",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(FLASH_DIAMETER, FLASH_DIAMETER),
			BackgroundColor3 = Theme.Colors.AccentAlt,
			BackgroundTransparency = 1,
		})
		flash.ZIndex = 1
		flash.Visible = false
		UIBuilder.corner(UDim.new(1, 0)).Parent = flash

		local icon = UIBuilder.frame({
			Parent = effectContainer,
			Name = "Icon",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(ICON_DIAMETER * ICON_START_SCALE, ICON_DIAMETER * ICON_START_SCALE),
			BackgroundColor3 = Theme.Colors.AccentAlt,
		})
		icon.ZIndex = 2
		icon.Visible = false
		UIBuilder.corner(UDim.new(1, 0)).Parent = icon

		-- A small offset highlight sells "glossy" without any real material/
		-- lighting simulation, which Roblox UI can't do anyway.
		local highlight = Instance.new("Frame")
		highlight.Name = "Highlight"
		highlight.AnchorPoint = Vector2.new(0.5, 0.5)
		highlight.Position = UDim2.fromScale(0.32, 0.3)
		highlight.Size = UDim2.fromScale(0.34, 0.34)
		highlight.BackgroundColor3 = Theme.Colors.Text
		highlight.BackgroundTransparency = 0.55
		highlight.BorderSizePixel = 0
		highlight.ZIndex = 3
		highlight.Parent = icon
		UIBuilder.corner(UDim.new(1, 0)).Parent = highlight

		local sound = Instance.new("Sound")
		sound.Name = "RewardSnap"
		sound.SoundId = AssetIds.Sounds.RewardSnap
		sound.Volume = 0.6
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

			icon.Visible = false
			icon.BackgroundTransparency = 0
			icon.Size = UDim2.fromOffset(ICON_DIAMETER * ICON_START_SCALE, ICON_DIAMETER * ICON_START_SCALE)
			icon.Position = UDim2.fromScale(0.5, 0.5)

			flash.Visible = false
			flash.BackgroundTransparency = 1

			for _, child in ipairs(effectContainer:GetChildren()) do
				if child.Name == "Particle" then
					child:Destroy()
				end
			end
		end

		local function spawnParticles()
			for i = 1, PARTICLE_COUNT do
				local angle = (i / PARTICLE_COUNT) * math.pi * 2
				local edgeRadius = (ICON_DIAMETER * ICON_START_SCALE) / 2

				local particle = Instance.new("Frame")
				particle.Name = "Particle"
				particle.AnchorPoint = Vector2.new(0.5, 0.5)
				particle.Position = UDim2.new(
					0.5,
					math.cos(angle) * edgeRadius,
					0.5,
					math.sin(angle) * edgeRadius
				)
				particle.Size = UDim2.fromOffset(PARTICLE_SIZE, PARTICLE_SIZE)
				particle.BackgroundColor3 = Theme.Colors.AccentAlt
				particle.BackgroundTransparency = 0
				particle.BorderSizePixel = 0
				particle.ZIndex = 1
				particle.Parent = effectContainer
				UIBuilder.corner(UDim.new(1, 0)).Parent = particle

				local targetDistance = edgeRadius + PARTICLE_TRAVEL_DISTANCE
				local particleInfo = TweenInfo.new(PARTICLE_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local tween = tweenProperty(particle, particleInfo, {
					Position = UDim2.new(0.5, math.cos(angle) * targetDistance, 0.5, math.sin(angle) * targetDistance),
					BackgroundTransparency = 1,
				})
				tween.Completed:Connect(function()
					particle:Destroy()
				end)
			end
		end

		local function claim()
			state.Generation += 1
			local generation = state.Generation

			setIdleState()
			icon.Visible = true
			flash.Visible = true
			flash.BackgroundTransparency = FLASH_PEAK_TRANSPARENCY

			sound:Play()
			spawnParticles()

			local flashInfo = TweenInfo.new(FLASH_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			tweenProperty(flash, flashInfo, { BackgroundTransparency = 1 })

			local overshootInfo = TweenInfo.new(OVERSHOOT_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local settleInfo = TweenInfo.new(SETTLE_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local peakSize = UDim2.fromOffset(ICON_DIAMETER * ICON_PEAK_SCALE, ICON_DIAMETER * ICON_PEAK_SCALE)
			local restSize = UDim2.fromOffset(ICON_DIAMETER * ICON_REST_SCALE, ICON_DIAMETER * ICON_REST_SCALE)

			local overshootTween = tweenProperty(icon, overshootInfo, { Size = peakSize })
			overshootTween.Completed:Connect(function(playbackState)
				if generation ~= state.Generation or playbackState ~= Enum.PlaybackState.Completed then
					return
				end

				local settleTween = tweenProperty(icon, settleInfo, { Size = restSize })
				settleTween.Completed:Connect(function(settlePlaybackState)
					if generation ~= state.Generation or settlePlaybackState ~= Enum.PlaybackState.Completed then
						return
					end

					-- Dock: the icon travels to the counter and is absorbed.
					-- Brief and secondary to the snap itself, per the Gold
					-- Direction - this is the only thing allowed to linger,
					-- and only slightly.
					local dockInfo = TweenInfo.new(DOCK_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
					local dockTween = tweenProperty(icon, dockInfo, {
						Position = UDim2.fromOffset(
							counter.AbsolutePosition.X + counter.AbsoluteSize.X / 2 - effectContainer.AbsolutePosition.X,
							counter.AbsolutePosition.Y + counter.AbsoluteSize.Y / 2 - effectContainer.AbsolutePosition.Y
						),
						Size = UDim2.fromOffset(COUNTER_DIAMETER * 0.5, COUNTER_DIAMETER * 0.5),
						BackgroundTransparency = 1,
					})
					dockTween.Completed:Connect(function(dockPlaybackState)
						if generation ~= state.Generation or dockPlaybackState ~= Enum.PlaybackState.Completed then
							return
						end
						icon.Visible = false
					end)
				end)
			end)
		end

		local connection = triggerButton.MouseButton1Click:Connect(claim)

		return {
			Claim = claim,
			SetIdleState = setIdleState,
			Sound = sound,
			State = state,
			Connections = { connection },
		}
	end,

	Play = function(handle)
		handle.Claim()
	end,

	Reset = function(handle)
		handle.State.Generation += 1
		handle.SetIdleState()
	end,

	-- The Sound lives in SoundService, not under `stage` like every other
	-- instance this variant creates, so it's the one thing LabController's
	-- stage:ClearAllChildren() won't sweep up for free between mounts. It
	-- has to be cleaned up explicitly here or it leaks one Sound instance
	-- into SoundService every time this variant is mounted and left behind.
	Destroy = function(handle)
		for _, connection in ipairs(handle.Connections) do
			connection:Disconnect()
		end
		handle.Sound:Destroy()
	end,
}
