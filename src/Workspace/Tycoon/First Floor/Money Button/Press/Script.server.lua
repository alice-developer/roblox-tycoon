local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local Modules = ServerScriptService:WaitForChild("Modules")
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

local pressurePlate = script.Parent
local neonPress = pressurePlate.Parent.NeonPress
local canPress = true

pressurePlate.Touched:Connect(function(part)
	local player = Players:GetPlayerFromCharacter(part.Parent)
	local Tycoon = script.Parent.Parent.Parent.Parent
	 
	if not player or not TycoonManager:IsPlayerTycoon(player, Tycoon) or not canPress then return end
	
	local leaderstats = player.leaderstats
	local Money = leaderstats["💵 Money"]
	local tycoonMoney = Tycoon:GetAttribute("money")
	
	TycoonManager:AddTycoonMoney(Tycoon, tycoonMoney * -1)
	Money.Value += tycoonMoney
	
	canPress = false
	pressurePlate.BrickColor = BrickColor.new("Bright red")
	neonPress.BrickColor = BrickColor.new("Really red")
	
	task.wait(2)
	
	canPress = true
	pressurePlate.BrickColor = BrickColor.new("Dark green")
	neonPress.BrickColor = BrickColor.new("Lime green")
end)