for _, part in ipairs(script.Parent:GetDescendants()) do
	if part:IsA("PointLight") then
		part.Parent.Transparency = 0.7
		part.Enabled = true
	end
end