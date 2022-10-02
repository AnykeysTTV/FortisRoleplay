cornerselling = false
hasTarget = false
busySelling = false

startLocation = nil

currentPed = nil
CurrentCops = 0

lastPed = {}

stealingPed = nil
stealData = {}

availableDrugs = {}

local policeMessage = {
    "Verdachte situatie",
    "Mogelijke drugsdeal",
}

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('qb-drugs:client:cornerselling')
AddEventHandler('qb-drugs:client:cornerselling', function(data)
    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
        if not cornerselling then
            QBCore.Functions.TriggerCallback('qb-drugs:server:cornerselling:getAvailableDrugs', function(result)
                if result ~= nil then
                    availableDrugs = result
                    cornerselling = true
                    startLocation = GetEntityCoords(GetPlayerPed(-1))
                    QBCore.Functions.Notify('Je bent gestart met verkopen!')
                else
                    QBCore.Functions.Notify('Je hebt geen wiet bij je!', 'error')
                end
            end)
        else
            cornerselling = false
            QBCore.Functions.Notify('Je bent gestopt met verkopen!')

            hasTarget = false
            busySelling = false
            startLocation = nil
            currentPed = nil
            availableDrugs = {}
        end
    else
        QBCore.Functions.Notify('Stap eerst uit je voertuig!', 'error')
    end
end)

function toFarAway()
    QBCore.Functions.Notify('Je bent te ver weg!', 'error')
    cornerselling = false
    hasTarget = false
    busySelling = false
    startLocation = nil
    currentPed = nil
    availableDrugs = {}
end

function callPolice(coords)
    local title = policeMessage[math.random(1, #policeMessage)]
    local pCoords = GetEntityCoords(GetPlayerPed(-1))
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pCoords.x, pCoords.y, pCoords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then streetLabel = street1..' '..street2 end

    TriggerServerEvent('police:server:PoliceAlertMessage', title, streetLabel, coords)
    hasTarget = false
    Citizen.Wait(5000)
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(4)
        if stealingPed ~= nil and stealData ~= nil then
            if IsEntityDead(stealingPed) then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local pedpos = GetEntityCoords(stealingPed)
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, pedpos.x, pedpos.y, pedpos.z, true) < 1.5) then
                    DrawText3D(pedpos.x, pedpos.y, pedpos.z, "[E] Oppakken")
                    if IsControlJustPressed(0, Keys["E"]) then
                        RequestAnimDict("pickup_object")
                        while not HasAnimDictLoaded("pickup_object") do
                            Citizen.Wait(7)
                        end
                        TaskPlayAnim(GetPlayerPed(-1), "pickup_object" ,"pickup_low" ,8.0, -8.0, -1, 1, 0, false, false, false )
                        Wait(2000)
                        TriggerServerEvent("QBCore:Server:AddItem", stealData.item, stealData.amount)
                        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[stealData.item], "add")
                        stealingPed = nil
                        stealData = {}
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if cornerselling then
            if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                local player = GetPlayerPed(-1)
                local coords = GetEntityCoords(player)
                if not hasTarget then
                    local PlayerPeds = {}
                    if next(PlayerPeds) == nil then
                        for _, player in ipairs(GetActivePlayers()) do
                            local ped = GetPlayerPed(player)
                            table.insert(PlayerPeds, ped)
                        end
                    end

                    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)

                    if closestDistance < 15.0 and closestPed ~= 0 then
                        SellToPed(closestPed)
                    end
                end

                local startDist = GetDistanceBetweenCoords(startLocation, GetEntityCoords(GetPlayerPed(-1)))
                if startDist > 10 then
                    toFarAway()
                end
            else
                cornerselling = false
                QBCore.Functions.Notify('Je bent gestopt met verkopen!')
                hasTarget = false
                busySelling = false
                startLocation = nil
                currentPed = nil
                availableDrugs = {}
            end
        end

        if not cornerselling then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

RegisterNetEvent('qb-drugs:client:refreshAvailableDrugs')
AddEventHandler('qb-drugs:client:refreshAvailableDrugs', function(items)
    availableDrugs = items
end)

