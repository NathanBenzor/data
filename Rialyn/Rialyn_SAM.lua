-- Morwen
-- Load and initialize the include file.
include('Rialyn-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "10"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP', 'ACC', 'DT', 'SB', 'PDL', 'CRIT', 'MEVA') -- ACC effects WS and TP modes

jobsetup(LockStylePallet, MacroBook, MacroSet)

-- Weapons specific to Samurai
state.WeaponMode:options('Dojikiri', 'Shining One')
state.WeaponMode:set('Dojikiri')

function get_sets()

    -- Weapon setup
    sets.Weapons['Dojikiri'] = {
        main = {
            name = "Dojikiri Yasutsuna",
            augments = {'Path: A'}
        },
        sub = "Utu Grip"
    }

    sets.Weapons['Yoichinoyumi'] = {
        main = {
            name = "Dojikiri Yasutsuna",
            augments = {'Path: A'}
        },
        sub = "Utu Grip"
        -- range="Yoichinoyumi",
        -- ammo="Stone Arrow"
    }

    sets.Weapons['Masamune'] = {
        main = {
            name = "Masamune",
            augments = {'Path: A'}
        },
        sub = "Utu Grip"
    }

    sets.Weapons['Shining One'] = {
        main = "Shining One",
        sub = "Utu Grip"
    }

    -- Standard Idle set with -DT, Refresh and Regen gear
    sets.Idle = {
        sub = "Utu Grip",
        ammo = "Crepuscular Pebble",
        head = "Null Masque",
        body = "Adamantite Armor",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Flume Belt +1",
        left_ear = "Etiolation Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Defending Ring",
        right_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        back = "Moonbeam Cape"
    }
    sets.Idle.TP = set_combine(sets.Idle, {})
    sets.Idle.ACC = set_combine(sets.Idle, {})
    sets.Idle.DT = set_combine(sets.Idle, {})
    sets.Idle.PDL = set_combine(sets.Idle, {})
    sets.Idle.SB = set_combine(sets.Idle, {})
    sets.Idle.CRIT = set_combine(sets.Idle, {})
    sets.Idle.MEVA = set_combine(sets.Idle, {})
    sets.Idle.Resting = set_combine(sets.Idle, {})

    sets.Movement = {
        left_ring = "Shneddick Ring"
    }

    -- Set to be used if you get cursna casted on you
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = {
            name = "Saida Ring",
            bag = "wardrobe2",
            priority = 2
        },
        right_ring = {
            name = "Saida Ring",
            bag = "wardrobe3",
            priority = 1
        },
        waist = "Gishdubar Sash"
    }

    -- Base TP set to build off
    sets.OffenseMode = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        -- head = "Kasuga Kabuto +3",
        head = "Flamma Zucchetto +2",
        -- body = "Kasuga Domaru +3",
        body = "Ken. Samue +1",
        -- body = "Mpaca's Doublet",
        hands = {
            name = "Tatena. Gote +1",
            augments = {'Path: A'}
        },
        -- legs = "Kasuga Haidate +3",
        legs = {
            name = "Tatena. Haidate +1",
            augments = {'Path: A'}
        },
        -- feet = "Ken. Sune-Ate +1",
        feet = "Flamma Gambieras +2",
        -- neck = {
        --     name = "Sam. Nodowa +2",
        --     augments = {'Path: A'}
        -- },
        -- neck = {
        --     name = "Vim Torque +1",
        --     augments = {'Path: A'}
        -- },
        neck = "Null Loop",
        -- waist = {
        --     name = "Sailfi Belt +1",
        --     augments = {'Path: A'}
        -- },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Kasuga Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+15', 'Mag. Acc.+15', 'Weapon skill damage +3%'}
        },
        left_ring = "Chirich Ring +1",
        right_ring = "Niqmaddu Ring",
        -- back = {
        --     name = "Smertrios's Mantle",
        --     augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        -- }
        back = "Null Shawl"
    }

    sets.OffenseMode.TP = set_combine(sets.OffenseMode, {})

    -- This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
    sets.OffenseMode.DT = set_combine(sets.OffenseMode, {})

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        hands = "Ken. Tekko +1",
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1"
    })

    sets.OffenseMode.CRIT = set_combine(sets.OffenseMode, {
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        hands = "Ken. Tekko +1",
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1"
    })

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.SB = set_combine(sets.OffenseMode, {
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        legs = {
            name = "Mpaca's Hose",
            augments = {'Path: A'}
        },
        back = "Null Shawl"
    })

    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {});

    sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Kasuga Kabuto +3",
        body = "Kasuga Domaru +3",
        hands = "Ken. Tekko +1",
        legs = "Kasuga Haidate +3",
        feet = "Ken. Sune-Ate +1",
        neck = {
            name = "Sam. Nodowa +2",
            augments = {'Path: A'}
        },
        waist = "Carrier's Sash",
        left_ear = "Telos Earring",
        right_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        left_ring = "Defending Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Smertrios's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    });

    -- Used for Magic Spells (Fast Cast)
    sets.Precast.FastCast = {
        left_ear = "Etiolation Earring",
        right_ear = "Loquac. Earring"
    }

    sets.Enmity = {
        ammo = "Paeapua", -- 2
        left_ear = "Cryptic Earring", -- 4
        right_ear = "Friomisi Earring", -- 2
        left_ring = "Petrov Ring" -- 4
    }

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    -- Specific gear for spells
    sets.Midcast["Stoneskin"] = {
        waist = "Siegel Sash"
    }

    -- Job Abilities
    sets.JA["Meikyo Shisui"] = {}
    sets.JA["Berserk"] = {}
    sets.JA["Warcry"] = {}
    sets.JA["Defender"] = {}
    sets.JA["Aggressor"] = {}
    sets.JA["Provoke"] = sets.Enmity
    sets.JA["Third Eye"] = {}
    sets.JA["Meditate"] = {
        -- head="Wakido Kabuto", -- Aug to +3
        hands = {
            name = "Sakonji Kote +1",
            augments = {'Enhances "Blade Bash" effect'}
        }, -- aug to +3
        back = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.JA["Warding Circle"] = {
        -- head="Wakido Kabuto",
    }
    sets.JA["Shikikoyo"] = {}
    sets.JA["Hasso"] = {}
    sets.JA["Seigan"] = {}
    sets.JA["Sengikori"] = {}
    sets.JA["Hamanoha"] = {}
    sets.JA["Hagakure"] = {}
    sets.JA["Konzen-ittai"] = {}
    sets.JA["Yaegasumi"] = {}

    -- Default Weapon Skill set base
    sets.WS = {
        ammo = "Knobkierrie",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "Sam. Nodowa +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Epaminondas's Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = set_combine(sets.WS, {
        hands = "Ken. Tekko +1"
    })

    sets.WS.AM3 = {}
    sets.WS.AM3['Masamune'] = {}

    sets.WS.MAB = set_combine(sets.WS, {})

    sets.WS.CRIT = set_combine(sets.WS, {
        right_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        }
    })

    sets.WS.MEVA = set_combine(sets.WS, {
        neck = "Warder's Charm +1",
        waist = "Carrier's Sash"
    })

    -- WS Sets
    sets.WS["Tachi: Enpi"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Hobaku"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Jinpu"] = {
        ammo = "Knobkierrie",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Fotia Gorget",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Tachi: Goten"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Kagero"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Koki"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Yukikaze"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Gekko"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Kasha"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Rana"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Ageha"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Fudo"] = set_combine(sets.WS, {})
    sets.WS["Tachi: Shoha"] = set_combine(sets.WS, {})
    sets.WS["Impulse Drive"] = sets.WS.CRIT

    -- Custome sets for each jobsetup
    sets.Seigan = {
        head = "Kasuga Kabuto +3",
        body = "Kasuga Domaru +3"
    }

    sets.ThirdEye = {}

    -- Used to Tag TH on a mob (TH4 is max in gear non-THF)
    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        waist = "Chaac Belt"
    }

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
    local equipSet = {}

    return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
    local equipSet = {}

    return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
    local equipSet = choose_Seigan()
    return equipSet
