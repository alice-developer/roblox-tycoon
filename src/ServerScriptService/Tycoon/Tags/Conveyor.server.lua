local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")

-- Conveyor
local conveyorAnimationInfos = TweenInfo.new(60, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)

for _, conveyor in ipairs(CollectionService:GetTagged("Conveyor")) do
	local SPEED = conveyor:GetAttribute("Speed")
	local texture = conveyor.Texture

	conveyor.AssemblyLinearVelocity = conveyor.CFrame.LookVector * SPEED

	conveyor:GetAttributeChangedSignal("Speed"):Connect(function()
		conveyor.AssemblyLinearVelocity = conveyor.CFrame.LookVector * conveyor:GetAttribute("Speed")
	end)

	TweenService:Create(
		texture,
		conveyorAnimationInfos,
		{ OffsetStudsV = -300}
	):Play()
end