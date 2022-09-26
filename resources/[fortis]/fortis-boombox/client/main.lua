-- Variables

QBCore = nil

Citizen.CreateThread(function() 
    if QBCore == nil then
        TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

local currentData = nil

-- Functions

local function loadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      Wait(5)
  end
end

local function helpText(text)
	SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
 
-- Events

RegisterNetEvent('fortis-boombox:client:placeBoombox', function()
    local pedcoords = GetEntityCoords(PlayerPedId())
    if not toegestaan then
        for k, v in pairs(Config.BlacklistedLocaties) do
            if GetDistanceBetweenCoords(v.x, v.y, v.z, pedcoords.x, pedcoords.y, pedcoords.z, true) > 100 or GetDistanceBetweenCoords(Config.BlacklistedLocaties[2].x, Config.BlacklistedLocaties[2].y, Config.BlacklistedLocaties[2].z, pedcoords.x, pedcoords.y, pedcoords.z, true) > 50 then
                toegestaan = true
            else
                QBCore.Functions.Notify("Je mag hier geen boombox plaatsen!", "error")
                toegestaan = false
                return
            end
        end
    end 
    Citizen.Wait(100)
    if toegestaan then
        TriggerServerEvent("fortis-boombox:server:plaatsen")
        loadAnimDict("anim@heists@money_grab@briefcase")
        TaskPlayAnim(PlayerPedId(), "anim@heists@money_grab@briefcase", "put_down_case", 8.0, -8.0, -1, 1, 0, false, false, false)
        Citizen.Wait(1000)
        ClearPedTasks(PlayerPedId())
        local coords = GetEntityCoords(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        local forward = GetEntityForwardVector(PlayerPedId())
        local x, y, z = table.unpack(coords + forward * 0.5)
        local object = CreateObject(GetHashKey('prop_boombox_01'), x, y, z, true, false, false)
        PlaceObjectOnGroundProperly(object)
        SetEntityHeading(object, heading)
        FreezeEntityPosition(object, true)
        currentData = NetworkGetNetworkIdFromEntity(object)
        toegestaan = false
    end
end)

RegisterNetEvent('fortis-boombox:client:pickupBoombox', function()
    local obj = NetworkGetEntityFromNetworkId(currentData)
    local objCoords = GetEntityCoords()
    NetworkRequestControlOfEntity(obj)
    loadAnimDict("anim@heists@narcotics@trash")
    TaskPlayAnim(PlayerPedId(), "anim@heists@narcotics@trash", "pickup", 8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityAsMissionEntity(obj,false,true)
    DeleteEntity(obj)
    DeleteObject(obj)
    if not DoesEntityExist(obj) then
        TriggerServerEvent('fortis-boombox:server:pickedup', currentData)
        currentData = nil
    end
    Citizen.Wait(500)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('fortis-boombox:client:playMusic', function()
    local musicMenu = {
      {
          isHeader = true,
          header = '💿 | Boombox'
      },
      {
          header = '🎶 | Speel een liedje',
          txt = 'Gebruik youtube linkjes',
          params = {
              event = 'fortis-boombox:client:musicMenu',
              args = {

              }
          }
      },
      {
          header = '⏸️ | Pauzeer de muziek',
          txt = 'Pauzeren',
          params = {
              isServer = true,
              event = 'fortis-boombox:server:pauseMusic',
              args = {
                  entity = currentData,
              }
          }
      }, 
      {
          header = '▶️ | Hervat de muziek',
          txt = 'Hervat de gepauzeerde muziek',
          params = {
              isServer = true,
              event = 'fortis-boombox:server:resumeMusic',
              args = {
                  entity = currentData,
              }
          }
      },
      {
          header = '🔈 | Verander volume',
          txt = 'Verander muziek volume',
          params = {
              event = 'fortis-boombox:client:changeVolume',
              args = {

              }
          }
      },
      {
          header = '❌ | Stop de muziek',
          txt = 'Stop de muziek en kies een ander nummer',
          isServer = true,
          params = {
              isServer = true,
              event = 'fortis-boombox:server:stopMusic',
              args = {
                  entity = currentData,
              }
          }
      },
      {
          header = '❌ | Pickup',
          txt = 'Stop de muziek en pak de boombox',
          params = {
              event = 'fortis-boombox:client:pickupBoombox',
              args = {
              }
          }
      }
    }
    exports['fortis-menu']:openMenu(musicMenu)
end)

RegisterNetEvent('fortis-boombox:client:musicMenu', function()
    local notify = false
    local dialog = exports['fortis-input']:ShowInput({
        header = 'Song Selection',
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'song',
                text = 'YouTube URL'
            }
        } 
    })
    if dialog then
        if not dialog.song then return end
        if string.find(dialog.song, "https://www.youtube.com/watch?") then
            TriggerServerEvent('fortis-boombox:server:playMusic', dialog.song, currentData, GetEntityCoords(NetworkGetEntityFromNetworkId(currentData)))
        else
            QBCore.Functions.Notify("Iets anders dan een youtube link is niet toegestaan!", "error")
        end
    end 
end)

RegisterNetEvent('fortis-boombox:client:changeVolume', function()
    local dialog = exports['fortis-input']:ShowInput({
        header = 'Music Volume',
        submitText = "Submit",
        inputs = {
            {
                type = 'text', -- number doesn't accept decimals??
                isRequired = true,
                name = 'volume',
                text = 'Min: 0.01 - Max: 0.7'
            }
        }
    })
    if dialog then
        if not dialog.volume then return end
        TriggerServerEvent('fortis-boombox:server:changeVolume', dialog.volume, currentData)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if isLoggedIn then
            local ped = PlayerPedId()
            local coords    = GetEntityCoords(ped)
            local object = GetClosestObjectOfType(coords, 3.0, GetHashKey('prop_boombox_01'), false, false, false)
            if DoesEntityExist(object) then
                local objCoords = GetEntityCoords(object)
                if #(coords - objCoords) < 4 then
                  currentData = NetworkGetNetworkIdFromEntity(object)
                    helpText('Press ~INPUT_CONTEXT~ to play music.')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent('fortis-boombox:client:playMusic')
                    end
                    sleep = 5
                else
                  exports['fortis-menu']:closeMenu()
                end
            end
        end
        Wait(sleep)
    end
end)