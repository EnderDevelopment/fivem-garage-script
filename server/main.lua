local garages = {
    ['Garage 1'] = {
        vehicles = {
            {model = 'adder', x = 123.45, y = 67.89, z = 10.11, heading = 0.0},
            {model = 'infernus', x = 123.45, y = 67.89, z = 10.11, heading = 0.0}
        }
    },
    ['Garage 2'] = {
        vehicles = {
            {model = 'zentorno', x = 234.56, y = 78.90, z = 11.12, heading = 0.0},
            {model = 'reaper', x = 234.56, y = 78.90, z = 11.12, heading = 0.0}
        }
    }
}

RegisterServerEvent('garage:open')
AddEventHandler('garage:open', function(garageName)
    local source = source
    local garage = garages[garageName]

    if garage then
        TriggerClientEvent('garage:spawnVehicles', source, garage.vehicles)
    end
end)