local Model = script.Parent
local UpgraderPart = Model.Upgrader

local multiplier = Model:GetAttribute("multiplier")

UpgraderPart.Touched:Connect(function(part)
	local Value = part:GetAttribute("Value")
	local Upgraded = part:GetAttribute("Upgraded")
	
	if not Value or Upgraded == nil or Upgraded then return end
	
	part:SetAttribute("Upgraded", true)
	part:SetAttribute("Value", Value * multiplier)
end)