-- Salidar
-- Load and initialize the include file.
include('Fudosama-Include')

-- Uses Items Automatically
AutoItem = false

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = true

-- Lockstyle sets to randomly equip
Lockstyle_List = {116, 118, 119}

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "116"
MacroBook = "20" -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 50

-- Add CRIT the base modes to allow AM3 Critical Builds
state.OffenseMode:options('TP', 'ACC', 'DT', 'PDL', 'CRIT', 'SB', 'True Shot')
state.OffenseMode:set('TP')

-- Modes for specific to Ranger
state.WeaponMode:options('Gastraphetes', 'Fomalhaut', 'Annihilator', 'Armageddon', 'Arma-MagicATT', 'Gandiva',
    'Fail-Not', 'Naegling', 'Tauret')
state.WeaponMode:set('Gastraphetes')

-- Enable JobMode for UI.
UI_Name = 'TP Mode'

-- Melee or Ranged Mode
state.JobMode:options('Standard', 'Melee', 'Ranged')
state.JobMode:set('Standard')

-- Set the ammo type for each WeaponMode (above): Bullet, Arrow, Bolt
-- This allows for generic gear sets such as ammo=Ammo.RA for Midcast.RA as an example.
Ranged_Weapons = {{
    WeaponMode = "Naegling",
    Type = "Arrow"
}, {
    WeaponMode = "Fomalhaut",
    Type = "Bullet"
}, {
    WeaponMode = "Annihilator",
    Type = "Bullet"
}, {
    WeaponMode = "Fail-Not",
    Type = "Arrow"
}, {
    WeaponMode = "Gastraphetes",
    Type = "Bolt"
}, {
    WeaponMode = "Tauret",
    Type = "Arrow"
}, {
    WeaponMode = "Gandiva",
    Type = "Arrow"
}, {
    WeaponMode = "Armageddon",
    Type = "Bullet"
}}

-- Used to determine if Obi is used or Orpheus Sash - if either is not present it will not change the waist slot
Elemental_WS = S {'Aeolian Edge', 'Flaming Arrow', 'Wildfire', 'Trueflight', 'Hot Shot'}

-- Initialize Player
jobsetup(LockStylePallet, MacroBook, MacroSet)

