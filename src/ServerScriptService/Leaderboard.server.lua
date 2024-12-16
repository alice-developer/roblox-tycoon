local Players = game:GetService("Players")

-- Leaderstats base
local leaderstats = Instance.new("Folder")
leaderstats.Name = "leaderstats"

local Rebirths = Instance.new("NumberValue")
Rebirths.Name = "⬆️ Rebirths"
Rebirths.Value = 0
Rebirths.Parent = leaderstats
local IsPrimary = Instance.new("BoolValue")
IsPrimary.Name = "IsPrimary"
IsPrimary.Value = true
IsPrimary.Parent = Rebirths

local Money = Instance.new("NumberValue")
Money.Name = "💵 Money"
Money.Value = 0
Money.Parent = leaderstats

Players.PlayerAdded:Connect(function(player)
    local newLS = leaderstats:Clone()
    newLS.Parent = player
end)