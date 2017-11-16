ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Rcon commands
RegisterCommand("weblog", function(source, args, rawCommand)
	local argz = string.gsub(rawCommand, "weblog ", "")
	argz = json.decode(argz)
	print("")
	print("====================[ESX - WEB ADMIN]====================")
	print(argz['user'] .. " used '" .. argz['action'] .. "' with the following parameters:")
	for k,v in pairs(argz) do
		if k ~= 'user' and k ~= 'action' then
			print("    " .. k .. ": " .. v)
		end
	end
	print("=========================================================")
	print("")
end, true)

RegisterCommand("setjob", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromIdentifier(args[1])
	xPlayer.setJob(args[2], tonumber(args[3]))
end, true)

RegisterCommand("giveweapon", function(source, args, rawCommand)
	local xPlayer    = ESX.GetPlayerFromIdentifier(args[1])
	local weaponName = string.upper(args[2])
	xPlayer.addWeapon(weaponName, 1000)
end, true)

RegisterCommand("giveitem", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromIdentifier(args[1])
	local item    = args[2]
	local count   = tonumber(args[3])
	xPlayer.addInventoryItem(item, count)
end, true)

RegisterCommand("givemoney", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromIdentifier(args[1])
	local amount  = tonumber(args[2])
    xPlayer.addMoney(amount)
end, true)

RegisterCommand("giveaccountmoney", function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromIdentifier(args[1])
	local account = args[2]
	local amount  = tonumber(args[3])
	xPlayer.addAccountMoney(account, amount)
end, true)