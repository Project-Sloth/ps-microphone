local oldProximity = 0.0
function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end
CreateThread(function()
    for k, v in pairs(Config.MicrophoneZones) do
        exports["ps-zones"]:CreateBoxZone("microphone_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    -- Code here
    if string.starts(ZoneName, "microphone_") then
        oldProximity =  LocalPlayer.state['proximity'].distance
        exports["pma-voice"]:overrideProximityRange(50.0, true)
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    -- Code here
    if string.starts(ZoneName, "microphone_") then
        print("exited_microphone_zone")
        exports["pma-voice"]:clearProximityOverride()
    end
end)