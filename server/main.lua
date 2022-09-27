local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("megaphone", function(source)
    TriggerClientEvent("megaphone:Toggle",source)
end)