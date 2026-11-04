local garages = {
    {name = 'Garage 1', x = 123.45, y = 67.89, z = 10.11, heading = 0.0},
    {name = 'Garage 2', x = 234.56, y = 78.90, z = 11.12, heading = 0.0}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for _, garage in ipairs(garages) do
            local distance = #(playerCoords - vector3(garage.x, garage.y, garage.z))

            if distance < 2.0 then
                DrawText3D(garage.x, garage.y, garage.z, 'Press E to access ' .. garage.name)

                if IsControlJustPressed(0, 38) then -- E key
                    TriggerServerEvent('garage:open', garage.name)
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov

    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end