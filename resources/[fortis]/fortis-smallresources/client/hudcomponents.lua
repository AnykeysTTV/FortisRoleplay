Citizen.CreateThread(function()
	while true do
	    HideHudComponentThisFrame(0)
		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(2)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(9)
		-- HideHudComponentThisFrame(14)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(17)
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)
		
		DisplayAmmoThisFrame(true)

		Citizen.Wait(4)
	end
end) 