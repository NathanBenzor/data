-- Mirdain
-- Load and initialize the include file.
include('Fudosama-Include2')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "133"
MacroBook = "37"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- Uses Items Automatically
AutoItem = false

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- Lockstyle sets to randomly equip
Lockstyle_List = {1, 2, 6, 12}

-- Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

-- Modes for specific to Ninja
state.WeaponMode:options('Heishi', 'Savage Blade', 'Great Katana', 'Aeolian Edge', 'Enmity', 'Nuking', 'Abyssea')
state.WeaponMode:set('Heishi')

elemental_ws = S {'Aeolian Edge', 'Blade: Teki', 'Blade: To', 'Blade: Chi', 'Blade: Ei', 'Blade: Yu'}

jobsetup(LockStylePallet, MacroBook, MacroSet)

function get_sets()
    -- Set the weapon options.  This is set below in job customization section

    -- Weapon setup
    sets.Weapons = {}

    sets.Weapons['Heishi'] = {
        main = "Heishi Shorinken",
        sub = "Kunimitsu"
    }

    sets.Weapons['Savage Blade'] = {
        main = "Naegling",
        sub = {
            name = "Hitaki",
            augments = {'TP Bonus +1000'}
        }
    }

    sets.Weapons['Great Katana'] = {
        main = "Hachimonji",
        sub = "Alber Strap"
    }

    sets.Weapons['Aeolian Edge'] = {
        main = "Tauret",
        sub = "Naegling"
    }

    sets.Weapons['Enmity'] = {
        main = {
            name = "Heishi Shorinken",
            augments = {'Path: A'}
        },
        sub = {
            name = "Tsuru",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Nuking'] = {
        main = "Gokotai",
        sub = {
            name = "Kunimitsu",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Abyssea'] = {
        main = "",
        sub = ""
    }

    -- Standard Idle set with -DT, Refresh, Regen and movement gear
    sets.Idle = {
        ammo = "Seki Shuriken",
        -- head = {
        --     name = "Nyame Helm",
        --     augments = {'Path: B'}
        -- },
        head = "Null Masque",
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
        -- neck = {
        --     name = "Loricate Torque +1",
        --     augments = {'Path: A'}
        -- },
        neck = "Null Loop",
        waist = "Null Belt",
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

    -- Defined below based off time of day
    sets.Movement = {
        left_ring = "Shneddick Ring"
    }

    sets.Movement.Day = {
        feet = "Danzo Sune-Ate"
    }
    sets.Movement.Night = {
        feet = "Hachi. Kyahan +1"
    }
    sets.Movement.Dusk = {
        feet = "Hachi. Kyahan +1"
    }

    -- Set to be used if you get 
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = {
            name = "Saida Ring",
            bag = "wardrobe3",
            priority = 2
        },
        right_ring = {
            name = "Saida Ring",
            bag = "wardrobe4",
            priority = 1
        },
        waist = "Gishdubar Sash"
    }

    sets.OffenseMode = {}

    -- Base TP set to build off
    sets.OffenseMode.TP = {
        ammo = "Seki Shuriken",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        },
        -- legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = {
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Telos Earring",
        right_ear = "Dedition Earring",
        left_ring = "Epona's Ring",
        right_ring = "Gere Ring",
        -- back = {
        --     name = "Andartia's Mantle",
        --     augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        -- }
        back = "Null Shawl"
    }
    -- This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
    sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
        -- ammo = "Date Shuriken",
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        -- body = "Mpaca's Doublet",
        body = "Malignance Tabard",
        -- hands = "Mpaca's Gloves",
        hands = "Malignance Gloves",
        -- legs = "Mpaca's Hose",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        left_ring = "Defending Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    })
    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        hands = "Ken. Tekko +1",
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1"
    })
    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots"
    })

    sets.DualWield = {}

    sets.Precast = {}
    -- Used for Magic Spells
    sets.Precast.FastCast = {
        head = {
            name = "Herculean Helm",
            augments = {'"Fast Cast"+4', 'Haste+1', 'Accuracy+15 Attack+15'}
        },
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        neck = "Voltsurge Torque", -- 4
        waist = "Plat. Mog. Belt",
        left_ear = "Etiolation Earring", -- 1
        right_ear = "Loquac. Earring", -- 2
        left_ring = "Kishar Ring",
        right_ring = "Prolix Ring"
    } -- 67

    sets.Precast.Utsusemi = {
        body = {
            name = "Mochi. Chainmail +3",
            augments = {'Enhances "Sange" effect'}
        },
        neck = "Magoraga Beads"
    }

    sets.Precast.QuickMagic = {}

    sets.Enmity = {
        ammo = "Date Shuriken",
        head = "Genmei Kabuto",
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        legs = "Zoar Subligar +1",
        feet = {
            name = "Mochi. Kyahan +3",
            augments = {'Enh. Ninj. Mag. Acc/Cast Time Red.'}
        },
        neck = "Moonbeam Necklace",
        waist = "Trance Belt",
        left_ear = "Trux Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'HP+60', 'Enmity+10', 'Damage taken-5%'}
        }
    }

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})
    -- Utsusemi Set
    sets.Midcast.Utsusemi = {
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        },
        feet = "Hattori Kyahan +3"
    }
    -- This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
    sets.Midcast.SIRD = {}
    -- Cure Set
    sets.Midcast.Cure = {}
    -- Enhancing Skill
    sets.Midcast.Enhancing = {
        ammo = "Yamarang",
        head = "Hachiya Hatsu. +3",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Null Belt",
        left_ear = "Crep. Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Null Shawl"
    }
    -- High MACC for landing spells
    sets.Midcast.Enfeebling = {
        ammo = "Yamarang",
        head = "Hachiya Hatsu. +3",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Null Belt",
        left_ear = "Crep. Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Null Shawl"
    }
    -- High MAB for spells
    sets.Midcast.Nuke = {
        -- ammo = {
        --     name = "Seeth. Bomblet +1",
        --     augments = {'Path: A'}
        -- },
        -- head = {
        --     name = "Mochi. Hatsuburi +3",
        --     augments = {'Enhances "Yonin" and "Innin" effect'}
        -- },
        -- body = "Nyame Mail",
        -- hands = "Nyame Gauntlets",
        -- legs = "Nyame Flanchard",
        -- feet = "Nyame Sollerets",
        -- neck = "Sanctity Necklace",
        -- waist = "Eschan Stone",
        -- left_ear = "Hecate's Earring",
        -- right_ear = "Friomisi Earring",
        -- left_ring = "Dingir Ring",
        -- right_ring = "Stikini Ring +1",
        -- back = {
        --     name = "Andartia's Mantle",
        --     augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10'}
        -- }
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
        },
        body = "Gyve Doublet",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Gyve Trousers",
        feet = {
            name = "Mochi. Kyahan +3",
            augments = {'Enh. Ninj. Mag. Acc/Cast Time Red.'}
        },
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Hermetic Earring",
        right_ear = "Friomisi Earring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Shiva Ring +1",
        back = {
            name = "Andartia's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10'}
        }
    }

    -- Specific gear for spells
    sets.Midcast["Stoneskin"] = {
        waist = "Siegel Sash"
    }

    sets.JA = {}
    sets.JA["Futae"] = {} -- hands="Hattori Tekko"
    sets.JA["Berserk"] = sets.Enmity
    sets.JA["Warcry"] = sets.Enmity
    sets.JA["Defender"] = {}
    sets.JA["Aggressor"] = {}
    sets.JA["Provoke"] = sets.Enmity
    sets.JA["Mijin Gakure"] = {}
    sets.JA["Yonin"] = {
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
        }
    }
    sets.JA["Innin"] = {
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
        }
    }
    sets.JA["Issekigan"] = sets.Enmity
    sets.JA["Mikage"] = {}

    -- Default WS set base
    sets.WS = {
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
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        ring1 = "Regal Ring",
        ring2 = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        },
        waist = "Fotia Belt"
    }

    sets.WS.WSD = set_combine({
        sets.WS,
        left_ring = "Epaminondas's Ring",
        right_ring = "Karieyh Ring +1"
    })

    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = set_combine({
        sets.WS,
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        hands = "Ken. Tekko +1",
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1"
    })

    sets.WS.CRIT = {
        ammo = "Yetshila +1",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Ken. Samue +1",
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'AGI+6', 'Crit.hit rate+3', 'Quadruple Attack +2', 'Accuracy+6 Attack+6'}
        },
        neck = {
            name = "Ninja Nodowa +2",
            augments = {'Path: A'}
        },
        waist = "Windbuffet Belt +1",
        left_ear = "Ishvara Earring",
        right_ear = "Odr Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }
    sets.WS.MAB = set_combine({
        sets.WS,
        ammo = {
            name = "Seeth. Bomblet +1",
            augments = {'Path: A'}
        },
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Epaminondas's Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10'}
        }
    })

    -- WS Sets
    sets.WS["Blade: Rin"] = sets.WS.CRIT
    sets.WS["Blade: Retsu"] = {}
    sets.WS["Blade: Teki"] = {
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
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
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }
    sets.WS["Blade: To"] = {
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
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
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }
    sets.WS["Blade: Chi"] = {
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
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
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }
    sets.WS["Blade: Ei"] = set_combine(sets.WS.MAB, {
        head = "Pixie Hairpin +1",
        left_ring = "Archon Ring"
    })
    sets.WS["Blade: Jin"] = sets.WS.CRIT
    sets.WS["Blade: Ten"] = {
        head = {
            name = "Herculean Helm",
            augments = {'Magic dmg. taken -4%', 'Pet: Haste+1', 'Weapon skill damage +9%'}
        },
        body = "Ken. Samue +1",
        hands = "Mummu Wrists +2",
        legs = {
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
        },
        feet = "Ken. Sune-Ate +1",
        neck = {
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Lugra Earring +1",
        left_ring = "Ilabrat Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }
    sets.WS["Blade: Ku"] = {}

    sets.WS["Blade: Kamu"] = {
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        legs = "Mpaca's Hose"
    }
    sets.WS["Blade: Yu"] = sets.WS.MAB

    sets.WS["Blade: Hi"] = {
        ammo = "Date Shuriken",
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
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Mache Earring +1",
        right_ear = "Lugra Earring +1",
        -- left_ring = "Gere Ring",
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Blade: Shun"] = {
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        body = "Mpaca's Doublet",
        hands = {
            name = "Adhemar Wristbands",
            augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}
        },
        legs = "Mpaca's Hose",
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
        right_ear = "Lugra Earring +1",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Asuran Fists"] = {
        ammo = "Yetshila +1",
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        hands = "Ken. Tekko +1",
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = "Odr Earring",
        left_ring = "Hetairoi Ring",
        right_ring = "Gere Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'AGI+20', 'Accuracy+20 Attack+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS["Savage Blade"] = {
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
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
        feet = "Hattori Kyahan +3",
        -- neck = "Rep. Plat. Medal",
        neck = "Fotia Gorget",
        waist = "Sailfi Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Lugra Earring +1",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Tachi: Jinpu"] = {
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
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.WS["Aeolian Edge"] = {
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.TreasureHunter = {
        head = "Volte Cap",
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
-- Function is called by the gearswap command
function self_command_custom(command)

end

-- This function is called when the job file is unloaded
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

Cycle_Time = 1
function Cycle_Timer()
    if world.time >= 17 * 60 or world.time <= 7 * 60 then
        if world.time >= (18 * 60) or world.time <= (6 * 60) then
            sets.Movement = set_combine(sets.Movement, sets.Movement.Night)
            log('Night Feet')
        else
            sets.Movement = set_combine(sets.Movement, sets.Movement.Dusk)
            log('Dusk Feet')
        end
    else
        sets.Movement = set_combine(sets.Movement, sets.Movement.Day)
        log('Day Feet')
    end
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