function SellToPed(ped)
    hasTarget = true
    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end

    local succesChance = math.random(1, 20)

    local scamChance = math.random(1, 5)

    local getRobbed = math.random(1, 20)

    if succesChance <= 7 then
        hasTarget = false
        return
    end

    local drugType = math.random(1, #availableDrugs)
    local bagAmount = math.random(1, availableDrugs[drugType].amount)
 
    if bagAmount > 15 then
        bagAmount = math.random(9, 15)
    end
    currentOfferDrug = availableDrugs[drugType]
 
    local ddata = Config.DrugsPrice[currentOfferDrug.item]
    if CurrentCops >= 2 then
        randomPrice = math.random(ddata.min, ddata.max) * bagAmount
    elseif CurrentCops  == 1 then
        local randomPricebasis = math.random(ddata.min, ddata.max) * bagAmount
        local randomPrice2 = randomPricebasis * 0.70
        randomPrice = math.floor(randomPrice2)
    elseif CurrentCops == 0 then
        local randomPricebasis = math.random(ddata.min, ddata.max) * bagAmount
        local randomPrice2 = randomPricebasis * 0.55
        randomPrice = math.floor(randomPrice2)
    end

    if scamChance == 5 then
       randomPrice = math.random(3, 10) * bagAmount
    end

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)

    local coords = GetEntityCoords(GetPlayerPed(-1), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = GetDistanceBetweenCoords(coords, pedCoords)

    if getRobbed == 18 or getRobbed == 9 then
        TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
    else
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
    end

    while pedDist > 1.5 do
        coords = GetEntityCoords(GetPlayerPed(-1), true)
        pedCoords = GetEntityCoords(ped)    
        if getRobbed == 18 or getRobbed == 9 then
            TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
        else
            TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        end
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = GetDistanceBetweenCoords(coords, pedCoords)

        Citizen.Wait(100)
    end

    TaskLookAtEntity(ped, GetPlayerPed(-1), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, GetPlayerPed(-1), 5500)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)
    currentPed = ped

    if hasTarget then
        while pedDist < 1.5 do
            coords = GetEntityCoords(GetPlayerPed(-1), true)
            pedCoords = GetEntityCoords(ped)
            pedDist = GetDistanceBetweenCoords(coords, pedCoords)

            if getRobbed == 18 or getRobbed == 9 then
                TriggerServerEvent('qb-drugs:server:robCornerDrugs', availableDrugs[drugType].item, bagAmount)
                QBCore.Functions.Notify('Je bent overvallen en bent '..bagAmount..' zakjes verloren'..availableDrugs[drugType].label, 'error')
                stealingPed = ped
                stealData = {
                    item = availableDrugs[drugType].item,
                    amount = bagAmount,
                }

                hasTarget = false

                local rand = (math.random(6,9) / 100) + 0.3
                local rand2 = (math.random(6,9) / 100) + 0.3
                if math.random(10) > 5 then
                    rand = 0.0 - rand
                end
            
                if math.random(10) > 5 then
                    rand2 = 0.0 - rand2
                end
            
                local moveto = GetEntityCoords(GetPlayerPed(-1))
                local movetoCoords = {x = moveto.x + math.random(100, 500), y = moveto.y + math.random(100, 500), z = moveto.z, }
                ClearPedTasksImmediately(ped)
                TaskGoStraightToCoord(ped, movetoCoords.x, movetoCoords.y, movetoCoords.z, 15.0, -1, 0.0, 0.0)

                table.insert(lastPed, ped)
                break
            else
                if pedDist < 1.5 then
                    QBCore.Functions.DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z, '~g~E~w~ -'..bagAmount..'x '..currentOfferDrug.label..' voor €'..randomPrice..'? / ~g~G~w~ - Weigeren')
                    if IsControlJustPressed(0, Keys["E"]) then
                        TriggerServerEvent('qb-drugs:server:sellCornerDrugs', availableDrugs[drugType].item, bagAmount, randomPrice)
                        hasTarget = false

                        loadAnimDict("gestures@f@standing@casual")
                        TaskPlayAnim(GetPlayerPed(-1), "gestures@f@standing@casual", "gesture_point", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                        Citizen.Wait(650)
                        ClearPedTasks(GetPlayerPed(-1))

                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        table.insert(lastPed, ped)

                        local politie = math.random(1,4)
                        if politie == 1 then
                            callPolice(GetEntityCoords(GetPlayerPed(-1)))
                        end

                        break
                    end

                    if IsControlJustPressed(0, Keys["G"]) then
                        QBCore.Functions.Notify('Aanbod geweigerd!', 'error')
                        hasTarget = false

                        SetPedKeepTask(ped, false)
                        SetEntityAsNoLongerNeeded(ped)
                        ClearPedTasksImmediately(ped)
                        table.insert(lastPed, ped)

                        local politie = math.random(1,2)
                        if politie == 1 then
                            callPolice(GetEntityCoords(GetPlayerPed(-1)))
                        end

                        break
                    end
                else
                    hasTarget = false
                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    table.insert(lastPed, ped)
                end
            end
            
            Citizen.Wait(3)
        end
        
        Citizen.Wait(math.random(4000, 7000))
    end
end

function loadAnimDict(dict)
    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
end

function runAnimation(target)
    RequestAnimDict("mp_character_creation@lineup@male_a")
    while not HasAnimDictLoaded("mp_character_creation@lineup@male_a") do
    Citizen.Wait(0)
    end
    if not IsEntityPlayingAnim(target, "mp_character_creation@lineup@male_a", "loop_raised", 3) then
        TaskPlayAnim(target, "mp_character_creation@lineup@male_a", "loop_raised", 8.0, -8, -1, 49, 0, 0, 0, 0)
    end
end