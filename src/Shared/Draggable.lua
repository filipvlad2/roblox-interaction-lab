-- Minimal drag-to-move helper for floating panels. `handle` is the region
-- that starts a drag (e.g. a title bar); `target` is the GuiObject that
-- actually moves. Works with mouse and touch, and clamps the target so at
-- least part of it always stays on screen - a floating panel that can be
-- dragged fully off-screen is a panel that's effectively been deleted.

local UserInputService = game:GetService("UserInputService")

local function isPointerDown(inputType: Enum.UserInputType)
	return inputType == Enum.UserInputType.MouseButton1 or inputType == Enum.UserInputType.Touch
end

local function isPointerMove(inputType: Enum.UserInputType)
	return inputType == Enum.UserInputType.MouseMovement or inputType == Enum.UserInputType.Touch
end

-- Scale * containerSize + Offset = the true absolute pixel value a UDim
-- coordinate represents. Everything below works in this single space so a
-- drag never mixes a Scale-relative reading with an Offset-only one.
local function toAbsolute(coordinate: UDim, containerSize: number)
	return coordinate.Scale * containerSize + coordinate.Offset
end

local Draggable = {}

function Draggable.enable(handle: GuiObject, target: GuiObject)
	local dragging = false
	local dragStart = Vector3.zero
	local startAbsoluteX = 0
	local startAbsoluteY = 0

	local function getScreenSize(): Vector2
		local screenGui = target.Parent
		if screenGui and screenGui:IsA("GuiBase2d") then
			return screenGui.AbsoluteSize
		end
		return Vector2.zero
	end

	local function clampToScreen(absoluteX: number, absoluteY: number)
		local screenSize = getScreenSize()
		local size = target.AbsoluteSize
		local anchor = target.AnchorPoint

		local minX = -size.X * anchor.X
		local maxX = screenSize.X - size.X * (1 - anchor.X)
		local minY = -size.Y * anchor.Y
		local maxY = screenSize.Y - size.Y * (1 - anchor.Y)

		local x = math.clamp(absoluteX, minX, math.max(minX, maxX))
		local y = math.clamp(absoluteY, minY, math.max(minY, maxY))

		return x, y
	end

	handle.InputBegan:Connect(function(input)
		if not isPointerDown(input.UserInputType) then
			return
		end

		dragging = true
		dragStart = input.Position

		-- Read the panel's current position in absolute pixels regardless of
		-- whether it's currently expressed with Scale (its default, anchored
		-- to an edge) or pure Offset (after a previous drag). Clamping a
		-- Scale-relative Offset as if it were already absolute - which the
		-- previous version of this file did - is what caused the panel to
		-- jump off-screen the instant a drag started: see
		-- InteractionLab/POST_PLAYTEST_REVIEW.md for the full root-cause
		-- writeup.
		local screenSize = getScreenSize()
		startAbsoluteX = toAbsolute(target.Position.X, screenSize.X)
		startAbsoluteY = toAbsolute(target.Position.Y, screenSize.Y)

		local endedConnection
		endedConnection = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				endedConnection:Disconnect()
			end
		end)
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not dragging or not isPointerMove(input.UserInputType) then
			return
		end

		local delta = input.Position - dragStart
		local x, y = clampToScreen(startAbsoluteX + delta.X, startAbsoluteY + delta.Y)
		target.Position = UDim2.new(0, x, 0, y)
	end)
end

return Draggable
