-- Owns "which station / which variant is active" and drives the variant lifecycle
-- (Mount -> Play -> Reset -> Destroy). The UI layer only reacts to its signals;
-- it never mounts or tears down variants itself.

local Signal = require(script.Parent.Signal)

local LabController = {}
LabController.__index = LabController

function LabController.new(stations)
	local self = setmetatable({}, LabController)

	self._stations = stations
	self._stationIndex = 1
	self._variantIndex = 1
	self._stage = nil
	self._activeHandle = nil

	self.StationChanged = Signal.new()
	self.VariantChanged = Signal.new()

	return self
end

function LabController:SetStage(stage: Frame)
	self._stage = stage
end

function LabController:GetStations()
	return self._stations
end

function LabController:GetCurrentStation()
	return self._stations[self._stationIndex]
end

function LabController:GetCurrentVariant()
	return self:GetCurrentStation().Variants[self._variantIndex]
end

function LabController:SelectStation(index: number)
	if index == self._stationIndex then
		return
	end
	self._stationIndex = index
	self._variantIndex = 1
	self:_mountCurrentVariant()
	self.StationChanged:Fire(self:GetCurrentStation())
end

function LabController:SelectVariant(index: number)
	if index == self._variantIndex then
		return
	end
	self._variantIndex = index
	self:_mountCurrentVariant()
	self.VariantChanged:Fire(self:GetCurrentVariant())
end

function LabController:Replay()
	local variant = self:GetCurrentVariant()
	if self._activeHandle then
		variant.Play(self._activeHandle)
	end
end

function LabController:Reset()
	local variant = self:GetCurrentVariant()
	if self._activeHandle then
		variant.Reset(self._activeHandle)
	end
end

function LabController:_mountCurrentVariant()
	if not self._stage then
		return
	end

	if self._activeHandle then
		self._activeVariant.Destroy(self._activeHandle)
		self._activeHandle = nil
		self._activeVariant = nil
	end

	self._stage:ClearAllChildren()

	local variant = self:GetCurrentVariant()
	self._activeHandle = variant.Mount(self._stage)
	self._activeVariant = variant
end

function LabController:Start()
	self:_mountCurrentVariant()
end

return LabController
