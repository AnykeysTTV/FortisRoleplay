QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

-- Code

QBCore.Functions.CreateCallback('qb-tattooshop:GetPlayerTattoos', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

	if Player then
		exports['ghmattimysql']:execute('SELECT tattoos FROM tattoos WHERE citizenid = @citizenid', {
			['@citizenid'] = Player.PlayerData.citizenid
		}, function(result)
			if #result > 0 then
				if result[1].tattoos then
					cb(json.decode(result[1].tattoos))
				else
					cb()
				end
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

QBCore.Functions.CreateCallback('qb-tattooshop:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local Player = QBCore.Functions.GetPlayer(source)


	if Player.PlayerData.money.cash >= 800 then
        Player.Functions.RemoveMoney('cash', 800, "Tattoo gekocht")

		table.insert(tattooList, tattoo)

		exports['ghmattimysql']:execute('SELECT tattoos FROM tattoos WHERE citizenid = @citizenid', {
			['@citizenid'] = Player.PlayerData.citizenid
		}, function(result)
			if #result > 0 then
				if result[1].tattoos then
					exports['ghmattimysql']:execute('UPDATE tattoos SET tattoos = @tattoos WHERE citizenid = @citizenid', {
						['@tattoos'] = json.encode(tattooList),
						['@citizenid'] = Player.PlayerData.citizenid
					})
				else
					exports['ghmattimysql']:execute('INSERT INTO tattoos (citizenid, tattoos) VALUES (@citizenid, @tattoos)', {
						['@tattoos'] = json.encode(tattooList),
						['@citizenid'] = Player.PlayerData.citizenid
					})
				end
			else
				exports['ghmattimysql']:execute('INSERT INTO tattoos (citizenid, tattoos) VALUES (@citizenid, @tattoos)', {
					['@tattoos'] = json.encode(tattooList),
					['@citizenid'] = Player.PlayerData.citizenid
				})
			end
		end)


		TriggerClientEvent('QBCore:Notify', source, "Je hebt " .. tattooName .. " gekocht voor €800", 'success')
		cb(true)
	else
		TriggerClientEvent('QBCore:Notify', source, "Je hebt niet genoeg contant geld voor deze tattoo", 'success')

		cb(false)
	end
end)

RegisterServerEvent('qb-tattooshop:server:RemoveTattoo')
AddEventHandler('qb-tattooshop:server:RemoveTattoo', function (tattooList)
	local Player = QBCore.Functions.GetPlayer(source)

	



	exports['ghmattimysql']:execute('SELECT tattoos FROM tattoos WHERE citizenid = @citizenid', {
		['@citizenid'] = Player.PlayerData.citizenid
	}, function(result)
		if #result > 0 then
			if result[1].tattoos then
				exports['ghmattimysql']:execute('UPDATE tattoos SET tattoos = @tattoos WHERE citizenid = @citizenid', {
					['@tattoos'] = json.encode(tattooList),
					['@citizenid'] = Player.PlayerData.citizenid
				})
			else
				exports['ghmattimysql']:execute('INSERT INTO tattoos (citizenid, tattoos) VALUES (@citizenid, @tattoos)', {
					['@tattoos'] = json.encode(tattooList),
					['@citizenid'] = Player.PlayerData.citizenid
				})
			end
		else
			exports['ghmattimysql']:execute('INSERT INTO tattoos (citizenid, tattoos) VALUES (@citizenid, @tattoos)', {
				['@tattoos'] = json.encode(tattooList),
				['@citizenid'] = Player.PlayerData.citizenid
			})
		end
	end)
end)
