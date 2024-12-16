local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")

local Model = script.Parent
local touchablePart = Model.SemiVisible
touchablePart.CanTouch = true

local canGet = true

touchablePart.Touched:Connect(function(part)
	local player = Players:GetPlayerFromCharacter(part.Parent)
	if not player or not canGet then return end

	local weapon = ServerStorage.Tools[Model:GetAttribute("toolName")]
	local newTool = weapon:Clone()
	newTool.Parent = player.Backpack

	canGet = false
	task.wait(2)
	canGet = true
end)