local NitrousActivated = false
local NitrousBoost = 35.0
local VehicleNitrous = {}
local Fxs = {}

local function trim(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('nitrous:GetNosLoadedVehs', function(vehs)
        VehicleNitrous = vehs
    end)
end)

RegisterNetEvent('smallresource:client:LoadNitrous')
AddEventHandler('smallresource:client:LoadNitrous', function()
    local IsInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)

    if not NitrousActivated then
        if IsInVehicle and not IsThisModelABike(GetEntityModel(GetVehiclePedIsIn(ped))) then
            if GetPedInVehicleSeat(veh, -1) == ped then
                if GetVehicleWheelSpeed(veh, 1)  < 1 then
                    QBCore.Functions.Progressbar("use_nos", "NOS aansluiten...", 1000, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['nitrous'], "remove")
                        TriggerServerEvent("QBCore:Server:RemoveItem", 'nitrous', 1)
                        local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
                        local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
                        nitro = 75
                        nitromag = true
                        TriggerServerEvent('nitrous:server:LoadNitrous', Plate)
                    end)
                else
                    QBCore.Functions.Notify("Je kan dat niet vanuit een rijdende auto doen!", "error")
                end
            else
                QBCore.Functions.Notify("Je kan dat niet vanaf deze stoel doen!", "error")
            end
        else
            QBCore.Functions.Notify('Je zit niet in een auto', 'error')
        end
    else
        QBCore.Functions.Notify('Je hebt al nitro op je auto', 'error')
    end
end)

local nosupdated = false 

Citizen.CreateThread(function()
    while true do
        local IsInVehicle = IsPedInAnyVehicle(PlayerPedId())
        local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
        if IsInVehicle then
            local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
            if VehicleNitrous[Plate] ~= nil then
                if VehicleNitrous[Plate].hasnitro then
                    if IsControlJustPressed(0, 36) and GetPedInVehicleSeat(CurrentVehicle, -1) == PlayerPedId() and nitromag then
                        SetVehicleEnginePowerMultiplier(CurrentVehicle, NitrousBoost)
                        SetVehicleEngineTorqueMultiplier(CurrentVehicle, NitrousBoost)
                        SetEntityMaxSpeed(CurrentVehicle, 200.0)
                        NitrousActivated = true

                        Citizen.CreateThread(function()
                            while NitrousActivated do
                                if nitro > 1 then
                                    if VehicleNitrous[Plate].level - 1 ~= 0 then
                                        TriggerServerEvent('nitrous:server:UpdateNitroLevel', Plate, (VehicleNitrous[Plate].level - 1))
                                        TriggerEvent('hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, true)
                                    else
                                        TriggerServerEvent('nitrous:server:UnloadNitrous', Plate)
                                        NitrousActivated = false
                                        SetVehicleBoostActive(CurrentVehicle, 0)
                                        SetVehicleEnginePowerMultiplier(CurrentVehicle, LastEngineMultiplier)
                                        SetVehicleEngineTorqueMultiplier(CurrentVehicle, 1.0)
                                        for index,_ in pairs(Fxs) do
                                            StopParticleFxLooped(Fxs[index], 1)
                                            TriggerServerEvent('nitrous:server:StopSync', trim(GetVehicleNumberPlateText(CurrentVehicle)))
                                            Fxs[index] = nil
                                        end
                                    end
                                else
                                    local topsnelheid = GetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
                                    NitrousActivated = false
                                    nitromag = false
                                    QBCore.Functions.Notify('Je NOS fles is leeg', 'error')
                                    for index,_ in pairs(Fxs) do 
                                        StopParticleFxLooped(Fxs[index], 1)
                                        TriggerServerEvent('nitrous:server:StopSync', trim(GetVehicleNumberPlateText(veh)))
                                        Fxs[index] = nil
                                    end
                                    SetVehicleBoostActive(CurrentVehicle, 0)
                                    SetVehicleEnginePowerMultiplier(CurrentVehicle, LastEngineMultiplier)
                                    SetVehicleEngineTorqueMultiplier(CurrentVehicle, 1.0)
                                    SetEntityMaxSpeed(CurrentVehicle, topsnelheid)
                                end
                                nitro = nitro - 1
                                print(nitro)
                                Citizen.Wait(100)
                            end
                        end)
                    end

                    if IsControlJustReleased(0, 36) and GetPedInVehicleSeat(CurrentVehicle, -1) == PlayerPedId() then
                        if NitrousActivated then
                            local veh = GetVehiclePedIsIn(PlayerPedId())
                            local topsnelheid = GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel")
                            SetVehicleBoostActive(veh, 0)
                            SetVehicleEnginePowerMultiplier(veh, LastEngineMultiplier)
                            SetVehicleEngineTorqueMultiplier(veh, 1.0)
                            SetEntityMaxSpeed(veh, topsnelheid)
                            for index,_ in pairs(Fxs) do
                                StopParticleFxLooped(Fxs[index], 1)
                                TriggerServerEvent('nitrous:server:StopSync', trim(GetVehicleNumberPlateText(veh)))
                                Fxs[index] = nil
                            end
                            TriggerEvent('hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, false)
                            NitrousActivated = false
                        end
                    end
                end
            else
                if not nosupdated then
                    TriggerEvent('hud:client:UpdateNitrous', false, nil, false)
                    nosupdated = true
                end
            end
        else
            if nosupdated then
                nosupdated = false
            end
            Citizen.Wait(1500)
        end
        Citizen.Wait(3)
    end
end)

p_flame_location = {
	"exhaust",
	"exhaust_2",
	"exhaust_3",
	"exhaust_4",
	"exhaust_5",
	"exhaust_6",
	"exhaust_7",
	"exhaust_8",
	"exhaust_9",
	"exhaust_10",
	"exhaust_11",
	"exhaust_12",
	"exhaust_13",
	"exhaust_14",
	"exhaust_15",
	"exhaust_16",
}

ParticleDict = "veh_xs_vehicle_mods"
ParticleFx = "veh_nitrous"
ParticleSize = 1.4

Citizen.CreateThread(function()
    while true do
        if NitrousActivated then
            local veh = GetVehiclePedIsIn(PlayerPedId())
            if veh ~= 0 then
                TriggerServerEvent('nitrous:server:SyncFlames', VehToNet(veh))
                SetVehicleBoostActive(veh, 1)

                for _,bones in pairs(p_flame_location) do
                    if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                        if Fxs[bones] == nil then
                            RequestNamedPtfxAsset(ParticleDict)
                            while not HasNamedPtfxAssetLoaded(ParticleDict) do
                                Citizen.Wait(0)
                            end
                            SetPtfxAssetNextCall(ParticleDict)
                            UseParticleFxAssetNextCall(ParticleDict)
                            Fxs[bones] = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.02, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)
                        end
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

local NOSPFX = {}

RegisterNetEvent('nitrous:client:SyncFlames')
AddEventHandler('nitrous:client:SyncFlames', function(netid, nosid)
    local veh = NetToVeh(netid)
    if veh ~= 0 then
        local myid = GetPlayerServerId(PlayerId())
        if NOSPFX[trim(GetVehicleNumberPlateText(veh))] == nil then
            NOSPFX[trim(GetVehicleNumberPlateText(veh))] = {}
        end
        if myid ~= nosid then
            for _,bones in pairs(p_flame_location) do
                if NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones] == nil then
                    NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones] = {}
                end
                if GetEntityBoneIndexByName(veh, bones) ~= -1 then
                    if NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones].pfx == nil then
                        RequestNamedPtfxAsset(ParticleDict)
                        while not HasNamedPtfxAssetLoaded(ParticleDict) do
                            Citizen.Wait(0)
                        end
                        SetPtfxAssetNextCall(ParticleDict)
                        UseParticleFxAssetNextCall(ParticleDict)
                        NOSPFX[trim(GetVehicleNumberPlateText(veh))][bones].pfx = StartParticleFxLoopedOnEntityBone(ParticleFx, veh, 0.0, -0.05, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(veh, bones), ParticleSize, 0.0, 0.0, 0.0)

                    end
                end
            end
        end
    end
