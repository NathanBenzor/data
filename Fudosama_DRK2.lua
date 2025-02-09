-- Elendnur
-- Load and initialize the include file.
include('Fudosama-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "194"
MacroBook = "34"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- Uses Items Automatically
AutoItem = false

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- Lockstyle sets to randomly equip
Lockstyle_List = {1, 2, 6, 12}

-- Set to true to run organizer on job changes
Organizer = true

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assign equipsets for them
state.OffenseMode:options('DT', 'TP', 'PDL', 'ACC', 'SB') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

-- Weapon Modes
state.WeaponMode:options('Foenaria', 'Caladbolg', 'Liberator', 'Naegling', 'Loxotic Mace', 'Lycurgos')
state.WeaponMode:set('Foenaria')

-- Initialize Player
jobsetup(LockStylePallet, MacroBook, MacroSet)

function get_sets()

    sets.Weapons = {}

    sets.Weapons['Foenaria'] = {
        main = {
            name = "Foenaria",
            augments = {'Path: A'}
        },
        sub = "Utu Grip"
    }

    sets.Weapons['Caladbolg'] = {
        main = {
            name = "Caladbolg",
            augments = {'Path: A'}
        },
        sub = "Utu Grip"
    }

    sets.Weapons['Liberator'] = {
        main = {
            name = "Liberator",
            augments = {'Path: A'}
        },
        sub = "Utu Grip"
    }

    sets.Weapons['Naegling'] = {
        main = "Naegling",
        sub = "Blurred Shield +1"
    }

    sets.Weapons['Loxotic Mace'] = {
        main = {
            name = "Loxotic Mace +1",
            augments = {'Path: A'}
        },
        sub = "Blurred Shield +1"
    }

    sets.Weapons['Lycurgos'] = {
        main = "Lycurgos",
        sub = "Utu Grip"
    }

    sets.Idle = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Sakpata's Helm",
            augments = {'Path: A'}
        },
        body = {
            name = "Sakpata's Plate",
            augments = {'Path: A'}
        },
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "Sakpata's Cuisses",
            augments = {'Path: A'}
        },
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = "Warder's Charm +1",
        waist = "Null Belt",
        left_ear = "Infused Earring",
        right_ear = "Eabani Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = "Moonbeam Cape"
    }

    sets.Idle.DT = set_combine(sets.Idle, {})

    -- Regain set
    sets.Idle.TP = set_combine(sets.Idle, {})

    sets.Movement = {
        ring1 = "Shneddick Ring"
    }

    -- Set to be used if you get 
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = {
            name = "Saida Ring",
            bag = "wardrobe1",
            priority = 2
        },
        right_ring = {
            name = "Saida Ring",
            bag = "wardrobe3",
            priority = 1
        },
        waist = "Gishdubar Sash"
    }

    sets.OffenseMode = {}

    -- Base TP set to build off
    sets.OffenseMode.TP = {
        ammo = "Coiste Bodhar",
        head = "Flam. Zucchetto +2",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = "Flam. Gambieras +2",
        neck = {
            name = "Vim Torque +1",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Crep. Earring",
        right_ear = "Telos Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Sakpata's Helm",
            augments = {'Path: A'}
        },
        body = {
            name = "Sakpata's Plate",
            augments = {'Path: A'}
        },
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "Sakpata's Cuisses",
            augments = {'Path: A'}
        },
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    })

    -- Same TP set but WSD can be altered also
    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Sakpata's Helm",
            augments = {'Path: A'}
        },
        body = {
            name = "Sakpata's Plate",
            augments = {'Path: A'}
        },
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "Sakpata's Cuisses",
            augments = {'Path: A'}
        },
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Schere Earring",
        right_ear = "Telos Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    })

    sets.OffenseMode.SB = set_combine(sets.OffenseMode.TP, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Sakpatas's Helm",
            augments = {'Path: A'}
        },
        body = "Dagon Breast.",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = "Bathy Choker +1",
        waist = "Ioskeha Belt +1",
        left_ear = "Digni. Earring",
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    })

    sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {})

    sets.DualWield = {}

    sets.Precast = {}

    -- Used for Magic Spells (Fast Cast)
    sets.Precast.FastCast = {
        ammo = "Sapience Orb", -- 2
        head = {
            name = "Carmine Mask +1",
            augments = {'Accuracy+20', 'Mag. Acc.+12', '"Fast Cast"+4'}
        }, -- 14
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5', 'HP+44'}
        }, -- 9
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        }, -- 8
        legs = {
            name = "Carmine Cuisses +1",
            augments = {'HP+80', 'STR+12', 'INT+12'}
        },
        feet = {
            name = "Carmine Greaves +1",
            augments = {'HP+80', 'MP+80', 'Phys. dmg. taken -4'}
        }, -- 8
        neck = "Voltsurge Torque", -- 4
        left_ear = "Etiolation Earring", -- 1
        left_ring = "Weather. Ring" -- 5
    }

    sets.Enmity = {}

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    sets.Midcast.SIRD = {}

    sets.Midcast.Enfeebling = set_combine(sets.Midcast, {})

    sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Enfeebling.Drain = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Enfeebling.Aspir = set_combine(sets.Midcast.Enfeebling, {})

    -- Job Abilities
    sets.JA = {}
    sets.JA["Berserk"] = {}
    sets.JA["Warcry"] = {}
    sets.JA["Defender"] = {}
    sets.JA["Aggressor"] = {}
    sets.JA["Provoke"] = sets.Precast.Enmity
    sets.JA["Third Eye"] = {}
    sets.JA["Meditate"] = {}
    sets.JA["Warding Circle"] = {}
    sets.JA["Hasso"] = {}
    sets.JA["Seigan"] = {}

    -- WS Sets
    sets.WS = {
        ammo = "Knobkierrie",
        head = "Flam. Zucchetto +2",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = "Sulev. Leggings +2",
        neck = "Fotia Gorget",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = set_combine(sets.WS, {})

    sets.WS.PDL = set_combine(sets.WS, {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
        body = {
            name = "Sakpata's Plate",
            augments = {'Path: A'}
        },
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Heath. Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS.WSD = set_combine(sets.WS, {})

    sets.WS.CRIT = set_combine(sets.WS, {})

    sets.WS.Multi_Hit = set_combine(sets.WS, {})

    -- Used to Tag TH on a mob (TH4 is max in gear non-THF)
    sets.TreasureHunter = {}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
    -- Typically used for Macro pallet changing
end

-- Adjust custom precast actions
function pretarget_custom(spell, action)

end
-- Augment basic equipment sets
function precast_custom(spell)
    equipSet = {}

    return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
    equipSet = {}

    return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
    equipSet = {}

    return equipSet
end
-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    equipSet = {}

    return equipSet
end
-- This function is called when a update request the correct equipment set
function choose_set_custom()
    equipSet = {}

    return equipSet
end
-- Function is called when the player changes states
function status_change_custom(new, old)
    equipSet = {}

    return equipSet
end
-- Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when a lua is unloaded
function user_file_unload()

end

-- Function used to automate Job Ability use
function check_buff_JA()
    buff = 'None'
    local ja_recasts = windower.ffxi.get_ability_recasts()

    if player.sub_job == 'SAM' and player.sub_job_level == 49 then
        if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
            buff = "Hasso"
        elseif not buffactive['Meditate'] and ja_recasts[134] == 0 then
            buff = "Meditate"
        end
    end

    if player.sub_job == 'WAR' and player.sub_job_level == 49 then
        if not buffactive['Berserk'] and ja_recasts[1] == 0 then
            buff = "Berserk"
        elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
            buff = "Aggressor"
        elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
            buff = "Warcry"
        end
    end

    return buff
end

function check_buff_SP()
    buff = 'None'
    -- local sp_recasts = windower.ffxi.get_spell_recasts()
    return buff
end

function pet_change_custom(pet, gain)
    equipSet = {}

    return equipSet
end

function pet_aftercast_custom(spell)
    equipSet = {}

    return equipSet
end

function pet_midcast_custom(spell)
    equipSet = {}

    return equipSet
end
