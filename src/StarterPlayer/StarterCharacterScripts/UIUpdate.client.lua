local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local StarterGui = Player:WaitForChild("PlayerGui")
local Hud = StarterGui.Hud
local MoneyLabel = Hud.Values.MoneyGui.FrameBack.TextFrame.MoneyLabel
local RebirthLabel = Hud.Values.RebirthGui.FrameBack.TextFrame.RebirthLabel

local leaderstats = Player:WaitForChild("leaderstats")

leaderstats["💵 Money"].Changed:Connect(function(value)
    MoneyLabel.Text = "$"..value
end)

leaderstats["⬆️ Rebirths"].Changed:Connect(function(value)
    RebirthLabel.Text = value
end)
