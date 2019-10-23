ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('wiertlo', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local drill = xPlayer.getInventoryItem('wiertlo')

    xPlayer.removeInventoryItem('wiertlo', 1)
    TriggerClientEvent('krzaqn_do_napadow:rozpocznijwiercic', source)
end)

ESX.RegisterUsableItem('pendrive', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local pendrive = xPlayer.getInventoryItem('pendrive')

    xPlayer.removeInventoryItem('pendrive', 1)
    TriggerClientEvent('krzaqn_do_napadow:zacznijkopiowacdane', source)
end)
