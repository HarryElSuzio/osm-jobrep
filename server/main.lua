QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent("osm:server:incjobrep")
AddEventHandler('osm:server:incjobrep', function(amount)

	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	if Player ~= nil then

		if Player.PlayerData.metadata["jobrep"] == nil then
			Player.PlayerData.metadata["jobrep"] = 0
		end
		
		if amount ~= nil and amount > 0 then 
			newjobrep = Player.PlayerData.metadata["jobrep"] + amount
			Player.Functions.SetMetaData("jobrep", newjobrep)
		else
			newjobrep = Player.PlayerData.metadata["jobrep"] + 1
			Player.Functions.SetMetaData("jobrep", newjobrep)
		end 

		Player.Functions.Notify('You Earned Job '..amount..' Reputation Points ', 'success')

	end
end)

