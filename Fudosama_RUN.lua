-- Mirdain
-- Load and initialize the include file.
include('Fudosama-Include')

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

BlueNuke = S {'Spectral Floe', 'Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S {'Magic Fruit'}
BlueSkill = S {'Occultation', 'Erratic Flutter', 'Nature\'s Meditation', 'Cocoon', 'Barrier Tusk', 'Metallic Body',
               'Mighty Guard'}
BlueTank = S {'Jettatura', 'Geist Wall', 'Blank Gaze', 'Sheep Song', 'Sandspin', 'Healing Breeze'}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('TP', 'ACC', 'DT', 'PDT', 'MEVA', 'PARRY') -- ACC effects WS and TP modes

-- Function used to change pallets based off sub job and modes
function Macro_Sub_Job()
    local macro = 1
    if player.sub_job == "BLU" then
        state.OffenseMode:set('DT')
        -- Set you macro pallet for when you are /BLU
        macro = 1
        send_command('wait 2;aset set tanking')
    else
        state.OffenseMode:set('DT')
        -- Set you macro pallet for when you are NOT /BLU
        macro = 1
    end
    return macro
end

Buff_Delay = 5 -- Used this to slow down auto buffing
Tank_Delay = 5 -- delays between tanking actions (only used when auto-buffing enabled and target locked on)

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "197"
MacroBook = "22"
MacroSet = Macro_Sub_Job()

-- Modes for specific to Paladin.  These are defined below in "Weapons".
state.WeaponMode:options('Epeolatry', 'Lionheart', 'Lycurgos')
state.WeaponMode:set('Epeolatry')

-- Enable JobMode for UI.
UI_Name = 'Runes'
UI_Name2 = 'Auto Tank'

-- Modes for specific to RUN
state.JobMode:options('None', 'Fire', 'Ice', 'Wind', 'Earth', 'Lightning', 'Water', 'Light', 'Dark') -- Modes used to use Rune Enhancement
state.JobMode:set('None')

Runes = {
    Fire = {
        Name = "Ignis",
        Description = "[ICE RESISTANCE] and deals [FIRE DAMAGE]"
    },
    Ice = {
        Name = "Gelus",
        Description = "[WIND RESISTANCE] and deals [ICE DAMAGE]"
    },
    Wind = {
        Name = "Flabra",
        Description = "[EARTH RESISTANCE] and deals [WIND DAMAGE]"
    },
    Earth = {
        Name = "Tellus",
        Description = "[LIGHTNING RESISTANCE] and deals [EARTH DAMAGE]"
    },
    Lightning = {
        Name = "Sulpor",
        Description = "[WATER RESISTANCE] and deals [LIGHTNING DAMAGE]"
    },
    Water = {
        Name = "Unda",
        Description = "[FIRE RESISTANCE] and deals [WATER DAMAGE]"
    },
    Light = {
        Name = "Lux",
        Description = "[DARK RESISTANCE] and deals [LIGHT DAMAGE]"
    },
    Dark = {
        Name = "Tenebrae",
        Description = "[LIGHT RESISTANCE] and deals [DARKNESS DAMAGE]"
    },
    None = {
        Name = 'None',
        Description = "None"
    }
}

jobsetup(LockStylePallet, MacroBook, MacroSet)

-- HP balancing: 3000 HP
-- MP balancing: 950 MP

function get_sets()

    sets.Weapons = {}

    sets.Weapons['Epeolatry'] = {
        main = {
            name = "Epeolatry",
            augments = {'Path: A'}
        },
        sub = {
            name = "Refined Grip +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Lionheart'] = {
        main = "Lionheart",
        sub = "Utu Grip"
    }

    sets.Weapons['Lycurgos'] = {
        main = "Lycurgos",
        sub = "Utu Grip"
    }

    -- Standard Idle set
    sets.Idle = {
        ammo = "Staunch Tathlum +1",
        head = "Null Masque",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        legs = "Erilaz Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = "Warder's Charm +1",
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Idle.PDT = set_combine(sets.Idle, {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Erilaz Surcoat +3",
        hands = "Turms Mittens +1",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Engraved Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.Idle.MEVA = set_combine(sets.Idle, {
        ammo = "Staunch Tathlum +1",
        neck = {
            name = "Warder's Charm +1",
            augments = {'Path: A'}
        },
        head = "Erilaz Galea +3",
        body = "Runeist Coat +3",
        waist = "Plat. Mog. Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'},
            priority = 1
        }, -- 3/5
        right_ear = "Sanare Earring"
    })

    sets.Idle.DT = set_combine(sets.Idle, {
        ammo = "Staunch Tathlum +1",
        head = "Null Masque",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = "Warder's Charm +1",
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.Idle.PARRY = set_combine(sets.Idle, {})

    sets.Idle.PDT = set_combine(sets.Idle, {})

    -- Set is used for midcast during MEVA OffenseMode
    sets.MEVA = {
        ammo = "Staunch Tathlum +1",
        neck = {
            name = "Warder's Charm +1",
            augments = {'Path: A'}
        },
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +3", -- 11/11
        legs = "Eri. Leg Guards +3", -- 13/13
        feet = "Erilaz Greaves +3", -- 11/11
        waist = "Plat. Mog. Belt",
        left_ring = {
            name = "Moonlight Ring",
            bag = "wardrobe1"
        },
        right_ring = {
            name = "Moonlight Ring",
            bag = "wardrobe2"
        },
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        } -- 3/5
    }

    -- This gear will be equiped when the player is moving and not engaged
    sets.Movement = {
        right_ring = "Shneddick Ring"
    }

    -- Set to be used if you get 
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = "Eshmun's Ring",
        right_ring = "Eshmun's Ring",
        waist = "Gishdubar Sash"
    }

    sets.OffenseMode = {
        -- ammo = {
        --     name = "Coiste Bodhar",
        --     augments = {'Path: A'}
        -- },
        -- head = "Erilaz Galea +3",
        -- body = "Ashera Harness",
        -- hands = "Erilaz Gauntlets +3",
        -- legs = "Eri. Leg Guards +3",
        -- feet = "Erilaz Greaves +3",
        -- neck = {
        --     name = "Futhark Torque +2",
        --     augments = {'Path: A'},
        --     priority = 1
        -- },
        -- waist = "Windbuffet Belt +1",
        -- left_ear = "Sherida Earring",
        -- right_ear = "Telos Earring",
        -- left_ring = "Niqmaddu Ring",
        -- right_ring = "Epona's Ring",
        -- back = {
        --     name = "Ogma's Cape",
        --     augments = {'HP+60', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        -- }

        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Erilaz Surcoat +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Engraved Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    }

    -- DPS set for tanking
    sets.OffenseMode.TP = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Anu Torque",
        waist = "Ioskeha Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    } -- No fucks given

    -- Gear to swap in for ACC when TP
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {})

    -- Physical Damage Taken set for tanking
    sets.OffenseMode.PDT = set_combine(sets.OffenseMode, {}) -- Maintains Capped PDT with some DPS mixed in

    -- Magic Evasion set for tanking
    sets.OffenseMode.MEVA = set_combine(sets.Idle.MEVA, {}) -- Focus on Magic Evasion with some DPS mixed in

    -- Standard Tanking TP set
    sets.OffenseMode.DT = set_combine(sets.Idle.DT, {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Erilaz Surcoat +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Engraved Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    })

    sets.OffenseMode.PARRY = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear2 = "Odnowa Earring +1",
        ear1 = "Hermodr Earring",
        body = "Nyame Mail",
        hands = "Turms Mittens +1",
        ring1 = "Defending Ring",
        ring2 = "Moonlight Ring",
        waist = "Plat. Mog. Belt",
        legs = "Eri. Leg Guards +3",
        feet = "Turms Leggings +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    }

    sets.OffenseMode.AoE = set_combine(sets.OffenseMode.PDT, {})

    -- Set used for hate generation on Job abilities
    sets.Enmity = { -- 23 Epo
        ammo = "Aqreqaq Bomblet",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Supershear Ring",
        right_ring = "Eihwaz Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    } -- 99 Enmity 2884 HP / 840 MP

    -- This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
    sets.SIRD = set_combine(sets.Idle.DT, {
        ammo = "Staunch Tathlum +1", -- 11% SIRD
        head = "Erilaz Galae +3", -- 20% SIRD
        body = {
            name = "Taeon Tabard",
            augments = {'Spell interruption rate down -8%'}
        }, -- 8% SIRD
        hands = "Regal Gauntlets", -- 10% SIRD
        legs = {
            name = "Carmine Cuisses +1", -- 20% SIRD
            augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6'}
        },
        feet = "Erilaz Greaves +3",
        neck = "Moonbeam Necklace", -- 10% SIRD
        waist = "Audumbla Sash", -- 10% SIRD
        left_ear = "Halasz Earring", --
        right_ear = "Tuisto Earring", -- magnetic earring would go here
        left_ring = "Evanescence Ring", -- 5% SIRD
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'HP+20', '"Fast Cast"+10', 'Spell interruption rate down-10%'} -- 10% SIRD
        }
    }) -- 104% SIRD -- need magnetic earring

    sets.Precast = {}
    -- Used for Magic Spells

    sets.Precast.FastCast = {
        ammo = "Sapience Orb",
        head = "Runeist's Bandeau +2",
        body = "Erilaz Surcoat +3",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = "Aya. Cosciales +2",
        feet = {
            name = "Carmine Greaves",
            augments = {'MP+60', 'INT+10', 'MND+10'}
        },
        neck = "Orunmila's Torque", -- voltsurge torque for 4% fast cast
        waist = "Plat. Mog. Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Loquac. Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'HP+20', '"Fast Cast"+10', 'Spell interruption rate down-10%'}
        }
    }

    sets.Precast.FastCast.Enhancing = set_combine(sets.Precast.FastCast, {
        legs = {
            name = "Futhark Trousers +3",
            augments = {'Enhances "Inspire" effect'}
        }, -- 7  (15 - 8) 
        waist = "Siegel Sash" -- 8
    }) -- 80+ FC

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, sets.Enmity, sets.SIRD, {})

    -- Enhancing Skill
    sets.Midcast.Enhancing = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        body = "Runeist Coat +3",
        hands = {
            name = "Regal Gauntlets"
        },
        legs = {
            name = "Futhark Trousers +2",
            augments = {'Enhances "Inspire" effect'}
        },
        feet = "Erilaz Greaves +3",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Tuisto Earring",
        right_ear = "Mimir Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }
    -- High MACC for landing spells
    sets.Midcast.Enfeebling = {}

    -- Specific gear for spells
    sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
        waist = "Siegel Sash"
    })

    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, sets.SIRD, {
        body = "Runeist Coat +3",
        head = "Erilaz Galea +3",
        hands = "Regal Gauntlets",
        neck = "Sacro Gorget",
        legs = "Futhark Trousers +2"
    })

    sets.Midcast["Phalanx"] = set_combine(sets.Midcast.Enhancing, {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Fu. Bandeau +3",
            augments = {'Enhances "Battuta" effect'}
        },
        body = {
            name = "Herculean Vest",
            augments = {'MND+2', 'CHR+6', 'Phalanx +1', 'Accuracy+11 Attack+11'}
        },
        -- hands = "Runeist Mitons +2",
        legs = {
            name = "Herculean Trousers",
            augments = {'"Snapshot"+5', 'Pet: DEX+9', 'Phalanx +2', 'Accuracy+6 Attack+6',
                        'Mag. Acc.+3 "Mag.Atk.Bns."+3'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Magic dmg. taken -3%', 'Attack+12', 'Phalanx +4', 'Mag. Acc.+17 "Mag.Atk.Bns."+17'}
        },
        neck = "Incanter's Torque",
        waist = "Plat. Mog. Belt",
        left_ear = "Mimir Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.Midcast.Cure = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Erilaz Gauntlets +3",
        legs = "Erilaz Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = "Sacro Gorget", -- 10
        ear1 = "Tuisto Earring", -- 4
        ear2 = "Mendi. Earring", -- 5
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring", -- 5
        waist = "Sroda Belt",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Midcast.Regen = {
        head = "Rune. Bandeau +1",
        hands = "Regal Gauntlets",
        legs = "Futhark Trousers +2",
        neck = "Sacro Gorget",
        waist = "Sroda Belt",
        left_ear = "Mimir Earring",
        right_ear = {
            name = "Erilaz Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+13', 'Mag. Acc.+13', 'Damage taken-4%'}
        }
    }

    sets.Midcast["Regen IV"] = set_combine(sets.Midcast.Enhancing, sets.Midcast.Regen)

    sets.Midcast["Flash"] = set_combine(sets.Enmity, {})
    sets.Midcast["Foil"] = set_combine(sets.Enmity, {})
    sets.Midcast["Stun"] = set_combine(sets.Enmity, {})
    sets.Midcast["Jettatura"] = set_combine(sets.Enmity, {})
    sets.Midcast["Geist Wall"] = set_combine(sets.Enmity, {})
    sets.Midcast["Sheep Song"] = set_combine(sets.Enmity, {})
    sets.Midcast["Blank Gaze"] = set_combine(sets.Enmity, {})

    sets.Midcast["Healing Breeze"] = set_combine(sets.Cure, {})
    sets.Midcast["Magic Fruit"] = set_combine(sets.Cure, {})
    sets.Midcast["Pollen"] = set_combine(sets.Cure, {})
    sets.Midcast["Wild Carrot"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Cure"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Cure II"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Cure III"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Cure IV"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Curaga"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Curaga II"] = set_combine(sets.Cure, {})
    -- sets.Midcast["Curaga III"] = set_combine(sets.Cure, {})

    sets.Midcast["Cursna"] = set_combine(sets.Cursna_Received, {})

    -- JOB ABILITIES --
    sets.JA = {}
    sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity, {
        body = "Futhark Coat +3"
    })
    sets.JA["Gambit"] = set_combine(sets.Enmity, {
        hands = "Runeist Mitons +2"
    })
    sets.JA["Rayke"] = set_combine(sets.Enmity, {
        feet = "Futhark Boots +1"
    })
    sets.JA["Liement"] = set_combine(sets.Enmity, {
        body = "Futhark Coat +3"
    })
    sets.JA["One For All"] = sets.Idle
    sets.JA["Valiance"] = set_combine(sets.Enmity, {
        body = "Runeist Coat +3",
        legs = "Futhark Trousers +2"
    })
    sets.JA["Vallation"] = set_combine(sets.Enmity, {
        body = "Runeist Coat +3",
        legs = "Futhark Trousers +2"
    })
    sets.JA["Pflug"] = set_combine(sets.Enmity, {
        feet = "Runeist Bottes +1"
    })
    sets.JA["Battuta"] = set_combine(sets.Enmity, {
        head = "Futhark Bandeau +3"
    })
    sets.JA["Vivacious Pulse"] = set_combine(sets.Precast.Divine, {
        ammo = "Sapience Orb",
        head = "Erilaz Galea +3",
        legs = "Rune. Trousers +1",
        neck = "Incanter's Torque",
        ear2 = "Saxnot Earring",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        back = "Altruistic Cape",
        waist = "Plat. Mog. Belt"
    })
    sets.JA["Embolden"] = set_combine(sets.Enmity, {
        back = {
            name = "Evasionist's Cape",
            augments = {'Enmity+3', '"Embolden"+15'}
        }
    })
    sets.JA["Swordplay"] = set_combine(sets.Enmity, {
        hands = "Futhark Mitons +1"
    })
    sets.JA["Provoke"] = sets.Enmity

    sets.Embolden = {
        back = {
            name = "Evasionist's Cape",
            augments = {'Enmity+3', '"Embolden"+15'}
        }
    }

    -- Default WS set base
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
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = {}
    sets.WS.WSD = {}
    sets.WS.CRIT = {}

    -- Great Sword WS
    sets.WS["Hard Slash"] = {}
    sets.WS["Frostbite"] = {}
    sets.WS["Freezebite"] = {}

    sets.WS["Shockwave"] = {
        ammo = {
            name = "Seeth. Bomblet +1",
            augments = {'Path: A'}
        },
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
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Hermetic Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10'}
        }
    }

    sets.WS["Crescent Moon"] = {}
    sets.WS["Sickle Moon"] = {}
    sets.WS["Spinning Slash"] = {}
    sets.WS["Herculean Slash"] = {}

    sets.WS["Resolution"] = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
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
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Sroda Ring",
        right_ring = "Niqmaddu Ring",
        back = { -- need STR/DA cape
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Dimidiation"] = {
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
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Odr Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = { -- need more DEX+10
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%'}
        }
    }

    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        legs = {
            name = "Herculean Trousers",
            augments = {'CHR+3', '"Mag.Atk.Bns."+10', '"Treasure Hunter"+2'}
        },
        waist = "Chaac Belt"
    }

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

