--[[
    Move to Map Flag (vnavmesh)
    Author: LOL
    Description: Reads the current map flag and paths to it automatically.
]]

-- SETTINGS
import("System.Numerics")

local stopDistance = 3.0    -- How close to get to the flag
local useFlying = true     -- Set to true if you want to try flying (requires flight unlocked)

local isFlag = Instances.Map.IsFlagMarkerSet
local flag = Instances.Map.Flag.Vector3

local enemyPositions = {
    
    { name = "Sapsa Shelftooth", x = -291.4, y = -41.6, z = -359.9 },
    { name = "Sapsa Shelftooth", x = -233.7, y = -40.1, z = -349.9 },
    { name = "Sapsa Shelftooth", x = -318.5, y = -39.3, z = -298.1 }

}


function isTargetDead(target)
    if target then
        while not target.IsDead do
            Dalamud.Log(target.IsDead)
            yield("/wait 1")
        end
    end

    return true
end


if isFlag then

    if not Svc.Condition[4] then
        Actions.ExecuteGeneralAction(9)
    end


    for i, enemy in ipairs(enemyPositions) do
        Dalamud.Log("Enemy Nr" .. i)
        --IPC.vnavmesh.PathfindAndMoveTo(flag, true)
        IPC.vnavmesh.PathfindAndMoveTo(Vector3(enemy.x, enemy.y, enemy.z), true)
        local enemy = Entity.GetEntityByName(enemy.name)
        local target = nil
    
        while IPC.vnavmesh.PathfindInProgress() or IPC.vnavmesh.IsRunning() do
            yield("/wait 1")
        end
    
        if enemy then
            repeat 
                Dalamud.Log(Player.Status.StatusId)
                Actions.ExecuteGeneralAction(23)
                yield("/wait 1")
    
            until not Svc.Condition[4]
            yield("/target " .. enemy.Name)
            yield("/wait 1")
            target = Svc.Targets.Target
            yield("/rsr manual")
    
            isTargetDead(target)
    
            yield("/battletarget")
            target = Svc.Targets.Target
            
            isTargetDead(target)
    
    
            Dalamud.Log("Ende")
            yield("/rsr off")
    
    
        end
    end
    
end
