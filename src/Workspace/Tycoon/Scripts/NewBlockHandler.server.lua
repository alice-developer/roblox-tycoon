local ServerStorage = game:GetService("ServerStorage")

local removeScript = ServerStorage["Tycoon Scripts"]:WaitForChild("Block deleter")

script.Parent.Parent["Drop Blocks"].ChildAdded:Connect(function(child)
	local newScript = removeScript:Clone()
	newScript.Parent = child
	newScript.Enabled = true
end)