local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

-- Never anchor anything belonging to a player's character, or nobody could
-- move. Walks up the ancestry since a part's immediate parent may not be
-- the character model itself (e.g. accessories, tool handles).
local function isPartOfCharacter(instance)
	local ancestor = instance
	while ancestor do
		if ancestor:IsA("Model") and Players:GetPlayerFromCharacter(ancestor) then
			return true
		end
		ancestor = ancestor.Parent
	end
	return false
end

local function anchorIfEligible(instance)
	if instance:IsA("BasePart") and not isPartOfCharacter(instance) then
		instance.Anchored = true
	end
end

-- Also guards against anything unanchoring one of these parts later (another
-- script, a manual edit in Studio): it gets forced back to true immediately,
-- unless the part has since become part of a character (e.g. a tool that
-- started as scenery and got picked up).
local function watchForUnanchoring(instance)
	if not instance:IsA("BasePart") then
		return
	end
	instance:GetPropertyChangedSignal("Anchored"):Connect(function()
		if not instance.Anchored and not isPartOfCharacter(instance) then
			instance.Anchored = true
		end
	end)
end

-- pcall'd so a problem with one instance can't silently kill the rest of
-- the loop (and, more importantly, the DescendantAdded connection that
-- comes after it) - which would explain everything after the failure point
-- staying permanently unanchored.
local function setupPart(instance)
	local ok, err = pcall(function()
		anchorIfEligible(instance)
		watchForUnanchoring(instance)
	end)
	if not ok then
		warn("AutoAnchor: failed to set up " .. instance:GetFullName() .. ": " .. tostring(err))
	end
end

local existing = Workspace:GetDescendants()
for _, descendant in ipairs(existing) do
	setupPart(descendant)
end
print(string.format("AutoAnchor: processed %d existing Workspace descendants", #existing))

Workspace.DescendantAdded:Connect(setupPart)
print("AutoAnchor: watching for new Workspace descendants")