buff_time = os.clock()
tank_time = os.clock()

JA_Delay = os.clock()

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
    equipSet = set_combine(equipSet, Embolden_Check(spell))

    if state.OffenseMode.value == 'MEVA' then
        equipSet = set_combine(equipSet, sets.MEVA)
    end

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

    if player.status == "Engaged" then
        if buffactive['Battuta'] then
            equipSet = sets.OffenseMode.PARRY
        end
    end

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

-- Function used to automate Job Ability use - Checked first
function check_buff_JA()
    buff = 'None'
    if os.clock() - buff_time > Buff_Delay then
        local ja_recasts = windower.ffxi.get_ability_recasts()
        local delay = os.clock() - JA_Delay

        if player.sub_job == 'SAM' then
            if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
                buff = "Hasso"
            end
        end

        if player.sub_job == 'WAR' then
            if not buffactive['Berserk'] and ja_recasts[1] == 0 then
                buff = "Berserk"
            elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
                buff = "Aggressor"
            elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
                buff = "Warcry"
            end
        end

        if buffactive[Runes[state.JobMode.value].Name] == 3 and windower.ffxi.get_player().target_locked then
            if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and
                ja_recasts[23] == 0 and delay > 3 then
                buff = "Vallation" -- Next Single Target DT and FC
            end
            if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and
                ja_recasts[113] == 0 then
                buff = "Valiance" -- AoE DT and FC
                JA_Delay = os.clock() -- Need to give Valiance a chance to register before Vallation is used
            end
        end

        -- Rune sets
        if Runes[state.JobMode.value].Name ~= "None" then
            if ja_recasts[92] == 0 and buffactive[Runes[state.JobMode.value].Name] ~= 3 then
                buff = Runes[state.JobMode.value].Name
                info(Runes[state.JobMode.value].Description)
            end

        end

        if buff ~= 'None' then
            buff_time = os.clock()
        end
    end
    return buff
