--[[ local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem("rightturnsign", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('megaphone:Toggle', src)
end)
]]

exports['lj-inventory']:CreateUsableItem("megaphone", function(source,item)
    TriggerClientEvent("megaphone:Toggle",source)
end)