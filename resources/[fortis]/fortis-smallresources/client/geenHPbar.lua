RegisterNetEvent("fortis-smallresources:client:geenHPbar")
AddEventHandler("fortis-smallresources:client:geenHPbar", function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    SetRadarBigmapEnabled(false, false)
    while true do
        Citizen.Wait(1)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)