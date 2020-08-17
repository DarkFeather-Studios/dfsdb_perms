
RegisterNetEvent('getuserperms')
AddEventHandler('getuserperms', function(caller, desired)
    TriggerClientEvent('telluserpermslevel', source, HasPermission_sv(source, caller, desired)) 
end)

function HasPermission_sv(PlayerID, caller, desired)
    if PlayerID > 0 then
        local steamID = GetPlayerIdentifiers(PlayerID)[1] -- This is not returning anything.
        local PermsLV = MySQL.Sync.fetchScalar("SELECT `permission_level` FROM useraccounts WHERE `steam_id`='" .. steamID .. "'")
        local PlayerIdentity = exports.dfs:GetTheirIdentity(PlayerID)
        print("db_perms_sv: "..PlayerIdentity.FirstName.." "..PlayerIdentity.LastName.." ("..PlayerID..") just ".. (PermsLV >= desired and "ran /" or "failed to run /")..caller)
        if PermsLV >= desired then 
            MySQL.Async.execute("INSERT INTO metrics_dbperms (`command`, `identifier`) VALUES (@cmd, @off)",
            {cmd = caller, off = GetPlayerIdentifiers(PlayerID)[1]} )
            return true
        else 
            --TriggerClientEvent("alerts:add", PlayerID, {255, 255, 255}, {255, 74, 0}, caller, "Insufficient permissions!")
            LogOffender(PlayerID, caller)
            return false 
        end
    else
        MySQL.Async.execute("INSERT INTO metrics_dbperms (`command`, `identifier`) VALUES (@cmd, @off)",
        {cmd = caller, off = "RCON"} )
        return true
    end
end

function LogOffender(PlayerID, commandrun) --todo: log successes
    MySQL.Async.execute("INSERT INTO metrics_dbperms (`command`, `identifier`, `offense`) VALUES (@cmd, @off, @offense)",
    {cmd = commandrun, off = GetPlayerIdentifiers(PlayerID)[1], offense = 1} )
end