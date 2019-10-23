ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('krzaqn_do_napadow:zacznijkopiowacdane')
AddEventHandler('krzaqn_do_napadow:zacznijkopiowacdane', function(source)
	CopyAnimation()
end)

RegisterNetEvent('krzaqn_do_napadow:rozpocznijwiercic')
AddEventHandler('krzaqn_do_napadow:rozpocznijwiercic', function(source)
	DrillAnimation()
end)

function DrillAnimation()
	local playerPed = GetPlayerPed(-1)
	
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CONST_DRILL", 0, true)               
	end)
end

function CopyAnimation()
	 local playerPed = GetPlayerPed(-1)

	 Citizen.CreateThread(function()
		TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
	 end)
end