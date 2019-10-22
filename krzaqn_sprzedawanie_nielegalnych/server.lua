ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

----- GOLD Z NAPADU
RegisterServerEvent('krzaqn_sprzedawanie_nielegalnych:zlotoznapadu')
AddEventHandler('krzaqn_sprzedawanie_nielegalnych:zlotoznapadu', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local zlotoznapadu = xPlayer.getInventoryItem('goldznapadu').count
		
		if zlotoznapadu == 0 or zlotoznapadu < 5 then
			TriggerClientEvent('esx:showNotification', source, ('~r~Nie masz ~w~sztabek złota na sprzedaż.'))
		return
		end
			TriggerClientEvent('esx:showNotification', source, ('~g~Sprzedajesz ~w~sztabki złota...'))
			Citizen.Wait(2000)
			xPlayer.removeInventoryItem('goldznapadu', 5)
			xPlayer.addAccountMoney('black_money', 40000)
			end)

---------------------- DANE Z NAPADU
RegisterServerEvent('krzaqn_sprzedawanie_nielegalnych:daneznapadu')
AddEventHandler('krzaqn_sprzedawanie_nielegalnych:daneznapadu', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local zlotoznapadu = xPlayer.getInventoryItem('daneznapadu').count
		
		if zlotoznapadu == 0 or zlotoznapadu < 5 then
			TriggerClientEvent('esx:showNotification', source, ('~r~Nie masz ~w~danych na sprzedaż.'))
		return
		end
			TriggerClientEvent('esx:showNotification', source, ('~g~Sprzedajesz ~w~dane...'))
			Citizen.Wait(2000)
			xPlayer.removeInventoryItem('daneznapadu', 5)
			xPlayer.addAccountMoney('black_money', 40000)
			end)
-----------------------------