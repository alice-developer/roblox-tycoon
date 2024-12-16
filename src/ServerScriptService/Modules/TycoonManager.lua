local module = {}

local CollectionService = game:GetService("CollectionService")

function module:GetItem(tycoon, floor: string, itemFolder: string, id: number): Model | nil
	local items = tycoon[floor][itemFolder]
	local resultItem = nil
	
	if items then
		for _, item in ipairs(items:GetChildren()) do
			local itemId = item:GetAttribute("id")
			
			if itemId == id then
				resultItem = item
				break
			end
		end
	end
	
	return resultItem
end

function module:HasTycoon(player: Player): boolean
	local result = false
	
	for _, tycoon in ipairs(CollectionService:GetTagged("Tycoon")) do
		local ownerId = tycoon:GetAttribute("ownerId")
		
		if ownerId == player.UserId then
			result = true
			break
		end
	end
	
	return result
end

function module:AddTycoonMoney(Tycoon: Model, toAdd: number)
	local oldValue = Tycoon:GetAttribute("money")
	Tycoon:SetAttribute("money", oldValue + toAdd)
end

function module:IsPlayerTycoon(player: Player, Tycoon: Model): boolean
	return player.UserId == Tycoon:GetAttribute("ownerId")
end

function module:MakeModelVisibleById(tycoon: Model, floor: string, itemFolder, id: number)
	local getItem = module:GetItem(tycoon, floor, itemFolder, id)
	if not getItem then return end
	
	module:ModelVisible(getItem)
end

function module:ModelVisible(model: Model)
	for _, part in ipairs(model:GetChildren()) do
		if part:IsA("Folder") or part:IsA("Model")  then
			module:ModelVisible(part)
			continue
		end
		
		if not part:IsA("Script") and not part:IsA("BillboardGui") then
			if part.Name == "SpawnPart" or part.Name == "SemiVisible" or part.Name == "Upgrader" then
				part.Transparency = 0.5
				part.CanTouch = true
			elseif part.Name == "Window" then
				part.Transparency = 0.5
				part.CanCollide = true
			elseif part.Name == "Invisible" then
				part.CanCollide = true
				part.CanTouch = true
			else
				part.CanCollide = true
				part.CanTouch = true
				part.Transparency = 0
			end
		else
			part.Enabled = true
		end
	end
end

return module
