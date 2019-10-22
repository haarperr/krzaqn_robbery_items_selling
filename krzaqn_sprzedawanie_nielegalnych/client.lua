ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function LocalPed()
	return GetPlayerPed(-1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			DrawMarker(27, -166.50, 6067.08, 29.85, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 1.0001, 255, 255, 102, 165, 0, 0, 0,0)
			if GetDistanceBetweenCoords(-166.50, 6067.08, 29.85, GetEntityCoords(LocalPed())) < 0.5 then
				local playerPed = PlayerPedId()
				if not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'sprzedawanie_menu') then
					SetTextComponentFormat('STRING');
					AddTextComponentString("Wciśnij ~INPUT_CONTEXT~ aby zapukać do ~b~drzwi");
					DisplayHelpTextFromStringLabel(0, 0, 1, -1);
						if IsControlJustReleased(0, 38) then
							OpenActionMenuSell()
						end
				end
			end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(0, 177) and ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'sprzedawanie_menu') then
				ESX.UI.Menu.CloseAll()
			end
	end
end)

RegisterNetEvent('zlotozskarbca')
AddEventHandler('zlotozskarbca',function() 
	TriggerServerEvent("krzaqn_sprzedawanie_nielegalnych:zlotoznapadu")
	ESX.UI.Menu.CloseAll()
end)
RegisterNetEvent('danezhumana')
AddEventHandler('danezhumana',function() 
	TriggerServerEvent("krzaqn_sprzedawanie_nielegalnych:daneznapadu")
	ESX.UI.Menu.CloseAll()
end)


function OpenActionMenuSell(target)

	local elements = {}

	table.insert(elements, {label = ('Sztabki złota 5szt 40000$'), value = 'zlotozskarbca'})
	table.insert(elements, {label = ('Pendrive z danymi 5szt 40000$'), value = 'danezhumana'})
  		ESX.UI.Menu.CloseAll()	

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'sprzedawanie_menu',
		{
			title    = ('Kupiec'),
			align    = 'top-left',
			elements = elements
		},
		
    function(data, menu)
		
		if data.current.value == 'zlotozskarbca' then
		TriggerEvent('zlotozskarbca')
		elseif data.current.value == 'danezhumana' then
		TriggerEvent('danezhumana')
		end 
	end)
end

Citizen.CreateThread(function()
	for i=1, #Config.Map, 1 do
		local blip = AddBlipForCoord(Config.Map[i].x, Config.Map[i].y, Config.Map[i].z)
		SetBlipSprite (blip, Config.Map[i].id)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, Config.Map[i].color)
		SetBlipScale (blip, Config.Map[i].scale)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Map[i].name)
		EndTextCommandSetBlipName(blip)
	end
end)

