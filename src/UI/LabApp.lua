-- Builds the lab's ScreenGui shell (sidebar, header, stage, control bar) and
-- wires it to a LabController. This is the only place the overall layout lives;
-- stations and variants only ever draw inside the "stage" frame they're given.

local Players = game:GetService("Players")

local Theme = require(script.Parent.Parent.Shared.Theme)
local UIBuilder = require(script.Parent.Parent.Shared.UIBuilder)
local LabController = require(script.Parent.Parent.Shared.LabController)
local LabConfig = require(script.Parent.Parent.Config.LabConfig)

local Sidebar = require(script.Parent.Components.Sidebar)
local VariantSwitcher = require(script.Parent.Components.VariantSwitcher)
local ControlBar = require(script.Parent.Components.ControlBar)

local SIDEBAR_WIDTH = 220
local HEADER_HEIGHT = 90
local CONTROL_BAR_HEIGHT = 80

local LabApp = {}

function LabApp.Start()
	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "InteractionLab"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local root = UIBuilder.frame({
		Name = "Root",
		Parent = screenGui,
		BackgroundColor3 = Theme.Colors.Background,
	})

	local sidebarFrame = UIBuilder.frame({
		Name = "Sidebar",
		Parent = root,
		Size = UDim2.new(0, SIDEBAR_WIDTH, 1, 0),
		BackgroundColor3 = Theme.Colors.Panel,
	})

	local mainColumn = UIBuilder.frame({
		Name = "Main",
		Parent = root,
		Position = UDim2.new(0, SIDEBAR_WIDTH, 0, 0),
		Size = UDim2.new(1, -SIDEBAR_WIDTH, 1, 0),
		BackgroundColor3 = Theme.Colors.Background,
	})

	local header = UIBuilder.frame({
		Name = "Header",
		Parent = mainColumn,
		Size = UDim2.new(1, 0, 0, HEADER_HEIGHT),
		BackgroundColor3 = Theme.Colors.Background,
	})

	local stage = UIBuilder.frame({
		Name = "Stage",
		Parent = mainColumn,
		Position = UDim2.new(0, 0, 0, HEADER_HEIGHT),
		Size = UDim2.new(1, 0, 1, -(HEADER_HEIGHT + CONTROL_BAR_HEIGHT)),
		BackgroundColor3 = Theme.Colors.PanelAlt,
	})
	UIBuilder.corner().Parent = stage
	stage.ClipsDescendants = true

	local controlBarFrame = UIBuilder.frame({
		Name = "ControlBar",
		Parent = mainColumn,
		Position = UDim2.new(0, 0, 1, -CONTROL_BAR_HEIGHT),
		Size = UDim2.new(1, 0, 0, CONTROL_BAR_HEIGHT),
		BackgroundColor3 = Theme.Colors.Background,
	})

	local controller = LabController.new(LabConfig.Stations)
	controller:SetStage(stage)

	Sidebar.Mount(sidebarFrame, controller)
	VariantSwitcher.Mount(header, controller)
	ControlBar.Mount(controlBarFrame, controller)

	controller:Start()

	screenGui.Parent = playerGui

	return controller
end

return LabApp
