local CollectionService = game:GetService("CollectionService")
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Modules = ServerScriptService:WaitForChild("Modules")
local ReplicatedModules = ReplicatedStorage:WaitForChild("Modules")
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

local FormatNumber = require(ReplicatedModules.FormatNumber.Main)
local abbreviations = FormatNumber.Notation.compactWithSuffixThousands({ "K", "M", "B", "T" })
local Formatter = FormatNumber.NumberFormatter.with():Notation(abbreviations)

for _, button in ipairs(CollectionService:GetTagged("Buy Button")) do
	local PressurePlate = button.Press
	local tycoon = button.Parent.Parent.Parent
	local floor = button.Parent.Parent
	local folder = PressurePlate.Parent:GetAttribute("folder")
	local itemId = PressurePlate.Parent:GetAttribute("id")
	
	local gui = button:WaitForChild("GUI")
	local itemName = gui.Frame:WaitForChild("Name")
	local itemValue = gui.Frame:WaitForChild("Value")
	local item = nil
	
	function getItemInfos(property)
		if property == "Transparency" and PressurePlate.Transparency == 0 then
			item = TycoonManager:GetItem(tycoon, floor.Name, folder, itemId)
			
			if not item then return print("Item não encontrado!") end
			
			itemName.Text = item.Name
			itemValue.Text = string.format("$%s", Formatter:Format(item:GetAttribute("cost")))
		end
	end
	
	PressurePlate.Touched:Connect(function(part)
		-- Buying item
		local player = Players:GetPlayerFromCharacter(part.Parent)
		
		if not player or not TycoonManager:IsPlayerTycoon(player, tycoon) then return end

		local leaderstats = player.leaderstats
		local money = leaderstats["💵 Money"]
		
		local cost = item:GetAttribute("cost")

		if money.Value < cost then return end
		money.Value -= cost

		TycoonManager:ModelVisible(item)
		button:Destroy()

		-- Making next button(s) visible
		TycoonManager:MakeModelVisibleById(tycoon, floor.Name, "Buttons", itemId + 1)
		
		local otherButtonId = button:GetAttribute("otherButtonId")
		if otherButtonId == nil then return end
		
		local getBtn = TycoonManager:GetItem(tycoon, floor.Name, "Buttons", otherButtonId)
		TycoonManager:ModelVisible(getBtn)
	end)

	PressurePlate.Changed:Connect(getItemInfos)
end