local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")

local Script = ServerStorage.Scripts.Upgrader

for _, upgrader in ipairs(CollectionService:GetTagged("Upgrader")) do
	local newScript = Script:Clone()
	newScript.Parent = upgrader
end