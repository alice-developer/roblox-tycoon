local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

local Modules = ServerScriptService:WaitForChild("Modules")
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

local Tycoon = script.Parent.Parent.Parent.Parent.Parent.Parent

local model = script.Parent.Parent
local prompt = model.Parent.Button.Prompt
local spawnPart = model.SpawnPart
local CoalOre = ServerStorage:WaitForChild("Ores")["Coal Ore"]

local canClick = true
local lightTop = model.LightTop
local lightInside = model.LightInside

prompt.Triggered:Connect(function(player)
	if not player or not TycoonManager:IsPlayerTycoon(player, Tycoon) or not canClick then return end
	
	local newOre = CoalOre:Clone()
	newOre.Position = spawnPart.Position
	newOre.Parent = Tycoon["Drop Blocks"] 
	
	canClick = false
	lightTop.BrickColor = BrickColor.new("Bright red")
	lightInside.BrickColor = BrickColor.new("Really red")

	task.wait(1)

	canClick = true
	lightTop.BrickColor = BrickColor.new("Dark green")
	lightInside.BrickColor = BrickColor.new("Lime green")
end)