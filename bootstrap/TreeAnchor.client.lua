local Workspace = game:GetService("Workspace")

local TREE_NAME_FRAGMENT = "roblox_lowpoly_tree"

local function isTreeInstance(name)
	return string.find(name:lower(), TREE_NAME_FRAGMENT, 1, true) ~= nil
end

local function anchorTree(root)
	if root:IsA("BasePart") then
		root.Anchored = true
	end
	for _, descendant in ipairs(root:GetDescendants()) do
		if descendant:IsA("BasePart") then
			descendant.Anchored = true
		end
	end
end

for _, descendant in ipairs(Workspace:GetDescendants()) do
	if isTreeInstance(descendant.Name) then
		anchorTree(descendant)
	end
end

Workspace.DescendantAdded:Connect(function(descendant)
	if isTreeInstance(descendant.Name) then
		anchorTree(descendant)
	end
end)
