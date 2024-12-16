local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")

local dropperScript = ServerStorage:WaitForChild("Scripts").Dropper

for _, dropper in ipairs(CollectionService:GetTagged("Dropper")) do
	local newScript = dropperScript:Clone()
	newScript.Parent = dropper
end