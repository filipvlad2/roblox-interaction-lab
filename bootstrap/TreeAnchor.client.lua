local Workspace = game:GetService("Workspace")

local TREE_NAME_FRAGMENT = "roblox_lowpoly_tree"

local function isTreeInstance(name)
	return string.find(name:lower(), TREE_NAME_FRAGMENT, 1, true) ~= nil
end

local function anchorIfPart(instance)
	if instance:IsA("BasePart") then
		instance.Anchored = true
	end
end

local function setupTree(root)
	anchorIfPart(root)
	for _, descendant in ipairs(root:GetDescendants()) do
		anchorIfPart(descendant)
	end

	-- Anchors any part that streams/loads into this specific tree after the
	-- initial pass above (e.g. trunk/leaves arriving slightly later than
	-- the root), not just what already existed when it was first detected.
	root.DescendantAdded:Connect(anchorIfPart)
end

for _, descendant in ipairs(Workspace:GetDescendants()) do
	if isTreeInstance(descendant.Name) then
		setupTree(descendant)
	end
end

Workspace.DescendantAdded:Connect(function(descendant)
	if isTreeInstance(descendant.Name) then
		setupTree(descendant)
	end
end)
