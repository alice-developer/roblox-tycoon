local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local Modules = ServerScriptService.Modules
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

for _, door in ipairs(CollectionService:GetTagged("Tycoon Door")) do
	local doorPart = door.DoorPart
		
	doorPart.Touched:Connect(function(part)
		local player = Players:GetPlayerFromCharacter(part.Parent)
		if not player or TycoonManager:HasTycoon(player) then return end

		doorPart.CanTouch = false
		doorPart.Transparency = 0.5
		doorPart.CanCollide = false
		doorPart.SurfaceGui:WaitForChild("Name").Text = player.Name.."'s Tycoon"

		local Tycoon = door.Parent.Parent.Parent
		Tycoon:SetAttribute("ownerId", player.UserId)
		
		local firstDropperButton = Tycoon["First Floor"].Buttons["Coal 1"]
		local wallButton = Tycoon["First Floor"].Buttons["Front Wall"]
		local pathButton = Tycoon["First Floor"].Buttons["Path"]
		
		TycoonManager:ModelVisible(firstDropperButton)
		TycoonManager:ModelVisible(wallButton)
		TycoonManager:ModelVisible(pathButton)
	end)
end	