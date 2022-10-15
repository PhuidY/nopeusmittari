function c(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(player, false)
            if IsPedInAnyVehicle(player, false) and GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 or GetPedInVehicleSeat(vehicle, -1) == GetPlayerPed(-1) and GetIsVehicleEngineRunning(vehicle) then
            local k = c(GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*3.6) --KM/H
            local b = c(GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false))*1.0)


            teksti(7, 0.5, 0.93, 0.0, 0.0, k.." km/h", 0.5, 0.5)
            teksti(7, 0.5, 0.95, 0.0, 0.0, "bensa: ~w~"..b, 0.45, 0.45)
        end
    end
end)

function teksti(fontId, x,y ,width,height, text, scale, scale1)
    SetTextFont(fontId)
    SetTextProportional(0)
    SetTextScale(scale, scale1)
    SetTextDropShadow(0, 0, 0, 0,200)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow(1)
    SetTextCentre(1)
    SetTextOutline(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

