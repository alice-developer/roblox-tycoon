local ServerScriptService = game:GetService("ServerScriptService")

local Modules = ServerScriptService:WaitForChild("Modules")
local TycoonManager = require(Modules:WaitForChild("TycoonManager"))

script.Parent.Parent.Path.Destroying:Connect(function()
	TycoonManager:ModelVisible(script.Parent)
end)