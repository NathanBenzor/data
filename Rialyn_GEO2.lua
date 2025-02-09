-- Colonnello
-- Load and initialize the include file.
include('Rialyn-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "2"
MacroBook = "31"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

-- Uses Items Automatically
AutoItem = false

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- Lockstyle sets to randomly equip
Lockstyle_List = {1, 2, 6, 12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP', 'ACC', 'DT', 'PDL', 'SB', 'MEVA') -- ACC effects WS and TP modes

-- Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

-- Set to true to run organizer on job changes
Organizer = false

-- Weapons options
state.WeaponMode:options('Idris', 'Solstice', 'Trial', 'Unlocked')
state.WeaponMode:set('Unlocked')

-- WS to check for Obi or Orpheus Check
elemental_ws = S {'Aeolian Edge', 'Cyclone'}

-- Command to Lock Style and Set the correct macros
jobsetup(LockStylePallet, MacroBook, MacroSet)

-- Goal 2200 HP/1400 MP
function get_sets()

    -- Weapon setup
    sets.Weapons = {}

    sets.Weapons['Idris'] = {
        main = "Idris",
        sub = "Genmei Shield"
    }

    sets.Weapons['Solstice'] = {
        main = {
            name = "Solstice",
            augments = {'Mag. Acc.+20', 'Pet: Damage taken -4%', '"Fast Cast"+5'}
        },
        sub = "Genmei Shield"
    }

    sets.Weapons['Trial'] = {
        main = "Club of Trials",
        sub = "Ethereal Club"
    }

    sets.Weapons['Unlocked'] = {
        main = "Idris",
        sub = "Genmei Shield"
    }

    sets.Weapons.Sleep = {
        main = "Lorg Mor"
    }

    -- Standard Idle set with -DT,Refresh,Regen and movement gear
    sets.Idle = {
        main = "Daybreak",
        sub = "Genmei Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = "Befouled Crown",
        body = "Azimuth Coat +3",
        hands = {
            name = "Bagua Mitaines",
            augments = {'Enhances "Curative Recantation" effect'}
        },
        legs = "Assid. Pants +1",
        feet = {
            name = "Bagua Sandals +2",
            augments = {'Enhances "Radial Arcana" effect'}
        },
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Fucho-no-Obi",
        left_ear = "Infused Earring",
        right_ear = "Genmei Earring",
        left_ring = "Shneddick Ring",
        right_ring = "Stikini Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'VIT+20', 'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'Phys. dmg. taken-10%'}
        }
    } -- 50 PDT / 52 MDT (including shield)

    sets.Idle.town = {
        sub = "Ammurapi Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = {
            name = "Bagua Mitaines +3",
            augments = {'Enhances "Curative Recantation" effect'}
        },
        legs = "Azi. Tights +3",
        feet = {
            name = "Bagua Sandals +3",
            augments = {'Enhances "Radial Arcana" effect'}
        },
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Fucho-no-Obi",
        left_ear = "Infused Earring",
        right_ear = {
            name = "Azimuth Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Mag. Acc.+14', 'Damage taken-5%'}
        },
        left_ring = "Shneddick Ring",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'VIT+20', 'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'Phys. dmg. taken-10%'}
        }
    } -- 50 PDT / 52 MDT (including shield)

    -- Sets for Idle when player has a pet
    sets.Idle.Pet = set_combine(sets.Idle, { -- 2278/1482
        -- Pet: -DT (37.5% to cap) / Pet: Regen  -DT cap -87.5%
        main = "Solstice",
        sub = "Genmei Shield",
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = "Geo. Mitaines +2",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Bagua Sandals +1",
            augments = {'Enhances "Radial Arcana" effect'}
        },
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Isa Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Genmei Earring",
        left_ring = "Defending Ring",
        right_ring = "Stikini Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'VIT+20', 'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'System: 1 ID: 1246 Val: 4'}
        }
        -- back = {
        --     name = "Mecisto. Mantle",
        --     augments = {'Cap. Point+48%', 'DEF+5'}
        -- }
    }) -- 54 PDT / 45 MDT (with shield)

    -- Used to swap into movement gear when the player is moving and not engaged
    sets.Movement = {
        left_ring = "Shneddick Ring"
        -- feet = "Geo. Sandals +3"
    }

    -- Set to be used if you get 
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

    sets.OffenseMode = {
        main = "Idris",
        sub = "Genmei Shield",
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
        neck = "Clotharius Torque",
        waist = "Windbuffet Belt +1",
        left_ear = "Cessance Earring",
        right_ear = "Brutal Earring",
        left_ring = "Petrov Ring",
        right_ring = "Stikini Ring +1",
        back = "Penetrating Cape"
    }
    -- Base TP set
    sets.OffenseMode.TP = {
        main = "Idris",
        sub = "Genmei Shield",
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
        neck = "Clotharius Torque",
        waist = "Windbuffet Belt +1",
        left_ear = "Cessance Earring",
        right_ear = "Brutal Earring",
        left_ring = "Petrov Ring",
        right_ring = "Stikini Ring +1",
        back = "Penetrating Cape"
    }
    -- Set to use when Dual Wielding
    sets.OffenseMode.TP.DW = {}
    -- TP set when in -Damage Taken mode
    sets.OffenseMode.DT = {}
    -- TP set to use when mode is in accuracy
    sets.OffenseMode.ACC = {}
    -- This set is used when OffenseMode is PDL and Enaged
    sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT, {
        head = "Azimuth Hood +3",
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
        feet = "Azimuth Gaiters +3",
        neck = "Warder's Charm +1",
        waist = "Carrier's Sash",
        left_ear = "Crep. Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Pet: "Regen"+10', 'Damage taken-5%'}
        }
    })

    -- Precast Sets
    sets.Precast = {}
    -- Used for Magic Spells
    sets.Precast.FastCast = {
        main = "C. Palug Hammer",
        head = {
            name = "Merlinic Hood",
            augments = {'Mag. Acc.+9', '"Avatar perpetuation cost" -2', '"Refresh"+1', 'Accuracy+3 Attack+3',
                        'Mag. Acc.+20 "Mag.Atk.Bns."+20'}
        },
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Geo. Pants +1",
        feet = "Agwu's Pigaches",
        neck = "Orunmila's Torque",
        waist = "Witful Belt",
        left_ear = "Malignance Earring",
        right_ear = "Genmei Earring",
        left_ring = "Defending Ring",
        right_ring = "Kishar Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'MP+60', 'Pet: "Regen"+10', 'Pet: "Regen"+5'}
        }
    } -- 87

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    -- This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
    sets.Midcast.SIRD = {}
    -- Cure Set
    sets.Midcast.Cure = {
        main = "Daybreak",
        sub = "Genmei Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = {
            name = "Vanya Hood",
            augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}
        },
        body = {
            name = "Vanya Robe",
            augments = {'Healing magic skill +20', '"Cure" spellcasting time -7%', 'Magic dmg. taken -3'}
        },
        hands = {
            name = "Vanya Cuffs",
            augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}
        },
        legs = {
            name = "Vanya Slops",
            augments = {'MP+50', '"Cure" potency +7%', 'Enmity-6'}
        },
        feet = {
            name = "Vanya Clogs",
            augments = {'"Cure" potency +5%', '"Cure" spellcasting time -15%', '"Conserve MP"+6'}
        },
        neck = "Incanter's Torque",
        waist = "Austerity Belt +1",
        left_ear = "Regal Earring",
        right_ear = "Mendi. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Altruistic Cape"
    }
    -- Enhancing Skill
    sets.Midcast.Enhancing = {
        main = {
            name = "Gada",
            augments = {'Enh. Mag. eff. dur. +6', 'VIT+3', 'Mag. Acc.+5', '"Mag.Atk.Bns."+9', 'DMG:+5'}
        },
        sub = "Ammurapi Shield",
        head = "Befouled Crown",
        body = "Telchine Chas.",
        hands = "Telchine Gloves",
        legs = "Telchine Braconi",
        feet = "Telchine Pigaches",
        neck = "Incanter's Torque",
        ear1 = "Mimir Earring",
        ear2 = "Andoaa Earring",
        ring1 = {
            name = "Stikini Ring +1",
            bag = "wardrobe3"
        },
        ring2 = {
            name = "Stikini Ring +1",
            bag = "wardrobe4"
        },
        back = "Fi Follet Cape +1",
        waist = "Olympus Sash"
    }
    sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {});
    -- High MACC for landing spells
    sets.Midcast.Enfeebling = {
        main = "Daybreak",
        sub = "Ammurapi shield",
        -- ammo = "Pemphredo Tathlum",
        head = "Geo. Galero +1",
        body = "Jhakri Robe +2",
        hands = "Regal Cuffs",
        legs = "Geomancy Pants +2",
        feet = "Bagua Sandals +3",
        neck = {
            name = "Bagua Charm +1",
            augments = {'Path: A'}
        },
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        ring1 = "Stinki Ring +1",
        ring2 = "Stikini Ring +1",
        back = "Aurist's Cape +1"
        -- waist = "Luminary Sash"
    }
    -- Free Nuke
    sets.Midcast.Nuke = {
        main = "Bunzi's Rod",
        sub = "Ammurapi Shield",
        -- ammo = {
        --     name = "Ghastly Tathlum +1",
        --     augments = {'Path: A'}
        -- }, -- 8/8
        head = "Azimuth Hood +3", -- 10/10
        body = "Azimuth Coat +3", -- 10/10
        hands = "Azimuth Gloves +2", -- 10/10
        legs = "Azimuth Tights +3", -- 10/10
        feet = "Azimuth Gaiters +2", -- 10/10
        -- neck = "Sibyl Scarf", -- 5/5
        neck = "Satlada Necklace", -- 5/5
        -- ear1 = "Malignance Earring",
        ear1 = {
            name = "Azimuth Earring",
            augments = {'System: 1 ID: 1676 Val: 0', 'Mag. Acc.+8'}
        },
        ear2 = "Regal Earring",
        -- ring1 = "Freke Ring",
        -- ring2 = "Shiva Ring +1",
        rin1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        waist = "Sacro Cord",
        -- waist = {
        --     name = "Acuity Belt +1",
        --     augments = {'Path: A'}
        -- },
        back = {
            name = "Nantosuelta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }
    -- Used for Burst Mode
    sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
        main = {
            name = "Bunzi's Rod",
            augments = {'Path: A'}
        },
        sub = "Ammurapi Shield",
        -- ammo = {
        --     name = "Ghastly Tathlum +1",
        --     augments = {'Path: A'}
        -- },
        -- head = "Agwu's Cap",
        head = "Azimuth Hood +3",
        body = "Azimuth Coat +3",
        hands = {
            name = "Agwu's Gages",
            augments = {'Path: A'}
        },
        legs = "Azimuth Tights +3",
        feet = "Agwu's Pigaches",
        -- neck = "Mizu. Kubikazari",
        neck = "Satlada Necklace", -- 5/5
        waist = "Sacro Cord",
        -- left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        -- left_ring = "Freke Ring",
        -- right_ring = "Mujin Band",
        rin1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    })

    -- CuragaSet
    sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {})

    -- Cursna Set
    sets.Midcast.Cursna = set_combine(sets.Midcast.Cure, {
        left_ring = "Menelaus's Ring",
        right_ring = "Haoma's Ring"
    })

    -- Specific gear for spells
    sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        waist = "Siegel Sash"
    })
    -- Aquaveil Set
    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
        head = {
            name = "Amalric Coif +1",
            augments = {'MP+80', 'Mag. Acc.+20', '"Mag.Atk.Bns."+20'}
        }
    })

    -- Stun Set
    sets.Midcast["Stun"] = {}

    sets.Midcast["Erase"] = sets.Precast.FastCast

    -- Refresh Set
    sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {})
    -- Aspir Set
    sets.Midcast.Aspir = {
        main = {
            name = "Rubicundity",
            augments = {'Mag. Acc.+6', '"Mag.Atk.Bns."+6', 'Dark magic skill +6', '"Conserve MP"+2'}
        },
        sub = "Ammurapi Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = {
            name = "Bagua Galero +2",
            augments = {'Enhances "Primeval Zeal" effect'}
        },
        -- body = "Azimuth Coat +3",
        body = {
            name = "Merlinic Jubbah",
            augments = {'"Mag.Atk.Bns."+29', '"Drain" and "Aspir" potency +11', 'Mag. Acc.+3'}
        },
        hands = "Azimuth Gloves +3",
        legs = "Azimuth Tights +3",
        feet = "Agwu's Pigaches",
        neck = "Erra Pendant",
        waist = "Fucho-no-Obi",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Evanescence Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }
    -- Drain Set
    sets.Midcast.Drain = {
        main = {
            name = "Rubicundity",
            augments = {'Mag. Acc.+6', '"Mag.Atk.Bns."+6', 'Dark magic skill +6', '"Conserve MP"+2'}
        },
        sub = "Ammurapi Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = {
            name = "Bagua Galero +2",
            augments = {'Enhances "Primeval Zeal" effect'}
        },
        -- body = "Azimuth Coat +3",
        body = {
            name = "Merlinic Jubbah",
            augments = {'"Mag.Atk.Bns."+29', '"Drain" and "Aspir" potency +11', 'Mag. Acc.+3'}
        },
        hands = "Azimuth Gloves +3",
        legs = "Azimuth Tights +3",
        feet = "Agwu's Pigaches",
        neck = "Erra Pendant",
        waist = "Fucho-no-Obi",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Evanescence Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Phys. dmg. taken-10%'}
        }
    }
    -- Indi Duration
    sets.Geomancy = {}
    sets.Geomancy.Indi = {
        main = {
            name = "Solstice",
            augments = {'Mag. Acc.+20', 'Pet: Damage taken -4%', '"Fast Cast"+5'}
        },
        sub = "Genmei Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = "Azimuth Hood +3",
        body = {
            name = "Bagua Tunic +3",
            augments = {'Enhances "Bolster" effect'}
        },
        hands = "Geo. Mitaines +3",
        legs = {
            name = "Bagua Pants +3",
            augments = {'Enhances "Mending Halation" effect'}
        },
        feet = "Azimuth Gaiters +2",
        neck = "Incanter's Torque",
        waist = "Austerity Belt +1",
        left_ear = "Malignance Earring",
        right_ear = {
            name = "Azimuth Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Mag. Acc.+14', 'Damage taken-5%'}
        },
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = {
            name = "Lifestream Cape",
            augments = {'Geomancy Skill +10', 'Indi. eff. dur. +16', 'Pet: Damage taken -2%'}
        }
    }
    sets.Geomancy.Indi.Entrust = set_combine(sets.Geomancy.Indi, {})
    -- Geo Potency
    sets.Geomancy.Geo = set_combine(sets.Geomancy.Indi, {
        main = {
            name = "Solstice",
            augments = {'Mag. Acc.+20', 'Pet: Damage taken -4%', '"Fast Cast"+5'}
        },
        sub = "Genmei Shield",
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
        },
        head = "Azimuth Hood +3",
        body = {
            name = "Bagua Tunic +3",
            augments = {'Enhances "Bolster" effect'}
        },
        hands = "Geo. Mitaines +3",
        legs = {
            name = "Bagua Pants +3",
            augments = {'Enhances "Mending Halation" effect'}
        },
        feet = "Azimuth Gaiters +2",
        neck = "Incanter's Torque",
        waist = "Austerity Belt +1",
        left_ear = "Malignance Earring",
        right_ear = {
            name = "Azimuth Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Mag. Acc.+14', 'Damage taken-5%'}
        },
        left_ring = "Stikini Ring",
        right_ring = "Stikini Ring",
        back = {
            name = "Lifestream Cape",
            augments = {'Geomancy Skill +10', 'Indi. eff. dur. +16', 'Pet: Damage taken -2%'}
        }
    })

    sets.Pet_Midcast = {}

    -- Will be used to keep max HP of Luopan when casting spells but switches when below 70% to the Idle.Pet set.
    sets.Luopan = {
        head = {
            name = "Bagua Galero +2",
            augments = {'Enhances "Primeval Zeal" effect'}
        }
    }

    -- Job Abilities
    sets.JA = {}
    sets.JA["Collimated Fervor"] = {}
    sets.JA["Convert"] = {}
    sets.JA["Bolster"] = {
        body = {
            name = "Bagua Tunic +3",
            augments = {'Enhances "Bolster" effect'}
        }
    }
    sets.JA["Full Circle"] = {
        head = "Azimuth Hood +3", -- 3
        hands = {
            name = "Bagua Mitaines +3",
            augments = {'Enhances "Curative Recantation" effect'}
        }
    }
    sets.JA["Lasting Emanation"] = {}
    sets.JA["Ecliptic Attrition"] = {}
    sets.JA["Life Cycle"] = {
        body = "Geomancy Tunic +2",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Pet: "Regen"+10', 'Damage taken-5%'}
        }
    }
    sets.JA["Blaze of Glory"] = {}
    sets.JA["Dematerialzie"] = {}
    sets.JA["Theurgic Focus"] = {}
    sets.JA["Concentric Pulse"] = {}
    sets.JA["Mending Halation"] = {
        legs = {
            name = "Bagua Pants +3",
            augments = {'Enhances "Mending Halation" effect'}
        }
    }
    sets.JA["Radial Arcana"] = {
        feet = {
            name = "Bagua Sandals +3",
            augments = {'Enhances "Radial Arcana" effect'}
        }
    }
    sets.JA["Widened Compass"] = {}
    sets.JA["Entrust"] = {}

    -- Base WS set
    sets.WS = {
        range = {
            name = "Dunna",
            augments = {'MP+20', 'Mag. Acc.+10', '"Fast Cast"+3'}
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
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Telos Earring",
        left_ring = "Epaminondas's Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Nantosuelta's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Pet: "Regen"+10', 'Damage taken-5%'}
        }
    }
    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = {}
    -- Set to equip when charmed
    sets.Charm = {}

    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        waist = "Chaac Belt",
        hands = {
            name = "Merlinic Dastanas",
            augments = {'Accuracy+20', '"Conserve MP"+4', '"Treasure Hunter"+2', 'Accuracy+18 Attack+18',
                        'Mag. Acc.+16 "Mag.Atk.Bns."+16'}
        }
    }

    sets.Midcast["Diaga"] = set_combine(sets.Midcast.Enfeebling, sets.TreasureHunter)

    sets.Midcast["Dispelga"] = set_combine(sets.Midcast.Enfeebling.MACC, sets.TreasureHunter, {
        main = "Daybreak"
    })

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
    equipSet = Luopan(equipSet)
    return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
    equipSet = {}
    -- Maintain the High HP of the Luopan
    if geomancy:contains(spell.english) then
        equipSet = set_combine(equipSet, sets.Luopan)
    else
        equipSet = Luopan(equipSet)
    end
    return equipSet
