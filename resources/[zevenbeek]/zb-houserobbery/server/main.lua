QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

QBCore.Functions.CreateCallback('qb-houserobbery:server:GetHouseConfig', function(source, cb)
    cb(Config.Houses)
end)

RegisterServerEvent('zb-huisoverval:server:betreedHuis')
AddEventHandler('zb-huisoverval:server:betreedHuis', function(house)
    local src = source
    local itemInfo = QBCore.Shared.Items["lockpick"]
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Config.Houses[house]["opened"] then
        ResetHouseStateTimer(house)
        TriggerClientEvent('zb-huisoverval:client:zetHuisStatus', -1, house, true)
    end
    TriggerClientEvent('zb-huisoverval:client:betreedOsso', src, house)
    Config.Houses[house]["opened"] = true
end)

function ResetHouseStateTimer(house)
    local num = math.random(3333333, 11111111)
    local time = tonumber(num)
    Citizen.SetTimeout(time, function()
        Config.Houses[house]["opened"] = false
        for k, v in pairs(Config.Houses[house]["furniture"]) do
            v["searched"] = false
        end
        TriggerClientEvent('zb-huisoverval:client:ResetOssoStatus', -1, house)
    end)
end

RegisterServerEvent('zb-huisoverval:server:zoekKasjeZebai')
AddEventHandler('zb-huisoverval:server:zoekKasjeZebai', function(cabin, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 10)
    local itemFound = math.random(1, 4)
    local itemCount = 1

    local Tier = 1
    if Config.Houses[house]["tier"] == 1 then
        Tier = 1
    elseif Config.Houses[house]["tier"] == 2 then
        Tier = 2
    elseif Config.Houses[house]["tier"] == 3 then
        Tier = 3
    end

    if itemFound < 4 then
        if luck == 10 then
            itemCount = 3
        elseif luck >= 6 and luck <= 8 then
            itemCount = 2
        end

        for i = 1, itemCount, 1 do
            local randomItem = Config.Rewards[Tier][Config.Houses[house]["furniture"][cabin]["type"]][math.random(1, #Config.Rewards[Tier][Config.Houses[house]["furniture"][cabin]["type"]])]
            local itemInfo = QBCore.Shared.Items[randomItem]
            if math.random(1, 90) == 69 then
                randomItem = "simkaart"
                itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            else
                if not itemInfo["unqiue"] then
                    local itemAmount = math.random(1, 3)
                    if randomItem == "plastic" then
                        itemAmount = math.random(15, 30)
                    elseif randomItem == "goldchain" then
                        itemAmount = math.random(5, 8)
                    end
                    Player.Functions.AddItem(randomItem, itemAmount)
                else
                    Player.Functions.AddItem(randomItem, 1)
                end
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            end
            Citizen.Wait(500)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Het kastje is leeg..', 'error', 3500)
    end

    Config.Houses[house]["furniture"][cabin]["searched"] = true
    TriggerClientEvent('zb-huisoverval:client:zetKasjeStatusOulleh', -1, house, cabin, true)
end)

RegisterServerEvent('zb-huisoverval:server:zetKauloDrukStatus')
AddEventHandler('zb-huisoverval:server:zetKauloDrukStatus', function(cabin, house, bool)
    Config.Houses[house]["furniture"][cabin]["isBusy"] = bool
    TriggerClientEvent('zb-huisoverval:client:zetDrukkeOsso', -1, cabin, house, bool)
end)