end
-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    local equipSet = choose_Seigan()
    return equipSet
end
-- This function is called when a update request the correct equipment set
function choose_set_custom()
    local equipSet = choose_Seigan()
    return equipSet
end
-- Function is called when the player changes states
function status_change_custom(new, old)
    local equipSet = choose_Seigan()
    return equipSet
end
-- Function is called when a self command is issued
function self_command_custom(command)

end
-- Custom Function
function choose_Seigan()
    local equipSet = {}
    if player.status == "Engaged" then
        if buffactive.Seigan then
            -- Equip the Seigan custom set when active
            equipSet = sets.Seigan
            if buffactive["Third Eye"] then
                -- Equip the Third Eye custom set when active
                equipSet = set_combine(equipSet, sets.ThirdEye)
            end
        end
    end
    return equipSet
end
-- Function used to automate Job Ability use
function check_buff_JA()
    local buff = 'None'
    local ja_recasts = windower.ffxi.get_ability_recasts()

    if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
        buff = "Hasso"
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
-- Function used to automate Spell use
function check_buff_SP()
    local buff = 'None'
    -- local sp_recasts = windower.ffxi.get_spell_recasts()
    return buff
end
-- This function is called when the job file is unloaded

-- This function is called when the job file is unloaded
function user_file_unload()

end

function pet_change_custom(pet, gain)
    local equipSet = {}

    return equipSet
end

function pet_aftercast_custom(spell)
    local equipSet = {}

    return equipSet
end

function pet_midcast_custom(spell)
    local equipSet = {}

    return equipSet
end

