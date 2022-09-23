local holdingMega = false

RegisterNetEvent("animations:client:EmoteCommandStart", function(table)
    if table[1] == "c" and holdingMega then
        holdingMega = false
        exports["pma-voice"]:clearProximityOverride()
    end
end)

RegisterNetEvent("megaphone:Toggle", function()
    print(holdingMega)
    if not holdingMega then
        holdingMega = true
        CreateThread(function()
            while true do
                Wait(1000) 
                if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_mobile_film_shocking@female@base", "base", 3) and holdingMega then
                    holdingMega = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    exports["pma-voice"]:clearProximityOverride()
                    TerminateThisThread()
                    break
                end
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