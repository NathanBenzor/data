-- Fudosama_DNC3.lua - Minimal GearSwap test for detecting XI Rolls and equipping Roller's Ring

function get_sets()
    sets.idle = {
        head = 'Malignance Chapeau',
        body = 'Malignance Tabard',
        hands = 'Malignance Gloves',
        legs = 'Malignance Tights',
        feet = 'Malignance Boots',
        left_ring = "Defending Ring",
        right_ring = 'Epona\'s Ring'
    }

    sets.engaged = {
        head = 'Malignance Chapeau',
        body = 'Malignance Tabard',
        hands = 'Malignance Gloves',
        legs = 'Malignance Tights',
        feet = 'Malignance Boots',
        left_ring = "Regal Ring",
        right_ring = "Epona's Ring"
    }

    send_command('input /echo Fudosama_DNC3.lua loaded.')
end

local corRolls = {
    "Corsair's Roll",
    "Ninja Roll",
    "Hunter's Roll",
    "Chaos Roll",
    "Magus's Roll",
    "Healer's Roll",
    "Drachen Roll",
    "Choral Roll",
    "Monk's Roll",
    "Beast Roll",
    "Samurai Roll",
    "Evoker's Roll",
    "Rogue's Roll",
    "Warlock's Roll",
    "Fighter's Roll",
    "Puppet Roll",
    "Gallant's Roll",
    "Wizard's Roll",
    "Dancer's Roll",
    "Scholar's Roll",
    "Naturalist's Roll",
    "Runeist's Roll",
    "Bolter's Roll",
    "Caster's Roll",
    "Courser's Roll",
    "Blitzer's Roll",
    "Tactician's Roll",
    "Allies' Roll",
    "Miser's Roll",
    "Companion's Roll",
    "Avenger's Roll"
}

function hasCorsairRollXI()
    for _, rollName in ipairs(corRolls) do
        if buffactive[rollName] then
            windower.add_to_chat(8, "Detected XI Roll (by name): " .. rollName)
            return true
        end
    end
    return false
end

function choose_set()
    local baseSet = {}

    if player.status == "Engaged" then
        baseSet = sets.engaged
    else
        baseSet = sets.idle
    end

    if hasCorsairRollXI() then
        windower.add_to_chat(8, "Equipping Roller's Ring due to XI roll!")
        baseSet.right_ring = "Roller's Ring"
    else
        windower.add_to_chat(8, "No XI roll active. Equipping normal ring.")
    end

    return baseSet
end

function status_change(new, old)
    equip(choose_set())
end

function buff_change(name, gain)
    if string.find(name, "Roll") then
        windower.add_to_chat(8, "[DEBUG] Buff change: " .. name .. " | Gained: " .. tostring(gain))
        equip(choose_set())
    end
end

function self_command(command)
    if command == "checkxi" then
        windower.add_to_chat(8, "[DEBUG] Manually checking for XI...")
        equip(choose_set())
    end
end
