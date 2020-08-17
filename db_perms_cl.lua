
-- Permission levels:
-- -1 unintialized
-- 0-99 - user
-- 100-149 - police 
-- sasp
-- trooper 140
-- sr trooper 141
-- shift supervisor 145
-- staff supervisor 146
-- assistant sp commisionner 148
-- sp commisioner 149
-- 150-199 - offpolice
-- 200-299 - ems
-- 300-399 - fire dept
-- 400-599 - mech
--
--
--
-- 950 - playtester
--
--
--
-- 997 - moderator
-- 998 - admin
-- 999 - owner
local hasPermission = -1

function HasPermission(caller, desired)
    TriggerServerEvent('getuserperms', caller, desired) --broke below
    while hasPermission == -1 do Wait(0) end
    if hasPermission then
        hasPermission = -1
        return true
    else
        hasPermission = -1
        --TriggerEvent("alerts:add",{255, 255, 255}, {255, 74, 0}, caller, "Insufficient permissions!")
        return false
    end
end

RegisterNetEvent("telluserpermslevel")
AddEventHandler("telluserpermslevel", function (hasPermissions)
    hasPermission = hasPermissions
end)