end

-- Function used to automate Spell use
function check_buff_SP()
    buff = 'None'
    if os.clock() - buff_time > Buff_Delay then
        local sp_recasts = windower.ffxi.get_spell_recasts()

        if not buffactive['Enmity Boost'] and sp_recasts[476] == 0 and player.mp > 100 then
            buff = "Crusade"
        elseif not buffactive['Phalanx'] and sp_recasts[106] == 0 and player.mp > 100 then
            buff = "Phalanx"
        elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 100 then
            buff = "Aquaveil"
        elseif not buffactive['Multi Strikes'] and sp_recasts[493] == 0 and player.mp > 36 then
            buff = "Temper"
        elseif not buffactive['Ice Spikes'] and sp_recasts[250] == 0 and player.mp > 16 then
            buff = "Ice Spikes"
        end

        if player.sub_job == "BLU" and player.sub_job_level > 8 then
            if not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 then
                buff = "Cocoon"
            end
        end

        if buff ~= 'None' then
            buff_time = os.clock()
        else
            buff = check_tank()
        end
    end
    return buff
end

function check_tank()
    buff = 'None'
    if os.clock() - tank_time > Tank_Delay then
        log('tank check')
        if (player.status == "Engaged" or windower.ffxi.get_player().target_locked) and state.JobMode2.value == "ON" then
            local sp_recasts = windower.ffxi.get_spell_recasts()
            if sp_recasts[112] == 0 and player.mp > 25 then
                buff = "Flash"
            end
            if sp_recasts[840] == 0 and player.mp > 48 then
                buff = "Foil"
            end
        end
    end

    if buff ~= 'None' then
        tank_time = os.clock()
    end
    return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end

-- Swaps back when embolden buff is active to extend duration
function Embolden_Check(spell)
    equipSet = {}
    if spell.target.name == player.name then
        if buffactive['Embolden'] then
            equipSet = sets.Embolden
            info('Embolden Set')
        end
    end
    return equipSet
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
