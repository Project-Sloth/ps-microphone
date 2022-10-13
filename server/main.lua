local QBCore = exports['qb-core']:GetCoreObject()
local SubmixS = {}

QBCore.Functions.CreateUseableItem("megaphone", function(source, item)
    TriggerClientEvent("megaphone:Toggle",source)
end)

QBCore.Functions.CreateCallback('ps-microphone:server:getSubmixs', function(source, cb)
    cb(SubmixS)
end)

AddEventHandler("playerDropped", function()
	local src = source
    if SubmixS[src] then
        SubmixS[src] = nil
        TriggerClientEvent('ps-microphone:client:updateSubmix', -1, false, src)
    end
end)

RegisterNetEvent('ps-microphone:server:addSubmix', function()
    local src = source
    SubmixS[src] = true
    TriggerClientEvent('ps-microphone:client:updateSubmix', -1, true, src)
end)

RegisterNetEvent('ps-microphone:server:removeSubmix', function()
    local src = source
    SubmixS[src] = nil
    TriggerClientEvent('ps-microphone:client:updateSubmix', -1, false, src)
end)
