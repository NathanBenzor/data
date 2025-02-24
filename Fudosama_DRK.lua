-- Elendnur
-- Load and initialize the include file.
include('Fudosama-Include2')

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
state.WeaponMode:options('Foenaria', 'Caladbolg', 'Anguta', 'Naegling', 'Loxotic Mace', 'Liberator', 'Lycurgos')
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

    sets.Weapons['Anguta'] = {
        main = {
            name = "Anguta",
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
        head = "Null Masque",
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
        left_ring = "Eshmun's Ring",
        right_ring = "Eshmun's Ring",
        waist = "Gishdubar Sash"
    }

    sets.OffenseMode = {}

    -- Base TP set to build off
    sets.OffenseMode.TP = {
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
        right_ring = "Moonlight Ring",
        left_ring = "Niqmaddu Ring",
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
        head = "Heath. Bur. +3",
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
        body = "Sacro Breastplate",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = {
            name = "Carmine Cuisses +1",
            augments = {'HP+80', 'STR+12', 'INT+12'}
        },
        feet = {
            name = "Odyssean Greaves",
            augments = {'"Mag.Atk.Bns."+16', '"Fast Cast"+4'}
        },
        neck = "Voltsurge Torque", -- 4
        left_ear = "Etiolation Earring", -- 1
        right_ear = "Malignance Earring",
        left_ring = "Prolix Ring",
        right_ring = "Kishar Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'HP+60', 'Mag. Acc+20 /Mag. Dmg.+20', '"Fast Cast"+10', 'Damage taken-5%'}
        }
    }

    sets.Enmity = {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Founder's Hose",
            augments = {'MND+6', 'Mag. Acc.+10', 'Attack+7', 'Breath dmg. taken -2%'}
        },
        feet = {
            name = "Eschite Greaves",
            augments = {'HP+80', 'Enmity+7', 'Phys. dmg. taken -4'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Trux Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    }

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    sets.Midcast.SIRD = {}

    sets.Midcast.Enfeebling = {
        ammo = "Pemphredo Tathlum",
        head = "Carmine Mask +1",
        body = "Ignominy Breastplate +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Ratri Cuisses",
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Incanter's Torque",
        ear1 = "Digni. Earring",
        ear2 = "Malignance Earring",
        ring1 = "Kishae Ring",
        ring2 = "Stikini Ring +1",
        waist = "Plat. Mog. Belt",
        back = {
            name = "Ankou's Mantle",
            augments = {'HP+60', 'Mag. Acc+20 /Mag. Dmg.+20', '"Fast Cast"+10', 'Damage taken-5%'}
        }
    }

    sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Drain = {
        ammo = "Pemphredo Tathlum",
        head = {
            name = "Fall. Burgeonet +3",
            augments = {'Enhances "Dark Seal" effect'}
        },
        body = {
            name = "Carm. Scale Mail",
            augments = {'HP+60', 'STR+10', 'INT+10'}
        },
        hands = {
            name = "Fall. Fin. Gaunt. +3",
            augments = {'Enhances "Diabolic Eye" effect'}
        },
        legs = "Heath. Flanchard +3",
        feet = "Ratri Sollerets",
        neck = "Erra Pendant",
        -- waist = "Orpheus's Sash",
        waist = "Austerity Belt +1",
        left_ear = "Hirudinea Earring",
        right_ear = "Nehalennia Earring",
        left_ring = "Evanescence Ring",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Niht Mantle",
            augments = {'Attack+13', 'Dark magic skill +10', '"Drain" and "Aspir" potency +24'}
        }
    }

    sets.Midcast.Aspir = {
        ammo = "Pemphredo Tathlum",
        head = {
            name = "Fall. Burgeonet +3",
            augments = {'Enhances "Dark Seal" effect'}
        },
        body = {
            name = "Carm. Scale Mail",
            augments = {'HP+60', 'STR+10', 'INT+10'}
        },
        hands = {
            name = "Fall. Fin. Gaunt. +3",
            augments = {'Enhances "Diabolic Eye" effect'}
        },
        legs = "Heath. Flanchard +3",
        feet = "Ratri Sollerets",
        neck = "Erra Pendant",
        waist = "Austerity Belt +1",
        left_ear = "Hirudinea Earring",
        right_ear = "Nehalennia Earring",
        left_ring = "Evanescence Ring",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Niht Mantle",
            augments = {'Attack+13', 'Dark magic skill +10', '"Drain" and "Aspir" potency +24'}
        }
    }
    sets.Midcast["Stun"] = set_combine(sets.Enmity, {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Founder's Hose",
            augments = {'MND+6', 'Mag. Acc.+10', 'Attack+7', 'Breath dmg. taken -2%'}
        },
        feet = {
            name = "Eschite Greaves",
            augments = {'HP+80', 'Enmity+7', 'Phys. dmg. taken -4'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Trux Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    })

    sets.Midcast["Absorb-CHR"] = set_combine(sets.Enmity, {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Founder's Hose",
            augments = {'MND+6', 'Mag. Acc.+10', 'Attack+7', 'Breath dmg. taken -2%'}
        },
        feet = {
            name = "Eschite Greaves",
            augments = {'HP+80', 'Enmity+7', 'Phys. dmg. taken -4'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Trux Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    })

    sets.Midcast["Absorb-MND"] = set_combine(sets.Enmity, {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Founder's Hose",
            augments = {'MND+6', 'Mag. Acc.+10', 'Attack+7', 'Breath dmg. taken -2%'}
        },
        feet = {
            name = "Eschite Greaves",
            augments = {'HP+80', 'Enmity+7', 'Phys. dmg. taken -4'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Trux Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    })

    sets.Midcast["Absorb-DEX"] = set_combine(sets.Enmity, {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Founder's Hose",
            augments = {'MND+6', 'Mag. Acc.+10', 'Attack+7', 'Breath dmg. taken -2%'}
        },
        feet = {
            name = "Eschite Greaves",
            augments = {'HP+80', 'Enmity+7', 'Phys. dmg. taken -4'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Trux Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    })

    sets.Midcast["Absorb-INT"] = set_combine(sets.Enmity, {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Founder's Hose",
            augments = {'MND+6', 'Mag. Acc.+10', 'Attack+7', 'Breath dmg. taken -2%'}
        },
        feet = {
            name = "Eschite Greaves",
            augments = {'HP+80', 'Enmity+7', 'Phys. dmg. taken -4'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Trux Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    })

    sets.Midcast.Dark = {
        ammo = "Pemphredo Tathlum",
        head = "Ig. Burgeonet +3",
        body = {
            name = "Carm. Scale Mail",
            augments = {'HP+60', 'STR+10', 'INT+10'}
        },
        hands = {
            name = "Fall. Fin. Gaunt. +3",
            augments = {'Enhances "Diabolic Eye" effect'}
        },
        legs = "Heath. Flanchard +3",
        feet = "Ratri Sollerets",
        neck = "Incanter's Torque",
        waist = "Austerity Belt +1",
        left_ear = "Hirudinea Earring",
        right_ear = "Mani Earring",
        left_ring = "Evanescence Ring",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Niht Mantle",
            augments = {'Attack+13', 'Dark magic skill +10', '"Drain" and "Aspir" potency +24'}
        }
    }

    sets.Midcast.Dark.Enhancing = {
        ammo = "Impatiens",
        head = "Ratri Sallet",
        body = "Heathen's Cuirass +3",
        hands = "Ratri Gadlings",
        legs = "Ratri Cuisses",
        feet = "Ratri Sollerets",
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Malignance Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Moonlight Ring",
        right_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        back = "Moonbeam Cape"
    }

    sets.Midcast.Nuke = set_combine(sets.Midcast, {
        ammo = "Pemphredo Tathlum",
        head = "Carmine Mask +1",
        body = "Hjarrandi Breast.",
        hands = "Ratri Gadlings +1",
        legs = "Fall. Flanchard +3",
        feet = "Heath. Sollerets +3",
        neck = "Erra Pendant",
        ear1 = "Crepuscular Earring",
        ear2 = "Malignance Earring",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        waist = "Oneiros Rope",
        back = {
            name = "Ankou's Mantle",
            augments = {'HP+60', 'Mag. Acc+20 /Mag. Dmg.+20', '"Fast Cast"+10', 'Damage taken-5%'}
        }
    })

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

    sets.JA["Arcane Circle"] = {
        feet = "Ig. Sollerets +3"
    }
    sets.JA["Weapon Bash"] = {
        hands = "Ig. Gauntlets +2"
    }
    sets.JA["Last Resort"] = {
        feet = "Fallen's Sollerets +1"
    }
    sets.JA["Souleater"] = {
        head = "Ig. Burgonet +3"
    }
    sets.JA["Dark Seal"] = {
        head = "Fallen's Burgeonet +3"
    }
    sets.JA["Nether Void"] = {
        legs = "Heath. Flanchard +3"
    }
    sets.JA["Scarlet Delirium"] = {}
    sets.JA["Blood Weapon"] = {
        body = "Fall. Cuirass +1"
    }
    sets.JA["Diabolic Eye"] = {}

    -- WS Sets
    sets.WS = {
        ammo = "Knobkierrie",
        head = {
            name = "Sakpata's Helm",
            augments = {'Path: A'}
        },
        body = "Ignominy Cuirass +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Fall. Flanchard +3",
            augments = {'Enhances "Muted Soul" effect'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Thrud Earring",
        -- right_ear = {
        --     name = "Heath. Earring +1",
        --     augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+13', 'Mag. Acc.+13', 'Weapon skill damage +2%'}
        -- },
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
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

    sets.WS["Resolution"] = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Heath. Bur. +3",
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
        feet = "Heathen's Sollerets +3",
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
        -- right_ear = {
        --     name = "Heath. Earring +1",
        --     augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        -- },
        right_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL["Resolution"] = {
        ammo = "Crep. Pebble",
        head = "Heath. Bur. +3",
        body = {
            name = "Sakpatas's Plate",
            augments = {'Path: A'}
        },
        hands = {
            name = "Sakpatas's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Ig. Flanchard +3",
        feet = {
            name = "Sakpatas's Leggings",
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
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Torcleaver"] = {
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
        feet = "Heathen's Sollerets +3",
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
        right_ear = "Thrud Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS.PDL["Torcleaver"] = {
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
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Sroda Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS["Freezebite"] = {
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
        feet = "Heathen's Sollerets +3",
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.PDL["Freezebite"] = {
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
        feet = "Heathen's Sollerets +3",
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS["Catastrophe"] = {
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
        feet = "Heathen's Sollerets +3",
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
        right_ear = "Thrud Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL["Catastrophe"] = {
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
        feet = "Heathen's Sollerets +3",
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
        right_ear = "Thrud Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Cross Reaper"] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
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
        feet = "Heath. Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        right_ear = "Thrud Earring",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL["Cross Reaper"] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
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
        feet = "Heath. Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Entropy"] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
        body = "Dagon Breast.",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Ig. Flanchard +3",
        feet = "Heath. Sollerets +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.PDL["Entropy"] = {
        ammo = "Crep. Pebble",
        head = "Heath. Bur. +3",
        body = "Dagon Breast.",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "Sakpata's Cuisses",
            augments = {'Path: A'}
        },
        feet = "Heath. Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ring = "Sroda Ring",
        right_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS['Insurgency'] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
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
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL['Insurgency'] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
        body = {
            name = "Sakpata's Plate",
            augments = {'Path: A'}
        },
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "sakpata's Cuisses",
            augments = {'Path: A'}
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
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS['Origin'] = {
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
        feet = "Heathen's Sollerets +3",
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
        right_ear = "Thrud Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL['Origin'] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
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
        feet = "Heathen's Sollerets +3",
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
        left_ring = "Cornelia's Ring",
        right_ring = "Sroda Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Quietus"] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
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
        feet = "Heath. Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        right_ear = "Thrud Earring",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL["Quietus"] = {
        ammo = "Knobkierrie",
        head = "Heath. Bur. +3",
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
        feet = "Heath. Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        right_ear = "Thrud Earring",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS['Shadow of Death'] = {
        ammo = "Knobkierrie",
        head = "Pixie Hairpin +1",
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
        feet = "Heathen's Sollerets +3",

        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.PDL['Shadow of Death'] = {
        ammo = "Knobkierrie",
        head = "Pixie Hairpin +1",
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
        feet = "Heathen's Sollerets +3",

        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS['Infernal Scythe'] = {
        ammo = "Knobkierrie",
        head = "Pixie Hairpin +1",
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
        feet = "Heathen's Sollerets +3",
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.PDL['Infernal Scythe'] = {
        ammo = "Knobkierrie",
        head = "Pixie Hairpin +1",
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
        feet = "Heathen's Sollerets +3",
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shiva Ring +1",
        back = {
            name = "Ankou's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS['Savage Blade'] = {
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
            name = "Nya. Flanchard",
            augments = {'Path: B'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL['Savage Blade'] = {
        ammo = "Crep. Pebble",
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
            name = "Nya. Flanchard",
            augments = {'Path: B'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Sroda Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS['Judgement'] = {
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
            name = "Nya. Flanchard",
            augments = {'Path: B'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL['Judgement'] = {
        ammo = "Crep. Pebble",
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
            name = "Nya. Flanchard",
            augments = {'Path: B'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Heath. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', 'Weapon skill damage +3%'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Sroda Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS['Fell Cleave'] = {
        ammo = "Knobkierrie",
        head = {
            name = "Sakpata's Helm",
            augments = {'Path: A'}
        },
        body = "Ignominy Cuirass +3",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "Fall. Flanchard +3",
            augments = {'Enhances "Muted Soul" effect'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL['Fell Cleave'] = {
        ammo = "Knobkierrie",
        head = {
            name = "Sakpata's Helm",
            augments = {'Path: A'}
        },
        body = "Ignominy Cuirass +3",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = {
            name = "Fall. Flanchard +3",
            augments = {'Enhances "Muted Soul" effect'}
        },
        feet = "Heathen's Sollerets +3",
        neck = {
            name = "Abyssal Beads +2",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS['Shockwave'] = {
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
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.PDL['Shockwave'] = {
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
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS.WSD = set_combine(sets.WS, {})

    sets.WS.CRIT = set_combine(sets.WS, {})

    sets.WS.Multi_Hit = set_combine(sets.WS, {})

    -- Used to Tag TH on a mob (TH4 is max in gear non-THF)
    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        body = {
            name = "Valorous Mail",
            augments = {'"Triple Atk."+3', 'INT+12', '"Treasure Hunter"+1', 'Accuracy+16 Attack+16',
                        'Mag. Acc.+1 "Mag.Atk.Bns."+1'}
        },
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
