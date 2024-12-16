local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Modules = ServerScriptService:WaitForChild("Modules")
local ReplicatedModules = ReplicatedStorage:WaitForChild("Modules")
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

local FormatNumber = require(ReplicatedModules:WaitForChild("FormatNumber").Main)
local abbreviations = FormatNumber.Notation.compactWithSuffixThousands({ "K", "M", "B", "T", "Qd", "Qn", "Sx" })
local Formatter = FormatNumber.NumberFormatter.with():Notation(abbreviations)

local GUI = script.Parent.SurfaceGui
local MoneyLabel = GUI:WaitForChild("Money")

local Tycoon = script.Parent.Parent.Parent.Parent

Tycoon.AttributeChanged:connect(function(attributeName)
	if attributeName == "money" then
		MoneyLabel.Text = "$"..Formatter:Format(Tycoon:GetAttribute("money"))
	end
end)