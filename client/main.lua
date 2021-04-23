QBCore = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1)
		if QBCore == nil then
			
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('osm:server:incjobrep')
AddEventHandler('osm:server:incjobrep', function(amount)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player ~= nil then 
		
		TriggerServerEvent('osm:server:incjobrep', amount)

	end 
	
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(60 * 60000)

		if isLoggedIn and Config.TimeBasedRep ~= 0 then 
	
			QBCore.Functions.GetPlayerData(function(PlayerData)
				if PlayerData ~= nil then
					curjobrep = PlayerData.metadata["jobrep"]
					job = PlayerData.job
				end
			end)
					
			if curjobrep ~= nil and curjobrep > 0 and job ~= "unemployed" then 
					TriggerServerEvent('osm:server:incjobrep', Config.TimeBasedRep) 
			end 	
				
		end

	end
end)

