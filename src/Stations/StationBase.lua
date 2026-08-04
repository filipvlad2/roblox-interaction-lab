--[[
	Contract every station variant must satisfy:

	{
		Name = string,
		Description = string?,
		Mount = (stage: Frame) -> handle,
		Play = (handle) -> (),
		Reset = (handle) -> (),
		Destroy = (handle) -> (),
	}

	Mount builds the variant's instances under `stage` and returns an opaque
	`handle` (whatever state the variant needs). Play replays the interaction
	from a clean start. Reset snaps back to the initial state instantly, with
	no animation. Destroy disconnects everything Mount connected; the stage's
	instances are cleaned up separately by whoever cleared the stage.

	Station modules (Buttons/init.lua, Rewards/init.lua, ...) return:

	{
		Id = string,
		Name = string,
		Description = string?,
		Variants = { variant, variant, ... },
	}
]]

local StationBase = {}

function StationBase.validateVariant(variant)
	assert(type(variant.Name) == "string", "Variant.Name must be a string")
	assert(type(variant.Mount) == "function", "Variant.Mount must be a function")
	assert(type(variant.Play) == "function", "Variant.Play must be a function")
	assert(type(variant.Reset) == "function", "Variant.Reset must be a function")
	assert(type(variant.Destroy) == "function", "Variant.Destroy must be a function")
	return variant
end

function StationBase.validateStation(station)
	assert(type(station.Id) == "string", "Station.Id must be a string")
	assert(type(station.Name) == "string", "Station.Name must be a string")
	assert(type(station.Variants) == "table" and #station.Variants > 0, "Station.Variants must be a non-empty array")
	for _, variant in ipairs(station.Variants) do
		StationBase.validateVariant(variant)
	end
	return station
end

return StationBase
