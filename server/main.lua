--exports['lj-inventory']:CreateUsableItem("megaphone", function(source,item)
--    TriggerClientEvent("megaphone:Toggle",source)
--end)
local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem('megaphone', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
    TriggerClientEvent("megaphone:Toggle",source)
end)
