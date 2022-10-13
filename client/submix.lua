local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    Effect = CreateAudioSubmix('megaphone')
    SetAudioSubmixEffectRadioFx(Effect, 0)
    SetAudioSubmixEffectParamInt(Effect, 0, GetHashKey('default'), 1)
    SetAudioSubmixEffectParamFloat(Effect, 0, GetHashKey('freq_low'), 189.0)
    SetAudioSubmixEffectParamFloat(Effect, 0, GetHashKey('freq_hi'), 7248.0)
    AddAudioSubmixOutput(Effect, 0)
    QBCore.Functions.TriggerCallback('ps-microphone:server:getSubmixs', function(Players)
        if Players ~= nil and #Players > 0 then
            for k,v in ipairs(Players) do
                MumbleSetSubmixForServerId(k, Effect)
            end
        end
    end)
end)

RegisterNetEvent('ps-microphone:client:updateSubmix', function(state, plySrc)
    if state then
        MumbleSetSubmixForServerId(plySrc, Effect)
    else
        MumbleSetSubmixForServerId(plySrc, -1)
    end
end)