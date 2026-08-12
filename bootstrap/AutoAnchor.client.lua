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

for _, descendant in ipairs(Workspace:GetDescendants()) do
	anchorIfEligible(descendant)
end

Workspace.DescendantAdded:Connect(anchorIfEligible)
