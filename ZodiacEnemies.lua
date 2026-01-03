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
    -- { name = "Sapsa Shelftooth", x = -233.7, y = -40.1, z = -349.9 },
    -- { name = "Sapsa Shelftooth", x = -318.5, y = -39.3, z = -298.1 }

}

local killsRequired = 3

local zodiacBooks = {

    -- Zones
    -- Mor Dhona 156 / 24
    -- Outer La Noscea 180 / 16
    -- Western La Noscea 138 / 14
    -- Eastern La Noscea 137 / 12
    -- Southern Thnalan 146 / 19
    -- East Shroud 152 / 4
    -- North Shroud 154 / 7
    -- Coerthas 155 / 23


    -- BOOK: Skyfire I
    SkywindII = {
        { name = "Sapsa Shelftooth", zoneId = 138, aetheryiteId = 14, x = -291.4, y = -41.6, z = -359.9 },
        -- { name = "Sapsa Shelftooth", x = -233.7, y = -40.1, z = -349.9 },
        -- { name = "Sapsa Shelftooth", x = -318.5, y = -39.3, z = -298.1 },
        -- Add other Skyfire I mobs here...
        -- { name = "U'Ghamaro Golem", x = 0.0, y = 0.0, z = 0.0 },
    },
    SkyEarthI = {
        { name = "Amalj'aa Scavenger", zoneId = 146, aetheryiteId = 19, x = -49.1, y = -1.5, z = -7.3 },
        { name = "Zahar'ak Pugilist", zoneId = 146, aetheryiteId = 19, x = 111.5, y = 15.9, z = 13.8 },
        { name = "Elite Quarryman", zoneId = 180, aetheryiteId = 16, x = 160.8, y = 21.4, z = -707.4 },
        { name = "Ixali Boldwing", zoneId = 154, aetheryiteId = 7, x = -14.5, y = -9.8, z = -40.5 },
        { name = "Hapalit", zoneId = 156, aetheryiteId = 24, x = 479.0, y = -0.6, z = -795.7 },
        { name = "Violet Sigh", zoneId = 152, aetheryiteId = 4 x = 120.1, y = -21.5, z = -298.6 },
        { name = "5th Cohort Secutor", zoneId = 156, aetheryiteId = 24, x = -570.6, y = -2.9, z = -424.8 },
        { name = "Axolotl", zoneId = 138, aetheryiteId = 14, x = -381.4, y = -36.8, z = -301.5 },
        { name = "Natalan Swiftbeak", zoneId = 155, aetheryiteId = 23, x = 636.8, y = 289.0, z = 22.8 },
        { name = "2nd Cohort Signifer", zoneId = 137, aetheryiteId =12, x = 120.1, y = -21.5, z = -298.6 },
    },

    -- BOOK: Skyfire II
    SkyfireII = {
        -- { name = "Giant Logger", x = 123.4, y = 50.0, z = 321.0 },
    },

    -- BOOK: Netherfire I
    NetherfireI = {
        -- { name = "Violet Screech", x = 0.0, y = 0.0, z = 0.0 },
    },

    -- BOOK: Netherfire I
    NetherfireII = {
    },

    -- BOOK: Fallgourd I
    FallgourdI = {
    },

    -- BOOK: Fallgourd II
    FallgourdII = {
    },

    -- BOOK: Stormzap I
    StormzapI = {
    },

    -- BOOK: Stormzap II
    StormzapII = {
    },

    -- BOOK: Windshard (The combined one)
    Windshard = {
    }
}


function waitForTargetDeath(target)
    if target then
        while not target.IsDead do
            yield("/wait 1")
        end

        return true
    end

    return false
end

function moveTo(x, y, z, flying)
    IPC.vnavmesh.PathfindAndMoveTo(Vector3(x, y, z), true)
end


for i, enemy in ipairs(enemyPositions) do


    if not Svc.Condition[4] then
        Actions.ExecuteGeneralAction(9)
    end

    moveTo(enemy.x, enemy.y, enemy.z, true)


    while IPC.vnavmesh.PathfindInProgress() or IPC.vnavmesh.IsRunning() do
        yield("/wait 1")
    end

    repeat 
        Dalamud.Log(Player.Status.StatusId)
        Actions.ExecuteGeneralAction(23)
        yield("/wait 1")
    until not Svc.Condition[4]

    local killCount = 0
    local target = nil

    while killCount < killsRequired do

        Dalamud.Log("Current kill count: " .. killCount)
        local currentEnemy = Entity.GetEntityByName(enemy.name)

        if currentEnemy.CurrentHp > 0 then

            yield("/target " .. currentEnemy.Name)
            yield("/wait 1")
            target = Svc.Targets.Target
        end

        if target then

            Dalamud.Log(target.Name)
            Dalamud.Log(enemy.name)

            yield("/rsr manual")
            waitForTargetDeath(target)
            yield("/rsr off")
            killCount = killCount + 1
            
        else
            Dalamud.Log("Waiting for enemy spawn...")
            yield("/battletarget")

            target = Svc.Targets.Target
            if target then
                yield("/rsr manual")
                waitForTargetDeath(target)
                yield("/rsr off")
            end

            yield("/wait 5")
        end

        target = nil

    end

    Dalamud.Log("Ende")
    yield("/rsr off")
end
    