end
-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end
-- This function is called when a update request the correct equipment set
function choose_set_custom()
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end
-- Function is called when the player changes states
function status_change_custom(new, old)
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end

function pet_change_custom(pet, gain)
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end

function pet_aftercast_custom(spell)
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end

function pet_midcast_custom(spell)
    equipSet = {}
    equipSet = Luopan(equipSet)
    return equipSet
end

-- Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when the job lua is unloaded
function user_file_unload()

end

function check_buff_JA()
    buff = 'None'
    -- local ja_recasts = windower.ffxi.get_ability_recasts()
    return buff
end

function check_buff_SP()
    buff = 'None'
    -- local sp_recasts = windower.ffxi.get_spell_recasts()
    return buff
end

function Luopan(equipSet) --  This maintains the extra 600hp during midcast of spells when Luopan is deployed
    equipSet = {}
    local head_item = player.equipment.head
    local relic_equiped = false
    if head_item and head_item:contains("Bagua") then
        relic_equiped = true
    end
    if pet.isvalid and pet.hpp >= 70 and relic_equiped then
        equipSet = set_combine(equipSet, sets.Luopan)
    end
    return equipSet
end

Cycle_Time = 5
function Cycle_Timer()
    if player.status == "Idle" then
        -- equip(set_combine(choose_set(),choose_set_custom()))
    end
end
