local CollectionService = game:GetService("CollectionService")
local ServerScriptService = game:GetService("ServerScriptService")

local Modules = ServerScriptService:WaitForChild("Modules")
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

for _, getter in ipairs(CollectionService:GetTagged("Ore Getter")) do
	local Tycoon = getter.Parent.Parent.Parent
	
	getter.Main.Touched:Connect(function(part)
		local Value = part:GetAttribute("Value")
		if not Value then return end
		
		part:Destroy()
		TycoonManager:AddTycoonMoney(Tycoon, Value)
	end)
end