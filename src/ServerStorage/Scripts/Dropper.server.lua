local ServerStorage = game:GetService("ServerStorage")

local Dropper = script.Parent
local SpawnParts = {}
local Ores = ServerStorage:WaitForChild("Ores")
local ore = Ores[Dropper:GetAttribute("dropName")]

local Tycoon = Dropper.Parent.Parent.Parent

for _, part in ipairs(Dropper:GetChildren()) do
	if part.Name == "SpawnPart" then
		table.insert(SpawnParts, part)
		continue
	end
end

while task.wait(2) do
	for _, spawnPart in ipairs(SpawnParts) do
		local newOre = ore:Clone()
		newOre.Position = spawnPart.Position + Vector3.new(0, -0.2, 0)
		newOre.Parent = Tycoon["Drop Blocks"]
	end
end