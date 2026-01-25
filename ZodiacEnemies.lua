--[[
    Zodiac books enemy helper
    Author: danellidesign
    Description: Helps reducing the pain :)
]]

-- SETTINGS
import("System.Numerics")

local zodiacBooks = {

    -- Zones
    -- Mor Dhona 156 / 24
    -- Outer La Noscea 180 / 16
    -- Western La Noscea 138 / 14
    -- Eastern La Noscea 137 / 12
    -- Western Thanalan 140 / 17
    -- Southern Thnalan 146 / 19
    -- Northern Thanalan 147 / 22
    -- East Shroud 152 / 4
    -- South Shroud 153 / 5
    -- North Shroud 154 / 7
    -- Coerthas 155 / 23


    -- BOOK: Skyfire I
    SkywindII = {
        { name = "Sapsa Shelftooth", zoneId = 138, aetheryiteId = 14, x = -291.4, y = -41.6, z = -359.9 },
    },
    -- BOOK: Skyearth I
    SkyEarthI = {
        { name = "Amalj'aa Scavenger", zoneId = 146, aetheryiteId = 19, x = -49.1, y = -1.5, z = -7.3 },
        { name = "Zahar'ak Pugilist", zoneId = 146, aetheryiteId = 19, x = 111.5, y = 15.9, z = 13.8 },
        { name = "Elite Quarryman", zoneId = 180, aetheryiteId = 16, x = 160.8, y = 21.4, z = -707.4 },
        { name = "Ixali Boldwing", zoneId = 154, aetheryiteId = 7, x = -14.5, y = -9.8, z = -40.5 },
        { name = "Hapalit", zoneId = 156, aetheryiteId = 24, x = 479.0, y = -0.6, z = -795.7 },
        { name = "Violet Sigh", zoneId = 152, aetheryiteId = 4, x = 120.1, y = -21.5, z = -298.6 },
        { name = "5th Cohort Secutor", zoneId = 156, aetheryiteId = 24, x = -570.6, y = -2.9, z = -424.8 },
        { name = "Axolotl", zoneId = 138, aetheryiteId = 14, x = -381.4, y = -36.8, z = -301.5 },
        { name = "Natalan Swiftbeak", zoneId = 155, aetheryiteId = 23, x = 636.8, y = 289.0, z = 22.8 },
        { name = "2nd Cohort Signifer", zoneId = 137, aetheryiteId = 12, x = 205.8, y = 73.9, z = -10.6 }
    },
    -- BOOK: Skyfire I
    SkyfireI = {
        { name = "Daring Harrier", zoneId = 156, aetheryiteId = 24, x = -215.7, y = -3.4, z = -288.2 },
        { name = "5th Cohort Vanguard", zoneId = 156, aetheryiteId = 24, x = -545.1, y = -1.7, z = -308.5 },
        { name = "Giant Logger", zoneId = 155, aetheryiteId = 23, x = -278.8, y = 262.0, z = 326.8 },
        { name = "Shoalspine Sahagin", zoneId = 138, aetheryiteId = 14, x = -208.6, y = -42.2, z = -233.0 },
        { name = "4th Cohort Hoplomachus", zoneId = 140, aetheryiteId = 17, x = -529.1, y = 51.7, z = -775.3 },
        { name = "Basilisk", zoneId = 147, aetheryiteId = 22, x = 32.5, y = 11.2, z = 257.3 },
        { name = "Zanr'ak Pugilist", zoneId = 146, aetheryiteId = 19, x = -9.6, y = 37.8, z = 206.8 },
        { name = "Synthetic Doblyn", zoneId = 180, aetheryiteId = 16, x = 76.6, y = 24.0, z = -716.8 },
        { name = "Milkroot Cluster", zoneId = 152, aetheryiteId = 4, x = 133.9, y = -29.0, z = -223.5 },
        { name = "2nd Cohort Hoplomachus", zoneId = 137, aetheryiteId = 12, x = 381.6, y = 76.4, z = -22.8 }
    },
    -- BOOK: Skyfire II
    SkyfireII = {
        { name = "Raging Harrier", zoneId = 156, aetheryiteId = 24, x = -215.7, y = -3.4, z = -288.2 },
        { name = "Biast", zoneId = 155, aetheryiteId = 23, x = -362.1, y = 237.2, z = 389.3 },
        { name = "Natalan Boldwing", zoneId = 155, aetheryiteId = 23, x = 656.9, y = 286.1, z = 53.2 },
        { name = "Dullahan", zoneId = 154, aetheryiteId = 7, x = 76.6, y = 7.3, z = -62.7 },
        { name = "U'Ghamaro Golem", zoneId = 180, aetheryiteId = 16, x = 290.7, y = 21.5, z = -711.7 },
        { name = "Sylpheed Sigh", zoneId = 152, aetheryiteId = 4, x = 399.1, y = -27.6, z = -487.1 },
        { name = "Shoaltooth Sahagin", zoneId = 138, aetheryiteId = 14, x = -184.4, y = -42.3, z = -277.0 },
        { name = "Shelfscale Reaver", zoneId = 138, aetheryiteId = 14, x = -428.8, y = -40.8, z = -225.4 },
        { name = "Tempered Gladiator", zoneId = 146, aetheryiteId = 19, x = 39.7, y = 23.5, z = -136.1 },
        { name = "Zahar'ak Archer", zoneId = 146, aetheryiteId = 19, x = 269.9, y = 11.4, z = -12.8 }
    },

    -- BOOK: Netherfire I
    NetherfireI = {
        { name = "Wild Hog", zoneId = 153, aetheryiteId = 5, x = 467.0, y = 2.7, z = 170.5 },
        { name = "Sylpheed Screech", zoneId = 152, aetheryiteId = 4, x = 434.8, y = -28.2, z = -469.8 },
        { name = "Gigas Bonze", zoneId = 156, aetheryiteId = 24, x = 358.4, y = -5.7, z = -465.6 },
        { name = "Hexing Harrier", zoneId = 156, aetheryiteId = 24, x = -221.5, y = 18.4, z = -222.7 },
        { name = "Zahar'ak Fortune-Teller", zoneId = 146, aetheryiteId = 19, x = 410.2, y = 12.5, z = -112.6 },
        { name = "Tempered Orator", zoneId = 146, aetheryiteId = 19, x = -1.0, y = 8.6, z = -92.1 },
        { name = "Giant Lugger", zoneId = 155, aetheryiteId = 23, x = -465.7, y = 271.6, z = 253.6 },
        { name = "U'Ghamaro Roundsman", zoneId = 180, aetheryiteId = 16, x = 107.8, y = 24.4, z = -719.3 },
        { name = "Shelfclaw Reaver", zoneId = 138, aetheryiteId = 14, x = -430.2, y = -40.8, z = -221.0 },
        { name = "2nd Cohort Laquearius", zoneId = 137, aetheryiteId = 12, x = 306.4, y = 76.5, z = -15.0 }
    },

    -- BOOK: Skyfall I
    SkyfallI = {
        { name = "Shelfscale Sahagin", zoneId = 138, aetheryiteId = 14, x = -80.7, y = -28.7, z = -132.1 },
        { name = "Sea wasp", zoneId = 138, aetheryiteId = 14, x = -352.1, y = -39.0, z = -222.3 },
        { name = "U'Ghamaro Quarryman", zoneId = 180, aetheryiteId = 16, x = 87.0, y = 24.8, z = -701.5 },
        { name = "Amalj'aa Lancer", zoneId = 146, aetheryiteId = 19, x = -124.9, y = 12.2, z = 78.8 },
        { name = "Magitek Vanguard", zoneId = 147, aetheryiteId = 22, x = -218.7, y = 80.2, z = -229.8 },
        { name = "Mudpuppy", zoneId = 156, aetheryiteId = 24, x = -364.5, y = -5.6, z = -533.9 },
        { name = "Lake Cobra", zoneId = 156, aetheryiteId = 24, x = 214.7, y = -23.8, z = -443.4 },
        { name = "Sylphlands Sentinel", zoneId = 152, aetheryiteId = 4, x = 157.4, y = -25.5, z = -511.9 },
        { name = "Giant Reader", zoneId = 155, aetheryiteId = 23, x = -422.9, y = 240.1, z = 327.9 },
        { name = "2nd Cohort Eques", zoneId = 137, aetheryiteId = 12, x = 306.4, y = 76.5, z = -15.0 }
    },

    -- BOOK: Skyfall II
    SkyfallII = {
        { name = "Iron Tortoise", zoneId = 146, aetheryiteId = 19, x = -80.7, y = -28.7, z = -132.1 },
        { name = "Ked", zoneId = 153, aetheryiteId = 5, x = -352.1, y = -39.0, z = -222.3 },
        { name = "U'Ghamaro Bedesman", zoneId = 180, aetheryiteId = 16, x = 87.0, y = 24.8, z = -701.5 },
        { name = "4th Cohort Laquearius", zoneId = 140, aetheryiteId = 17, x = -124.9, y = 12.2, z = 78.8 },
        { name = "Gigas Bikkhus", zoneId = 156, aetheryiteId = 24, x = -218.7, y = 80.2, z = -229.8 },
        { name = "5th Cohort Hoplomachus", zoneId = 156, aetheryiteId = 24, x = -364.5, y = -5.6, z = -533.9 },
        { name = "Sylph Bonnet", zoneId = 152, aetheryiteId = 4, x = 157.4, y = -25.5, z = -511.9 },
        { name = "Shelfeye Reaver", zoneId = 138, aetheryiteId = 14, x = 214.7, y = -23.8, z = -443.4 },
        { name = "Sapsa Shelfscale", zoneId = 138, aetheryiteId = 14, x = -422.9, y = 240.1, z = 327.9 },
        { name = "Natalan Watchwolf", zoneId = 155, aetheryiteId = 23, x = 306.4, y = 76.5, z = -15.0 }
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

local currentBook = "SkyfallII"
local stopDistance = 3.0    -- How close to get to the flag
local useFlying = true     -- Set to true if you want to try flying (requires flight unlocked)
local killsRequired = 3
local isFlag = Instances.Map.IsFlagMarkerSet
local flag = Instances.Map.Flag.Vector3

local selectedList = zodiacBooks[currentBook]

function waitForTargetDeath(target)
    if target then
        while not target.IsDead do
            yield("/vnav stop")
            yield("/vnav movetarget")
            -- Wait for finishing moving to destination
            while IPC.vnavmesh.PathfindInProgress() or IPC.vnavmesh.IsRunning() do
                yield("/wait 1")
            end
            yield("/send NUMPAD0")
            yield("/wait 1")
        end

        return true
    end

    return false
end

function moveTo(x, y, z, flying)
    IPC.vnavmesh.PathfindAndMoveTo(Vector3(x, y, z), true)
end

function moveAndKill(target)
    yield("/rsr manual")
    waitForTargetDeath(target)
    yield("/rsr off")
end


for i, enemy in ipairs(selectedList) do

    -- Check if player is in zone. If not, teleport to it
    while Svc.ClientState.TerritoryType ~= enemy.zoneId and not Svc.Condition[27] do
        IPC.Lifestream.Teleport(enemy.aetheryiteId, 0)
        Dalamud.Log("Teleporting to " .. enemy.name)
        yield("/wait 15")
    end

    -- Mount up
    repeat 
        Actions.ExecuteGeneralAction(9)
        yield("/wait 1")
    until Svc.Condition[4]

    moveTo(enemy.x, enemy.y, enemy.z, true)

    -- Wait for finishing moving to destination
    while IPC.vnavmesh.PathfindInProgress() or IPC.vnavmesh.IsRunning() do
        yield("/wait 1")
    end

    -- Dismount
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

            moveAndKill(target)

            killCount = killCount + 1
            
        else
            Dalamud.Log("Waiting for enemy spawn...")
            yield("/wait 5")
        end

        target = nil

        

    end

    -- clean up potential adds
    while Svc.Condition[26] do
        Dalamud.Log("Cleaning up enemies")
        yield("/battletarget")

        target = Svc.Targets.Target
        if target then
            moveAndKill(target)
        end
        yield("/wait 1")
    end

    Dalamud.Log("Ende")
    yield("/rsr off")
end
    