end)

RegisterNetEvent('nitrous:client:StopSync')
AddEventHandler('nitrous:client:StopSync', function(plate)
    if NOSPFX ~= nil and plate ~= nil then
        for k, v in pairs(NOSPFX[plate]) do
            StopParticleFxLooped(v.pfx, 1)
            NOSPFX[plate][k].pfx = nil
        end
    end
end)

RegisterNetEvent('nitrous:client:UpdateNitroLevel')
AddEventHandler('nitrous:client:UpdateNitroLevel', function(Plate, level)
    VehicleNitrous[Plate].level = level
end)

RegisterNetEvent('nitrous:client:LoadNitrous')
AddEventHandler('nitrous:client:LoadNitrous', function(Plate)
    VehicleNitrous[Plate] = {
        hasnitro = true,
        level = 100,
    }
    local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local CPlate = trim(GetVehicleNumberPlateText(CurrentVehicle))
    if CPlate == Plate then
        TriggerEvent('hud:client:UpdateNitrous', VehicleNitrous[Plate].hasnitro,  VehicleNitrous[Plate].level, false)
    end
end)

RegisterNetEvent('nitrous:client:UnloadNitrous')
AddEventHandler('nitrous:client:UnloadNitrous', function(Plate)
    VehicleNitrous[Plate] = nil

    local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
    local CPlate = trim(GetVehicleNumberPlateText(CurrentVehicle))
    if CPlate == Plate then
        NitrousActivated = false
        TriggerEvent('hud:client:UpdateNitrous', false, nil, false)
    end
end)
