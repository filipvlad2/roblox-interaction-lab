-- Builds the Lab's ScreenGui shell and wires it to a LabController. The
-- Roblox world is the preview now: WorldStage is a full-screen, invisible
-- layer that variants mount into, not a boxed region of the screen. Every
-- variant already positions itself relative to the stage it's given (see
-- the station files under Stations/), so widening the stage to the whole
-- screen is what makes buttons, windows, and notifications land exactly
-- where they'd land in a real game, with no changes to variant code.
--
-- The Companion Panel is the only other thing this screen owns: a small,
-- draggable control surface that never claims the center of the screen and
-- leaves the rest of the viewport to the game (see CompanionPanel.lua).

local Players = game:GetService("Players")

local UIBuilder = require(script.Parent.Parent.Shared.UIBuilder)
local LabController = require(script.Parent.Parent.Shared.LabController)
local LabConfig = require(script.Parent.Parent.Config.LabConfig)

local CompanionPanel = require(script.Parent.Components.CompanionPanel)

local LabApp = {}

function LabApp.Start()
	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "InteractionLab"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local worldStage = UIBuilder.frame({
		Parent = screenGui,
		Name = "WorldStage",
		BackgroundTransparency = 1,
	})

	local controller = LabController.new(LabConfig.Stations)
	controller:SetStage(worldStage)

	CompanionPanel.Mount(screenGui, controller)

	controller:Start()

	screenGui.Parent = playerGui

	return controller
end

return LabApp
