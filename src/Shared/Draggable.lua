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

local Draggable = {}

function Draggable.enable(handle: GuiObject, target: GuiObject)
	local dragging = false
	local dragStart = Vector3.zero
	local startPosition = target.Position

	local function clampToScreen(position: UDim2)
		local screenGui = target.Parent
		local screenSize = (screenGui and screenGui:IsA("GuiBase2d")) and screenGui.AbsoluteSize or Vector2.zero
		local size = target.AbsoluteSize
		local anchor = target.AnchorPoint

		local minX = -size.X * anchor.X
		local maxX = screenSize.X - size.X * (1 - anchor.X)
		local minY = -size.Y * anchor.Y
		local maxY = screenSize.Y - size.Y * (1 - anchor.Y)

		local x = math.clamp(position.X.Offset, minX, math.max(minX, maxX))
		local y = math.clamp(position.Y.Offset, minY, math.max(minY, maxY))

		return UDim2.new(0, x, 0, y)
	end

	handle.InputBegan:Connect(function(input)
		if not isPointerDown(input.UserInputType) then
			return
		end

		dragging = true
		dragStart = input.Position
		startPosition = target.Position

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
		local rawPosition = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
		target.Position = clampToScreen(rawPosition)
	end)
end

return Draggable
