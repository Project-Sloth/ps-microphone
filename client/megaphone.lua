local holdingMega = false
local prop = nil

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end
function AddPropToPlayerAndAnim(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    loadAnimDict("amb@world_human_mobile_film_shocking@female@base")
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(prop1)
    TaskPlayAnim(Player, "amb@world_human_mobile_film_shocking@female@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

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
            while holdingMega do
                Wait(1000) 
                if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_mobile_film_shocking@female@base", "base", 3) and holdingMega then
                    holdingMega = false
                    ClearPedTasksImmediately(PlayerPedId())
                    exports["pma-voice"]:clearProximityOverride()
                    DeleteEntity(prop)
                end
            end
        end)
        AddPropToPlayerAndAnim("prop_megaphone_01", 28422, 0.0, 0.0, 0.0, 0.0, 0.0, 80.0)
        exports["pma-voice"]:overrideProximityRange(50.0, true)
    else
        holdingMega = false
        ClearPedTasksImmediately(PlayerPedId())
        DeleteEntity(prop)
        exports["pma-voice"]:clearProximityOverride()
    end
end)