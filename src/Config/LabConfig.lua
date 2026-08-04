-- Single source of truth for which stations exist and in what order they
-- appear in the sidebar. Add a new station by requiring it here.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")

local StationBase = require(Lab.Stations.StationBase)
local Stations = Lab.Stations

local LabConfig = {}

LabConfig.Stations = {
	StationBase.validateStation(require(Stations.Buttons)),
	StationBase.validateStation(require(Stations.WindowOpening)),
	StationBase.validateStation(require(Stations.Rewards)),
	StationBase.validateStation(require(Stations.ProgressBars)),
	StationBase.validateStation(require(Stations.Notifications)),
}

return LabConfig
