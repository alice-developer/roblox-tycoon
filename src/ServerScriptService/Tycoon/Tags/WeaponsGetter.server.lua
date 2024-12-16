local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")

local Script = ServerStorage.Scripts:WaitForChild("WeaponsGetter")

for _, weaponGetter in ipairs(CollectionService:GetTagged("Weapons Getters")) do
	local newScript = Script:Clone()
	newScript.Parent = weaponGetter
end