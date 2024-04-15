-- Salidar
-- Load and initialize the include file.
include('Lilypeach-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "5"
MacroBook = "9"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

-- Modes for specific to bard
state.WeaponMode:options('Mordant Rime', 'Aeolian Edge', 'Shining Strike', 'Shining Blade', 'Savage Blade',
    'Eviceration', 'Rudra\'s Storm', 'Kraken Mode')
state.WeaponMode:set('Mordant Rime')

elemental_ws = S {'Aeolian Edge', 'Burning Blade', 'Shining Strike', 'Shining Blade'}

-- Default to DT Mode
state.OffenseMode:set('TP')

-- Command to Lock Style and Set the correct macros
jobsetup(LockStylePallet, MacroBook, MacroSet)
send_command('bind f10 gs c songbuff')

function get_sets()

    -- Set the weapon options.  This is set below in job customization section
    sets.Weapons = {}

    sets.Weapons['Mordant Rime'] = {
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
        },
        sub = "Crepuscular Knife"
    }

    sets.Weapons['Aeolian Edge'] = {
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
        },
        sub = "Tauret"
    }

    sets.Weapons['Shining Strike'] = {
        main = "Daybreak",
        sub = "Crepuscular Knife"
    }

    sets.Weapons['Kraken Mode'] = {
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
        },
        sub = "Kraken Club"
    }

    sets.Weapons['Shining Blade'] = {
        main = "Naegling",
        sub = "Crepuscular Knife"
    }

    sets.Weapons['Savage Blade'] = {
        main = "Naegling",
        sub = "Centovente"
    }

    -- sets.Weapons['Eviceration'] = {
    --     main = 'Tauret',
    --     sub = "Crepuscular Knife"
    -- }
    sets.Weapons['Eviceration'] = {
        main = 'Fusetto +2',
        sub = "Ternion Dagger +1"
    }

    sets.Weapons['Rudra\'s Storm'] = {
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
        },
        sub = "Crepuscular Knife"
    }

    sets.Weapons.Songs = {
        main = {
            name = "Kali",
            augments = {'Mag. Acc.+15', 'String instrument skill +10', 'Wind instrument skill +10'}
            -- name = "Carnwenhan",
            -- augments = {'Path: A'}
        },
        sub = {
            name = "Kali",
            augments = {'Mag. Acc.+15', 'String instrument skill +10', 'Wind instrument skill +10'}
        }
    }

    sets.Weapons.Shield = {
        sub = "Genmei Shield"
    }

    sets.Weapons.Sleep = {
        range = "Loughnashade"
    }

    -- Instruments to use
    Instrument = {}
    Instrument.Count = {
        name = "Blurred Harp +1"
    }
    Instrument.Potency = {
        name = "Gjallarhorn"
    }
    Instrument.Honor = {
        name = "Marsyas"
    }
    Instrument.AOE_Sleep = {
        name = "Blurred Harp +1"
    }
    Instrument.Idle = {
        name = "Linos",
        augments = {'Mag. Evasion+15', 'Phys. dmg. taken -4%', 'HP+20'}
    }
    Instrument.TP = {
        name = "Linos",
        augments = {'Accuracy+20', '"Store TP"+4', 'Quadruple Attack +3'}
    }
    Instrument.Mordant = {
        name = "Linos",
        augments = {'Accuracy+15 Attack+15', 'Weapon skill damage +3%', 'CHR+8'}
    }
    Instrument.QuickMagic = {
        name = "Linos",
        augments = {'Mag. Evasion+15', 'Occ. quickens spellcasting +4%', 'HP+20'}
    }
    Instrument.FastCast = {
        name = "Linos",
        augments = {'Mag. Evasion+15', '"Fast Cast"+6', 'HP+20'}
    }
    Instrument.MAB = {
        name = "Linos",
        augments = {'Mag. Acc.+10 "Mag.Atk.Bns."+10', 'Weapon skill damage +3%', 'INT+8'}
    }

    -- HP/MP Balancing Goal
    -- HP: 2200 MP: 550

    -- Standard Idle set
    sets.Idle = {
        sub = "Genmei Shield",
        range = "Blurred Harp +1",
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Carrier's Sash",
        right_ear = "Genmei Earring",
        left_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Stikini Ring +1",
        back = "Moonlight Cape"
    } -- PDT 60%%, MDT 56%

    sets.Idle.town = {
        sub = "Genmei Shield",
        range = "Blurred Harp +1",
        head = "Fili Calot +2",
        body = "Fili Hongreline +2",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Brioso Slippers +3",
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Carrier's Sash",
        right_ear = "Genmei Earring",
        left_ear = "Etiolation Earring",
        left_ring = "Defending Ring",
        right_ring = "Stikini Ring +1",
        back = "Moonlight Cape"
    }

    -- Used to swap into movement gear when the player is detected movement when not engaged
    sets.Movement = {
        left_ring = "Shneddick Ring"
    }

    -- Set to be used if you get cursna casted on you
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
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Ayanmo Corazza +2",
        hands = "Bunzi's Gloves",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "Bard's Charm +1",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Telos Earring",
        right_ear = "Cessance Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
    sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
        left_ring = {
            name = "Moonlight ring",
            bag = "wardrobe2",
            priority = 2
        },
        right_ring = {
            name = "Moonlight Ring",
            bag = "wardrobe3",
            priority = 1
        }
    })

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {})

    -- This set is used when OffenseMode is PDL and Enaged
    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
        left_ring = "Sroda Ring"
    })

    -- The following sets augment the base TP set
    sets.DualWield = {
        waist = "Reiki Yotai",
        left_ear = "Eabani Earring"
    }

    sets.Precast = {}

    -- Used for Magic Spells
    sets.Precast.FastCast = {
        range = Instrument.FastCast, -- 6
        head = "Bunzi's Hat", -- 10
        body = "Inyanga Jubbah +2", -- 14
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        }, -- 8
        legs = "Volte Brais", -- 8
        feet = "Fili Cothurnes +1", -- 13
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'},
            priority = 2
        },
        waist = "Embla Sash", -- 5
        left_ear = {
            name = "Etiolation Earring",
            priority = 1
        }, -- 1
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'},
            priority = 3
        },
        left_ring = "Kishar Ring", -- 4
        right_ring = "Weather. Ring", -- 5
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        } -- 10
    } -- 81 FC

    -- Used for Songs (now easy to max Fast Cast so not needed)
    sets.Precast.Songs = sets.Precast.FastCast

    -- Used for "-Cure casting time"
    sets.Precast.Cure = {}

    -- Used for Raises and Cure spells
    sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
        range = Instrument.QuickMagic, -- 4
        waist = "Witful Belt", -- 3
        right_ring = "Weather. Ring" -- 3
    }) -- 10% Quick Magic

    -- Default song duration / strength
    sets.Midcast = set_combine(sets.Idle, {
        -- main = {
        --     name = "Kali",
        --     augments = {'Mag. Acc.+15', 'String instrument skill +10', 'Wind instrument skill +10'}
        -- },
        head = "Fili Calot +2",
        body = "Fili Hongreline +2",
        hands = "Fili Manchettes +1",
        legs = "Inyanga Shalwar +2",
        feet = "Brioso Slippers +2",
        neck = "Moonbow Whistle",
        waist = "Flume Belt +1",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'},
            priority = 3
        },
        right_ear = {
            name = "Etiolation Earring",
            priority = 1
        }, -- 1
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'},
            priority = 2
        }, -- 7/-1
        right_ring = "Defending Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        }
    })

    -- Reduce Durations for Dummy songs (Ballad is lowest duration)
    sets.Midcast.DummySongs = set_combine(sets.Midcast, {
        feet = "Bunzi's Sabots"
    })

    -- Cure Set
    sets.Midcast.Cure = {
        range = Instrument.FastCast,
        head = {
            name = "Kaykaus Mitra +1",
            augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
        }, -- 11/2
        body = {
            name = "Kaykaus Bliaut +1",
            augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
        }, -- 0/6
        hands = {
            name = "Kaykaus Cuffs +1",
            augments = {'MP+80', 'MND+12', 'Mag. Acc.+20'}
        }, -- 11/2
        legs = {
            name = "Kaykaus Tights +1",
            augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
        }, -- 11/2
        feet = {
            name = "Kaykaus Boots +1",
            augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
        }, -- 11/2
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Luminary Sash",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Mendi. Earring", -- 5/0
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Naji's Loop", -- 1/1
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        }
    } -- 50% Cure Potency / 15% Cure Potency II

    -- Base set for duration
    sets.Midcast.Enhancing = {
        sub = "Ammurapi Shield",
        range = Instrument.FastCast,
        head = {
            name = "Telchine Cap",
            augments = {'Enh. Mag. eff. dur. +10'}
        },
        body = {
            name = "Telchine Chas.",
            augments = {'Enh. Mag. eff. dur. +10'}
        },
        hands = {
            name = "Telchine Gloves",
            augments = {'Enh. Mag. eff. dur. +10'}
        },
        legs = {
            name = "Telchine Braconi",
            augments = {'Enh. Mag. eff. dur. +10'}
        },
        feet = {
            name = "Telchine Pigaches",
            augments = {'Enh. Mag. eff. dur. +10'}
        },
        neck = "Incanter's Torque",
        waist = "Embla Sash",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Etiolation Earring",
        left_ring = {
            name = "Stikini Ring +1",
            bag = "wardrobe2"
        },
        right_ring = {
            name = "Stikini Ring +1",
            bag = "wardrobe3"
        },
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        }
    }
    -- Curaga Set (different rules than cure)
    sets.Midcast.Curaga = sets.Midcast.Cure

    -- Cursna Set
    sets.Midcast.Cursna = set_combine(sets.Midcast.Cure, {
        hands = "Inyan. Dastanas +2",
        left_ring = "Menelaus's Ring",
        right_ring = "Haoma's Ring",
        feet = {
            name = "Vanya Clogs",
            augments = {'Healing magic skill +20', '"Cure" spellcasting time -7%', 'Magic dmg. taken -3'}
        },
        waist = "Bishop's Sash"
    })

    -- Used for elemental Bar Magic Spells
    sets.Midcast.Enhancing.Elemental = {}

    -- High MACC for landing spells
    sets.Midcast.Enfeebling = {
        -- sub = "Ammurapi Shield",
        -- range = Instrument.Potency,
        -- head = "Brioso Roundlet +3",
        -- body = "Brioso Justau. +1",
        -- hands = "Inyan. Dastanas +2",
        -- legs = "Brioso Cannions +3",
        -- feet = "Brioso Slippers +3",
        -- neck = "Mnbw. Whistle +1",
        -- waist = {
        --     name = "Obstin. Sash",
        --     augments = {'Path: A'}
        -- },
        -- left_ear = "Regal Earring",
        -- right_ear = "Crep. Earring",
        -- left_ring = {
        --     name = "Stikini Ring +1",
        --     bag = "wardrobe2"
        -- },
        -- right_ring = {
        --     name = "Stikini Ring +1",
        --     bag = "wardrobe3"
        -- },
        -- back = {
        --     name = "Intarabus's Cape",
        --     augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        -- }
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
        },
        sub = "Ammurapi Shield",
        range = "Gjallarhorn",
        head = "Brioso Roundlet +3",
        body = "Fili Hongreline +2",
        hands = "Brioso Cuffs +3",
        legs = "Bihu Cannions +3",
        feet = "Brioso Slippers +3",
        neck = "Moonbow Whistle",
        waist = {
            name = "Acuity Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Regal Earring",
        right_ear = {
            name = "Fili Earring",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+10', 'Mag. Acc.+10'}
        },
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Stikini Ring +1",
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10'}
        }
    }
    -- Bard Specific Sets

    -- Max duration
    sets.Midcast.Lullaby = set_combine(sets.Midcast.Enfeebling, {
        range = Instrument.Honor,
        body = "Fili Hongreline +2",
        hands = "Brioso Cuffs +3",
        legs = "Inyanga Shalwar +2"
    })
    sets.Midcast.Finale = {}
    sets.Midcast.Requiem = {}
    sets.Midcast.Elegy = {}
    sets.Midcast.Prelude = {}
    sets.Midcast.Madrigal = {
        head = "Fili Calot +2"
    }
    sets.Midcast.Minuet = {
        body = "Fili Hongreline +2"
    }
    sets.Midcast.March = {
        hands = "Fili Manchettes +2"
    }
    sets.Midcast.Ballad = {
        legs = "Fili Rhingrave +2"
    }
    sets.Midcast.Scherzo = {
        feet = "Fili Cothurnes +2"
    }
    sets.Midcast.Mazurka = {}
    sets.Midcast.Paeon = {
        head = "Brioso Roundlet +3"
    }
    sets.Midcast.Threnody = {
        body = "Mou. Manteel +1"
    }
    sets.Midcast.Minne = {
        legs = "Mou. Seraweels +1"
    }
    sets.Midcast.Mambo = {}
    sets.Midcast.Carol = {
        hands = "Mousai Gages +1"
    }
    sets.Midcast.Etude = {
        head = "Mousai Turban +1"
    }
    sets.Midcast.Dirge = {}
    sets.Midcast.Sirvente = {}

    sets.Utsusemi = set_combine(sets.Idle, {})

    sets.Midcast['Utsusemi: Ichi'] = sets.Utsusemi
    sets.Midcast['Utsusemi: Ni'] = sets.Utsusemi

    -- Specific gear for spells
    sets.Midcast["Stoneskin"] = {
        waist = "Siegel Sash"
    }

    -- Job Abilities
    sets.JA = {}
    sets.JA["Nightingale"] = {
        feet = {
            name = "Bihu Slippers +3",
            augments = {'Enhances "Nightingale" effect'}
        }
    }
    sets.JA["Troubadour"] = {
        body = {
            name = "Bihu Jstcorps. +3",
            augments = {'Enhances "Troubadour" effect'}
        }
    }
    sets.JA["Soul Voice"] = {
        legs = {
            name = "Bihu Cannions +3",
            augments = {'Enhances "Soul Voice" effect'}
        }
    }
    sets.JA["Tenuto"] = {}
    sets.JA["Marcato"] = {}
    sets.JA["Clarion"] = {}
    sets.JA["Pianissimo"] = {}

    -- Default WS set base
    sets.WS = {
        range = Instrument.Mordant,
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
            name = "Bard's Charm +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Ishvara Earring",
        right_ear = "Regal Earring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Accuracy+20 Attack+20', 'CHR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- Equipment to augment the Melee WS for Physical Damage Limit (Capped Attack)
    sets.WS.PDL = set_combine(sets.WS, {
        left_ring = "Sroda Ring"
    })

    -- The following sets augment the WS base set
    sets.WS.WSD = set_combine(sets.WS, {
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Rufescent Ring",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS.MAB = set_combine(sets.WS, {
        range = Instrument.MAB,
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
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Regal Earring",
        left_ring = "Shiva Ring +1",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS.ACC = set_combine(sets.WS, {})

    sets.WS.CRIT = set_combine(sets.WS, {
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Hetairoi Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {
        range = {
            name = "Linos",
            augments = {'Accuracy+13', 'Weapon skill damage +3%', 'STR+8'}
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
        neck = {
            name = "Bard's Charm +1",
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
        right_ear = "Ishvara Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Shukuyu Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    })

    sets.WS["Mordant Rime"] = set_combine(sets.WS, {
        range = Instrument.Mordant
    })

    sets.WS["Eviceration"] = sets.WS.CRIT

    sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets"
    })

    sets.WS["Burning Blade"] = sets.WS.MAB
    sets.WS["Shining Blade"] = set_combine(sets.WS.MAB, {
        right_ring = "Weather. Ring"
    })
    sets.WS["Shining Strike"] = set_combine(sets.WS.MAB, {
        right_ring = "Weather. Ring"
    })

    sets.Charm = set_combine(sets.Idle, {})

    sets.TreasureHunter = {
        body = "Volte Jupon",
        legs = "Volte Hose",
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
    -- Calls the Bard Dummy Song function
    if command == 'songbuff' then
        dummy_songs()
    end
end

function check_buff_SP()
    buff = 'None'
    -- local sp_recasts = windower.ffxi.get_spell_recasts()
    return buff
end

function check_buff_JA()
    buff = 'None'
    -- local ja_recasts = windower.ffxi.get_ability_recasts()
    return buff
end

-- Function is called when the job lua is unloaded
function user_file_unload()

end

-- Function to prebuff Dummy Songs
function dummy_songs()
    info('Song Buff Begin')
    state.AutoBuff:set('ON')
    send_command("input /ma \"Army's Paeon IV\" <me>")
    coroutine.schedule(player_buffing, .05)
    coroutine.schedule(song2, 5.5)
    coroutine.schedule(song3, 11)
    coroutine.schedule(song4, 16.5)
end

function song2()
    is_Buffing = false
    send_command("input /ma \"Army's Paeon III\" <me>")
    coroutine.schedule(player_buffing, .05)
end

function song3()
    is_Buffing = false
    send_command("input /ma \"Army's Paeon II\" <me>")
    coroutine.schedule(player_buffing, .05)
end

function song4()
    is_Buffing = false
    send_command("input /ma \"Army's Paeon\" <me>")
    coroutine.schedule(player_buffing, .05)
    coroutine.schedule(songbuff, 5.5)
end

function songbuff()
    state.AutoBuff:set('OFF')
    is_Buffing = false
end

function player_buffing()
    is_Buffing = true
end
