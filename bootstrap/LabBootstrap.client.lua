local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lab = ReplicatedStorage:WaitForChild("Lab")

local LabApp = require(Lab.UI.LabApp)

LabApp.Start()