-- Goal is 2000 HP
function get_sets()
    -- Weapon setup
    sets.Weapons = {}

    sets.Weapons['Naegling'] = {
        main = "Naegling",
        sub = {
            name = "Gleti's Knife",
            augments = {'Path: A'}
        },
        range = {
            name = "Accipiter",
            augments = {'TP Bonus +1000'}
        }
    }

    sets.Weapons['Fomalhaut'] = {
        main = {
            name = "Perun +1",
            augments = {'Path: A'}
        },
        sub = {
            name = "Kustawi +1",
            augments = {'Path: A'}
        },
        range = {
            name = "Fomalhaut",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Annihilator'] = {
        main = {
            name = "Perun +1",
            augments = {'Path: A'}
        },
        sub = {
            name = "Kustawi +1",
            augments = {'Path: A'}
        },
        range = {
            name = "Annihilator",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Gastraphetes'] = {
        main = {
            name = "Malevolence",
            augments = {'INT+10', 'Mag. Acc.+10', '"Mag.Atk.Bns."+10', '"Fast Cast"+5'}
        },
        sub = {
            name = "Malevolence",
            augments = {'INT+6', 'Mag. Acc.+7', '"Mag.Atk.Bns."+4', '"Fast Cast"+3'}
        },
        range = {
            name = "Gastraphetes",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Armageddon'] = {
        main = {
            name = "Perun +1",
            augments = {'Path: A'}
        },
        sub = {
            name = "Kustawi +1",
            augments = {'Path: A'}
        },
        range = "Armageddon"
    }

    sets.Weapons['Arma-MagicATT'] = {
        main = {
            name = "Malevolence",
            augments = {'INT+10', 'Mag. Acc.+10', '"Mag.Atk.Bns."+10', '"Fast Cast"+5'}
        },
        sub = {
            name = "Malevolence",
            augments = {'INT+6', 'Mag. Acc.+7', '"Mag.Atk.Bns."+4', '"Fast Cast"+3'}
        },
        range = "Armageddon"
    }

    sets.Weapons['Gandiva'] = {
        main = {
            name = "Perun +1",
            augments = {'Path: A'}
        },
        sub = {
            name = "Kustawi +1",
            augments = {'Path: A'}
        },
        range = "Gandiva"
    }

    sets.Weapons['Fail-Not'] = {
        main = {
            name = "Malevolence",
            augments = {'INT+10', 'Mag. Acc.+10', '"Mag.Atk.Bns."+10', '"Fast Cast"+5'}
        },
        sub = {
            name = "Malevolence",
            augments = {'INT+6', 'Mag. Acc.+7', '"Mag.Atk.Bns."+4', '"Fast Cast"+3'}
        },
        range = "Fail-Not"
    }

    sets.Weapons['Tauret'] = {
        main = "Tauret",
        sub = {
            name = "Malevolence",
            augments = {'INT+10', 'Mag. Acc.+10', '"Mag.Atk.Bns."+10', '"Fast Cast"+5'}
        },
        range = {
            name = "Accipiter",
            augments = {'TP Bonus +1000'}
        }
    }

    sets.Weapons.Melee = {
        main = "Gleti's Knife",
        sub = "Ternion Dagger +1"
    }

    sets.Weapons.Ranged = {
        main = {
            name = "Perun +1",
            augments = {'Path: A'}
        },
        sub = {
            name = "Kustawi +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons.Shield = {
        sub = "Nusku Shield"
    }

    -- Ammo Selection - will choose based off equiped weapon
    Ammo.Bullet.RA = "Chrono Bullet" -- TP Ammo
    Ammo.Bullet.ACC = "Chrono Bullet" -- Accuracy Ammo
    Ammo.Bullet.CRIT = "Chrono Bullet" -- Critical Hit Mode Ammo
    Ammo.Bullet.WS = "Chrono Bullet" -- Physical Weaponskills (consumed)
    Ammo.Bullet.WSD = "Chrono Bullet" -- Physical Weaponskills (not consumed)
    Ammo.Bullet.MAB = "Chrono Bullet" -- Magical Weaponskills
    Ammo.Bullet.MACC = "Chrono Bullet" -- Magic Accuracy
    Ammo.Bullet.MAG_WS = "Chrono Bullet" -- Magic Weaponskills (Not Consumed)
    Ammo.Bullet.PHY_WS = "Chrono Bullet" -- Magic Weaponskills (Not Consumed)

    Ammo.Arrow.RA = "Chrono Arrow" -- TP Ammo
    Ammo.Arrow.ACC = "Chrono Arrow" -- Accuracy Ammo
    Ammo.Arrow.CRIT = "Chrono Arrow" -- Critical Hit Mode Ammo
    Ammo.Arrow.WS = "Chrono Arrow" -- Physical Weaponskills (consumed)
    Ammo.Arrow.WSD = "Hauksbok Arrow" -- Physical Weaponskills (not consumed)
    Ammo.Arrow.MAB = "Chrono Arrow" -- Magical Weaponskills
    Ammo.Arrow.MACC = "Chrono Arrow" -- Magic Accuracy
    Ammo.Arrow.MAG_WS = "Chrono Arrow" -- Magic Weaponskills (Not consumed)
    Ammo.Arrow.PHY_WS = "Chrono Arrow" -- Magic Weaponskills (Not Consumed)

    Ammo.Bolt.RA = "Quelling Bolt" -- TP Ammo
    Ammo.Bolt.ACC = "Quelling Bolt" -- Accuracy Ammo
    Ammo.Bolt.CRIT = "Quelling Bolt" -- Critical Hit Mode Ammo
    Ammo.Bolt.WS = "Quelling Bolt" -- Physical Weaponskills (consumed)
    Ammo.Bolt.WSD = "Quelling Bolt" -- Physical Weaponskills (not consumed)
    Ammo.Bolt.MAB = "Quelling Bolt" -- Magical Weaponskills
    Ammo.Bolt.MACC = "Quelling Bolt" -- Magic Accuracy
    Ammo.Bolt.MAG_WS = "Quelling Bolt" -- Magic  (Not consumed)
    Ammo.Bolt.PHY_WS = "Quelling Bolt" -- Magic Weaponskills (Not Consumed)

    -- Modes to select correct ammo based off weapon type
    Ammo.RA = Ammo[state.RAMode.value].RA
    Ammo.ACC = Ammo[state.RAMode.value].ACC
    Ammo.CRIT = Ammo[state.RAMode.value].CRIT
    Ammo.WS = Ammo[state.RAMode.value].WS
    Ammo.WSD = Ammo[state.RAMode.value].WSD
    Ammo.MAB = Ammo[state.RAMode.value].MAB
    Ammo.MACC = Ammo[state.RAMode.value].MACC
    Ammo.MAG_WS = Ammo[state.RAMode.value].MAG_WS
    Ammo.PHY_WS = Ammo[state.RAMode.value].PHY_WS

    -- Standard Idle set with -DT,Refresh,Regen with NO movement gear
    sets.Idle = {
        ammo = Ammo.RA, -- Smart_Ammo() will select from your XXXX.RA type
        head = "Null Masque",
        body = "Adamantite Armor",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Rep. Plat. Medal",
        waist = "Null Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Infused Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Murky Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Idle.TP = set_combine(sets.Idle, {
        ammo = Ammo.RA, -- Smart_Ammo() will select from your XXXX.RA type
        head = "Null Masque",
        body = "Adamantite Armor",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Rep. Plat. Medal",
        waist = "Null Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Infused Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Murky Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.Movement = {
        right_ring = "Shneddick Ring"
    }

    -- Set to be used if you get cursna casted on you
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = "Ephedra Ring",
        right_ring = "Ephedra Ring",
        waist = "Gishdubar Sash"
    }

    -- Base TP set to build off when melee'n
    sets.OffenseMode = {
        ammo = Ammo.RA
    }

    -- Set focuses on maximum TP gain
    sets.OffenseMode.TP = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        },
        feet = "Malignance Boots",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Murky Ring",
        back = { -- look into dual wield cape
            name = "Belenus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    -- This set is used when OffenseMode is set to DT and enaged
    sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Amini Glove. +3",
        legs = "Amini Bragues +3",
        feet = "Malignance Boots",
        back = { -- look into dual wield cape
            name = "Belenus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    })

    -- This set is used when OffenseMode is set to PDL and engaged
    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {})

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode.DT, {})

    -- This set is used when OffenseMode is CRIT and Engaged
    sets.OffenseMode.CRIT = set_combine(sets.OffenseMode[state.JobMode.value], {})

    -- Set is used for when you are engaged and in ranged mode (not actually hitting an enemy)
    sets.OffenseMode.Ranged = set_combine(sets.Idle, {})

    -- Set is used for when you are engaged and in ranged mode (not actually hitting an enemy)
    sets.OffenseMode['True Shot'] = set_combine(sets.Idle, {})

    -- The following sets augment the OffenseMode set above for Dual Wielding
    sets.DualWield = {
        back = {
            name = "Belenus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Damage taken-5%'}
        }
    }

    sets.Precast = {
        ammo = Ammo.RA
    }
    -- 70 snapshot is Cap
    -- Velocity Shot is seperate term - JA of Ranger
    -- Rapid shot is like quick magic
    -- Snapshot is like Fast Cast

    -- True Shot Ranges (Increases RA and WS and)
    -- Distances listed below are effected by Monster Size
    -- Gun ~6.5 yalms
    -- Short Bow ~8.6 yalms
    -- Crossbow ~10.7 yalms
    -- Long Bow ~ 11.8 yalms

    -- Flurry is 15% Snapshot
    -- Flurry II 30% Snapshot

    -- Rapid Shot is a Job Trait of Ranger - 30%

    -- No flurry - 60 Snapshot needed (Assuming 10% from Merits)
    -- Snapshot / Rapidshot
    sets.Precast.RA = set_combine(sets.Precast, { -- 5 Snapshot on Perun +1 Augment if used
        ammo = Ammo.RA,
        head = {
            name = "Taeon Chapeau",
            augments = {'"Snapshot"+5', '"Snapshot"+5'}
        },
        body = "Amini Caban +3", -- 11% Velocity Shot
        hands = {
            name = "Carmine Fin. Ga. +1",
            augments = {'Rng.Atk.+20', '"Mag.Atk.Bns."+12', '"Store TP"+6'}
        }, -- 8 / 11
        legs = "Orion Braccae +3", -- 15
        feet = "Meg. Jam. +2", -- 10
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        }, -- 4
        waist = "Yemaya Belt", -- 0 / 5
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Tuisto Earring"
        },
        right = "Chirich Ring +1",
        left_ring = "Crepuscular Ring", -- 3
        back = {
            name = "Belenus's Cape",
            augments = {'"Snapshot"+10'}
        } -- 10 with 2% Velocity Shot
    }) -- 60 Snapshot / 29 Rapidshot / 11% Velocity Shot

    -- Only the bullet needs to be set for ACC sets (so that it will match the sets.Midcast.RA.ACC)
    sets.Precast.RA.ACC = set_combine(sets.Precast.RA, {
        ammo = Ammo.ACC
    })

    -- Flurry - 45 Snapshot Needed
    sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
        head = "Orion Beret +3",
        legs = {
            name = "Adhemar Kecks +1",
            augments = {'AGI+12', '"Rapid Shot"+13', 'Enmity-6'}
        } -- 10/13
    }) -- 45 Snapshot / 60 Rapidshot / 11% Velocity Shot

    -- Flurry II - 30 Snapshot Needed
    sets.Precast.RA.Flurry_II = set_combine(sets.Precast.RA.Flurry, {
        feet = {
            name = "Arcadian Socks +3",
            augments = {'Enhances "Stealth Shot" effect'}
        }
    }) -- 35 Snapshot / 70 Rapidshot / 11% Velocity Shot

    -- Fast Cast for magic such as Utsusemi
    sets.Precast.FastCast = {
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
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        }, -- 7 Need to Upgrade
        legs = {
            name = "Herculean Trousers",
            augments = {'Mag. Acc.+7', '"Fast Cast"+6'}
        }, -- 6
        feet = {
            name = "Carmine Greaves +1",
            augments = {'HP+80', 'MP+80', 'Phys. dmg. taken -4'}
        }, -- 8
        neck = "Voltsurge Torque", -- 8
        waist = "Siegel Sash", -- 8 (Enhancing Magic only - Utsusemi)
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Etiolation Earring", -- 1
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Lebeche Ring", -- 2 Quick Magic
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', '"Store TP"+10', 'Damage taken-5%'}
        } -- Need to upgrade Cape with 10% FC
    } -- 77 FC for Utsusemi (80 is cap)

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {
        ammo = Ammo.RA
    })

    -- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = set_combine(sets.Midcast, {
        head = "Arcadian Beret +3",
        body = "Ikenga's Vest",
        hands = "Amini Glove. +3",
        legs = "Amini Bragues +3",
        feet = "Ikenga's Clogs",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Yemaya Belt",
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Crepuscular Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }) -- With Recycle Merits 101 Recycle for TP bonus and Ammo Save

    -- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
        ammo = Ammo.ACC,
        right_ear = "Crep. Earring",
        left_ring = "Cacoethic Ring +1",
        right_ring = "Crepuscular Ring",
        waist = "K. Kachina Belt +1"
    })

    -- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {})

    -- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {
        ammo = Ammo.CRIT,
        head = "Meghanada Visor +2",
        body = "Nisroch Jerkin", -- 10%
        hands = "Mummu Wrists +2", -- 6%
        legs = "Amini Bragues +3", -- 6%
        feet = "Osh. Leggings +1", -- 10%
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "K. Kachina Belt +1", -- 5%
        left_ear = "Odr Earring", -- 5%   
        right_ear = "Telos Earring",
        left_ring = "Begrudging Ring", -- 5%
        right_ring = "Mummu Ring", -- 3%
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        } -- 10%
    })

    sets.Midcast.RA['True Shot'] = set_combine(sets.Midcast.RA.CRIT, {
        body = "Nisroch Jerkin", -- 10
        legs = "Amini Bragues +3", -- 8
        feet = {
            name = "Ikenga's Clogs",
            augments = {'Path: A'}
        }, -- 10
        waist = {
            name = "Tellen Belt",
            augments = {'Path: A'}
        } -- 5
    })

    -- Ranged Attack Gear (Double Shot Midshot)
    sets.Midcast.RA.DoubleShot = {
        head = "Oshosi Mask", -- 5
        body = "Arcadian Jerkin +3",
        hands = "Oshosi Gloves", -- 5
        legs = "Oshosi Trousers", -- 7
        feet = "Osh. Leggings +1",
        -- neck = {
        --     name = "Scout's Gorget +2",
        --     augments = {'Path: A'}
        -- },
        neck = "Iskur Gorget",
        -- waist = "K. Kachina Belt +1",
        waist = "Yemaya Belt",
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Midcast.RA.CRIT.DoubleShot = {
        -- head = "Arcadian Beret +3",
        -- body = "Arcadian Jerkin +3",
        -- hands = "Oshosi Gloves", -- 5
        -- legs = "Oshosi Trousers", -- 7
        -- feet = "Osh. Leggings +1",
        -- neck = {
        --     name = "Scout's Gorget +2",
        --     augments = {'Path: A'}
        -- },
        -- waist = "K. Kachina Belt +1",
        -- left_ear = "Odr Earring",
        -- right_ear = "Telos Earring",
        -- left_ring = "Begrudging Ring",
        -- right_ring = "Mummu Ring",
        -- back = {
        --     name = "Belenus's Cape",
        --     augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        -- }
        head = "Meghanada Visor +2",
        body = "Nisroch Jerkin", -- 10%
        hands = "Mummu Wrists +2", -- 6%
        legs = "Amini Bragues +3", -- 6%
        feet = "Osh. Leggings +1",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "K. Kachina Belt +1", -- 5%
        left_ear = "Odr Earring", -- 5%   
        right_ear = "Telos Earring",
        left_ring = "Begrudging Ring", -- 5%
        right_ring = "Mummu Ring", -- 3%
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        } -- 10%
    }

    -- Ranged Attack Gear (Barrage active)
    sets.Midcast.RA.Barrage = {
        head = {
            name = "Arcadian Beret +3",
            augments = {'Enhances "Recycle" effect'}
        }, -- 10%
        body = "Nisroch Jerkin", -- 10%
        hands = "Orion Bracers +2",
        legs = "Amini Bragues +3", -- 6%
        feet = "Osh. Leggings +1",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "K. Kachina Belt +1", -- 5%
        left_ear = "Odr Earring", -- 5%   
        right_ear = "Telos Earring",
        left_ring = "Begrudging Ring", -- 5%
        right_ring = "Mummu Ring", -- 3%
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        } -- 10%
    }

    -- Job Abilities
    sets.JA = {}
    sets.JA["Eagle Eye Shot"] = {
        legs = {
            name = "Arc. Braccae +3",
            augments = {'Enhances "Eagle Eye Shot" effect'}
        }
    }
    sets.JA["Scavenge"] = {
        feet = "Orion Socks +3"
    }
    sets.JA["Shadowbind"] = {
        hands = "Orion Bracers +2"
    }
    sets.JA["Camouflage"] = {
        body = "Orion Jerkin +2"
    }
    sets.JA["Sharpshot"] = {
        legs = "Orion Braccae +3"
    }
    sets.JA["Barrage"] = {} -- Midcast.RA.Barrage set
    sets.JA["Unlimited Shot"] = {}
    sets.JA["Velocity Shot"] = {
        body = "Amini Caban +3"
    }
    sets.JA["Double Shot"] = {} -- Midcast.RA.Double Shot set
    sets.JA["Bounty Shot"] = {
        ammo = Ammo.RA,
        hands = "Amini Glove. +3"
    } -- Upgrade to TH4
    sets.JA["Decoy Shot"] = {}
    sets.JA["Overkill"] = {}
    sets.JA["Hover Shot"] = {}

    -- Dancer JA Section

    sets.Flourish = set_combine(sets.Idle.DT, {})

    sets.Jig = set_combine(sets.Idle.DT, {})

    sets.Step = set_combine(sets.OffenseMode.DT, {})

    sets.Samba = set_combine(sets.Idle.DT, {})

    sets.Waltz = set_combine(sets.OffenseMode.DT, {
        hands = "Slither Gloves +1", -- 5
        legs = "Dashing Subligar" -- 10
    }) -- 15% Potency

    sets.PhantomRoll = {}

    -- Base Weapon Skill set
    sets.WS = {
        ammo = Ammo.WS,
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        } -- Add Melee Cape
    }

    -- Weapon Skill Damage
    sets.WS.RA = set_combine(sets.WS, {
        ammo = Ammo.WSD,
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Nyame Flanchard",
        feet = "Amini Bottillons +2", -- Upgrade
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Telos Earring",
        left_ring = "Dingir Ring",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Subtle Blow set used in OffenseMode.SB
    sets.WS.SB = set_combine(sets.WS, {})
    sets.WS.SB.RA = set_combine(sets.WS.RA, {})

    -- Physical Damage Limit set used in OffenseMode.PDL
    sets.WS.PDL = set_combine(sets.WS, {})
    sets.WS.PDL.RA = set_combine(sets.WS.RA, {
        head = {
            name = "Ikenga's Hat",
            augments = {'Path: A'}
        },
        body = "Amini Caban +3",
        hands = {
            name = "Ikenga's Gloves",
            augments = {'Path: A'}
        },
        legs = {
            name = "Ikenga's Trousers",
            augments = {'Path: A'}
        },
        feet = {
            name = "Ikenga's Clogs",
            augments = {'Path: A'}
        },
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Telos Earring",
        left_ring = "Sroda Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Accuracy set used in OffenseMode.ACC
    sets.WS.ACC = set_combine(sets.WS, {})
    sets.WS.ACC.RA = set_combine(sets.WS.RA, {
        ammo = Ammo.ACC -- Smart_Ammo() will select from your XXXX.RA type
    })

    -- Critical Hit set used in OffenseMode.SB
    sets.WS.CRIT = {}
    sets.WS.CRIT.RA = {Ammo.CRIT -- Smart_Ammo() will select from your XXXX.RA type
    }

    -- Weapon Skill Damage (Melee)
    sets.WS.WSD = set_combine(sets.WS, {
        ammo = Ammo.WSD,
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
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Magic Attack Bonus
    sets.WS.MAB = set_combine(sets.WS, {
        ammo = Ammo.MAB,
        waist = "Eschan Stone", -- Orpheus/Obi Swap
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ring = "Dingir Ring"
    })

    -- Gun Weaponskills
    sets.WS["Hot Shot"] = set_combine(sets.WS.MAB, {
        ammo = Ammo.MAB,
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
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR/WSD/MAB cape (Belenus's Cape)
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS.PDL["Hot Shot"] = set_combine(sets.WS.MAB, {
        ammo = Ammo.MAB,
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
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS["Split Shot"] = set_combine(sets.WS.RA, {})
    sets.WS["Sniper Shot"] = set_combine(sets.WS.RA, {})
    sets.WS["Blast Shot"] = set_combine(sets.WS.RA, {})
    sets.WS["Heavy Shot"] = set_combine(sets.WS.RA, {})
    sets.WS["Detonator"] = set_combine(sets.WS.RA, {})
    sets.WS["Numbing Shot"] = set_combine(sets.WS.RA, {})

    sets.WS["Wildfire"] = set_combine(sets.WS.MAB, {
        ammo = Ammo.MAB,
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
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Orpheus's Sash",
        left_ear = "Crematio Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS["Last Stand"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Regal Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS.PDL["Last Stand"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornerlia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS["Coronach"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +2", -- Upgrade
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Sherida Earring",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS.PDL["Coronach"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +2", -- Upgrade
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS["Slug Shot"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +2", -- Upgrade
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Telos Earring",
        left_ring = "Regal Ring",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Archery Weaponskills
    sets.WS["Flaming Arrow"] = set_combine(sets.WS.MAB, {
        ammo = Ammo.MAB,
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
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS.PDL["Flaming Arrow"] = set_combine(sets.WS.MAB, {
        ammo = Ammo.MAB,
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
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS["Piercing Arrow"] = set_combine(sets.WS.RA, {})
    sets.WS["Dulling Arrow"] = set_combine(sets.WS.RA, {})
    sets.WS["Sidewinder"] = set_combine(sets.WS.RA, {})
    sets.WS["Blast Arrow"] = set_combine(sets.WS.RA, {})
    sets.WS["Arching Arrow"] = set_combine(sets.WS.RA, {})
    sets.WS["Refulgent Arrow"] = set_combine(sets.WS.RA, {})

    sets.WS["Jishnu's Radiance"] = set_combine(sets.WS.RA, {
        ammo = Ammo.CRIT,
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = "Amini Glove. +3",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Odr Earring",
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Regal Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'DEX+20', 'Rng.Acc.+20 Rng.Atk.+20', 'DEX+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        }
    })

    sets.WS.PDL["Jishnu's Radiance"] = set_combine(sets.WS.RA, {
        ammo = Ammo.CRIT,
        head = {
            name = "Blistering Sallet +1",
            augments = {'Path: A'}
        },
        body = "Amini Caban +3",
        hands = "Malignance Gloves",
        legs = "Ikenga's Trousers",
        feet = "Amini Bottillons +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Odr Earring",
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'DEX+20', 'Rng.Acc.+20 Rng.Atk.+20', 'DEX+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        }
    })

    sets.WS["Namas Arrow"] = {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Sherida Earring",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS.PDL["Namas Arrow"] = {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +2",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS["Apex Arrow"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Sherida Earring",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS["Apex Arrow"] = set_combine(sets.WS.RA, {
        head = "Orion Beret +3",
        body = "Amini Caban +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +3",
        neck = {
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Sherida Earring",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Sword Weaponskills
    sets.WS["Fast Blade"] = set_combine(sets.WS.WSD, {})
    sets.WS["Burning Blade"] = set_combine(sets.WS.MAB, {})
    sets.WS["Flat Blade"] = set_combine(sets.WS.WSD, {})
    sets.WS["Shining Blade"] = set_combine(sets.WS.WSD, {})
    sets.WS["Circle Blade"] = set_combine(sets.WS.WSD, {})
    sets.WS["Spirits Within"] = set_combine(sets.WS.WSD, {})

    sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {
        ammo = Ammo.WSD,
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
        feet = "Amini Bottillons +3",
        neck = "Rep. Plat. Medal",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Sroda Ring",
        right_ring = "Regal Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WS.PDL["Savage Blade"] = set_combine(sets.WS.WSD, {
        head = "Orion Beret +3",
        body = "Ikenga's Vest",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Amini Bottillons +3",
        neck = "Scout's Gorget +2",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Amini Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need STR WSD cape
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    -- Dagger Weaponskills
    sets.WS["Wasp Sting"] = set_combine(sets.WS.WSD, {})
    sets.WS["Viper Bite"] = set_combine(sets.WS.WSD, {})
    sets.WS["Shadowstitch"] = set_combine(sets.WS.WSD, {})
    sets.WS["Gust Slash"] = set_combine(sets.WS.WSD, {})
    sets.WS["Cyclone"] = set_combine(sets.WS.WSD, {})
    sets.WS["Energy Steal"] = set_combine(sets.WS.WSD, {})
    sets.WS["Energy Drain"] = set_combine(sets.WS.WSD, {})
    sets.WS["Evisceration"] = set_combine(sets.WS.WSD, {})

    sets.WS['Aeolian Edge'] = set_combine(sets.WS.MAB, {
        ammo = Ammo.WSD,
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
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = { -- need INT/WSD cape (Belenus's Cape)
            name = "Belenus's Cape",
            augments = {'DEX+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'DEX+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Crossbow Weaponskills
    sets.WS["Trueflight"] = set_combine(sets.WS.MAB, {
        ammo = Ammo.MAB,
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
            name = "Scout's Gorget +2",
            augments = {'Path: A'}
        },
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Belenus's Cape",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%'}
        }
    })

    sets.Charm = {}

    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        body = "Volte Jupon",
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
    equipSet = {}
    equipSet = Job_Mode_Check(equipSet)

    if spell.type == 'WeaponSkill' then
        if state.OffenseMode.current == 'PDL' and sets.WS.PDL[spell.english] then
            equipSet = sets.WS.PDL[spell.english]
        elseif sets.WS[spell.english] then
            equipSet = sets.WS[spell.english]
        else
            equipSet = sets.WS
        end
    end

    return equipSet
end

-- Testing logic for critical double shot and AM3
-- function job_post_midcast(spell, action, spellMap, eventArgs)
--     if spell.action_type == 'Ranged Attack' then
--         if buffactive['Double Shot'] then
--             equip(sets.Midcast.RA.DoubleShot)
--             if buffactive['Aftermath: Lv.3'] and player.equipment.range == "Armageddon" then
--                 equip(sets.Midcast.RA.CRIT.DoubleShot)
--                 if (spell.target.distance < (7 + spell.target.model_size)) and
--                     (spell.target.distance > (5 + spell.target.model_size)) then
--                     equip(sets.Midcast.RA['True Shot'])
--                 end
--             end
--         elseif buffactive['Aftermath: Lv.3'] and player.equipment.range == "Armageddon" then
--             equip(sets.Midcast.RA.CRIT)
--             if (spell.target.distance < (7 + spell.target.model_size)) and
--                 (spell.target.distance > (5 + spell.target.model_size)) then
--                 equip(sets.Midcast.RA['True Shot'])
--             end
--         elseif buffactive['Aftermath: Lv.3'] and player.equipment.range == "Gandiva" then
--             equip(sets.Midcast.RA.CRIT)
--             if (spell.target.distance < (7 + spell.target.model_size)) and
--                 (spell.target.distance > (5 + spell.target.model_size)) then
--                 equip(sets.Midcast.RA['True Shot'])
--             end
--         end

--         if state.Buff.Barrage then
--             equip(sets.Midcast.RA.Barrage)
--         end
--     end
-- end

-- Augment basic equipment sets
function midcast_custom(spell)
    equipSet = {}
    equipSet = Job_Mode_Check(equipSet)
    return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
    equipSet = {}
    equipSet = Job_Mode_Check(equipSet)
    if state.JobMode.value == 'Ranged' and player.status == "Engaged" then
        equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
    end

    equipSet = choose_set_custom()
    equip(equipSet)

    return equipSet
end
-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    equipSet = {}
    if state.JobMode.value == 'Ranged' and player.status == "Engaged" then
        equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
    end
    equipSet = Job_Mode_Check(equipSet)
    return equipSet
end
-- This function is called when a update request the correct equipment set
function choose_set_custom()
    equipSet = {}
    equipSet = Job_Mode_Check(equipSet)
    return equipSet
end
-- Function is called when the player changes states
function status_change_custom(new, old)
    equipSet = {}
    if state.JobMode.value == 'Ranged' and new == "Engaged" then
        equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
    end
    equipSet = Job_Mode_Check(equipSet)
    return equipSet
end

-- Function is called when a self command is issued
function self_command_custom(command)
    Smart_Ammo()
end

-- Function is called whn lua is unloaded
function user_file_unload()

end

function check_buff_JA()
    buff = 'None'
    local ja_recasts = windower.ffxi.get_ability_recasts()
    if player.sub_job == 'WAR' then
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

function Smart_Ammo()
    for i = 1, #Ranged_Weapons do
        if state.WeaponMode.value == Ranged_Weapons[i].WeaponMode then
            if state.RAMode.value ~= Ranged_Weapons[i].Type then
                state.RAMode:set(Ranged_Weapons[i].Type)
                windower.add_to_chat(8, 'Ammo Mode is [' .. state.RAMode.value .. ']')
                get_sets()
                equip({
                    ammo = Ammo.RA
                })
            end
            return
        end
    end
end

function Job_Mode_Check(equipSet)
    if state.JobMode.value == 'Melee' then
        equipSet = set_combine(equipSet, sets.Weapons.Melee)
    elseif state.JobMode.value == 'Ranged' then
        equipSet = set_combine(equipSet, sets.Weapons.Ranged)
    end
    if DualWield == false then
        if TwoHand == false then
            equipSet = set_combine(equipSet, sets.Weapons.Shield)
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
