local holdingMega = false

RegisterNetEvent("animations:client:EmoteCommandStart", function(table)
    if table[1] == "c" and holdingMega then
        holdingMega = false
        exports["pma-voice"]:clearProximityOverride()
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    if holdingMega then
        local _HasMegaphone = false
        for _, item in pairs(val.items) do
            if item.name == "megaphone" then
                _HasMegaphone = true
                break
            end
        end
        if not _HasMegaphone then
            holdingMega = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            exports["pma-voice"]:clearProximityOverride()
        end
    end
end)

RegisterNetEvent("megaphone:Toggle", function()
    if not holdingMega then
        holdingMega = true
        CreateThread(function()
            while true do 
                if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_mobile_film_shocking@female@base", "base", 3) and holdingMega then
                    holdingMega = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    exports["pma-voice"]:clearProximityOverride()
                    return
                end
                        
                Wait(1000)
            end
        end)
        TriggerEvent('animations:client:EmoteCommandStart', {"megaphone"})
        exports["pma-voice"]:overrideProximityRange(50.0, true)
    else
        holdingMega = false
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        exports["pma-voice"]:clearProximityOverride()
    end
end)
