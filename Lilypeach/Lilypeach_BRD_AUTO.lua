-- Salidar
-- Load and initialize the include file.
include('Lilypeach-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "146"
MacroBook = "11"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

-- Modes for specific to bard
state.WeaponMode:options('Mordant Rime', 'Aeolian Edge', 'Shining Strike', 'Shining Blade', 'Savage Blade',
    'Eviceration', 'Rudra\'s Storm', 'Songs', 'Kraken Mode')
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
        sub = {
            name = "Ternion Dagger +1",
            augments = {'Path: A'}
        }
        -- sub = "Crepuscular Knife"
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
        -- sub = "Centovente"
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
        sub = {
            name = "Ternion Dagger +1",
            augments = {'Path: A'}
        }
        -- sub = "Crepuscular Knife"
    }

    sets.Weapons.Songs = {
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
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

    sets.Weapons.Songs.Precast = {}
	sets.Weapons.Songs.Midcast = {}

    -- Instruments to use
    Instrument = {}
    Instrument.Count = {
        name = "Daurdabla"
    }
    Instrument.Potency = {
        name = "Gjallarhorn"
    }
    Instrument.Aria = {
        name ="Loughnashade",
    }
    Instrument.Honor = {
        name = "Marsyas"
    }
    Instrument.AOE_Sleep = {
        name = "Daurdabla"
    }
    Instrument.Ballad = {
        name = "Miracle Cheer"
    }
    -- Instrument.Pianissimo = { 
        -- name="Miracle Cheer" } -- Possible swap to Miracle Cheer

    -- Instrument.Idle = {
    --     name = "Linos",
    --     augments = {'Mag. Evasion+15', 'Phys. dmg. taken -4%', 'HP+20'}
    -- }
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
        -- range = Instrument.Idle, -- 4/0
        head="Fili Calot +3",
        body="Ashera Harness",
        hands = "Fili Manchettes +3",
        feet="Brioso Slippers +3",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Regal Earring",
        right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.Idle.TP = {}

    sets.Idle.DT = {}

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
        right_ring = "Purity Ring",
        waist = "Gishdubar Sash"
    }

    sets.PhantomRoll = {}

    sets.OffenseMode = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Ashera Harness",
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
        right_ear = "Dedition Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = {
            name = "Intarabus's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Base TP set to build off
    sets.OffenseMode.TP = {
        main = "Naegling",
        sub = {
            name = "Centovente",
            augments = {'TP Bonus +1000'}
        },
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Ashera Harness",
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
        right_ear = "Dedition Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
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
        head="Bunzi's Hat", -- 10
        body = "Inyanga Jubbah +2", -- 14
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
        legs = "Aya. Cosciales +2", -- 6
        feet = "Fili Cothurnes +3", -- 10
        neck = "Baetyl Pendant", -- 4
        waist = "Embla Sash", -- 5
        right_ear = "Loquacious Earring", -- 2
        left_ear = "Enchanter's Earring +1", -- 2
        left_ring = "Rahab Ring", -- 2
        right_ring = "Kishar ring", -- 4
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10'}
        } -- 10
    } -- 77 FC

    -- Used for Songs (now easy to max Fast Cast so not needed)
    sets.Precast.Songs = sets.Precast.FastCast

    -- Used for "-Cure casting time"
    sets.Precast.Cure = {}

    -- Used for Raises and Cure spells
    sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
        -- range = Instrument.QuickMagic, -- 4
        -- waist = "Witful Belt", -- 3
        waist = "Perimede Cape", -- 4
        right_ring = "Lebeche Ring" -- 3
    }) -- 10% Quick Magic

    -- Default song duration / strength
    sets.Midcast = set_combine(sets.Idle, {
        head="Fili Calot +3",
        body = "Fili Hongreline +3",
        hands = "Fili Manchettes +3",
        legs = "Inyanga Shalwar +2",
        feet = "Brioso Slippers +3",
        neck = "Moonbow Whistle +1",
        waist="Plat. Mog. Belt",
        left_ear="Regal Earring",
        right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10'}
        }
    })

    -- Reduce Durations for Dummy songs (Ballad is lowest duration)
    sets.Midcast.DummySongs = set_combine(sets.Midcast, {
        feet = "Bunzi's Sabots"
    })

    -- Cure Set
    sets.Midcast.Cure = {
        main = "Daybreak",
        sub = "Genmei Shield",
        ammo = "Pemphredo Tathlum",
        head = {
            name = "Vanya Hood",
            augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}
        },
        body = {
            name = "Vanya Robe",
            augments = {'Healing magic skill +20', '"Cure" spellcasting time -7%', 'Magic dmg. taken -3'}
        },
        hands = "Inyan. Dastanas +2",
        legs = "Doyen Pants",
        feet = {
            name = "Vanya Clogs",
            augments = {'Healing magic skill +20', '"Cure" spellcasting time -7%', 'Magic dmg. taken -3'}
        },
        neck = "Nodens Gorget",
        waist = "Acerbic Sash +1",
        left_ear = "Mendi. Earring",
        right_ear = "Meili Earring",
        left_ring = "Menelaus's Ring",
        right_ring = "Lebeche Ring",
        back = "Solemnity Cape"
    }

    -- Base set for duration
    sets.Midcast.Enhancing = {
        -- main = "Carnwenhan",
        sub = "Ammurapi Shield",
        -- range = "Gjallarhorn",
        head = {
            name = "Telchine Cap",
            augments = {'Song spellcasting time -5%', 'Enh. Mag. eff. dur. +9'}
        },
        body = {
            name = "Telchine Chas.",
            augments = {'"Fast Cast"+4', 'Enh. Mag. eff. dur. +8'}
        },
        hands = {
            name = "Telchine Gloves",
            augments = {'Enh. Mag. eff. dur. +9'}
        },
        legs = {
            name = "Telchine Braconi",
            augments = {'"Conserve MP"+4', 'Enh. Mag. eff. dur. +10'}
        },
        feet = {
            name = "Telchine Pigaches",
            augments = {'Enh. Mag. eff. dur. +9'}
        },
        neck = "Incanter's Torque",
        ear1 = "Magnetic Earring",
        ear2 = "Andoaa Earring",
        ring1 = {
            name = "Stikini Ring +1",
            bag = "wardrobe"
        },
        ring2 = {
            name = "Stikini Ring +1",
            bag = "wardrobe4"
        },
        back = "Fi Follet Cape +1",
        waist = "Embla Sash"
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
        main = {
            name = "Carnwenhan",
            augments = {'Path: A'}
        }, 
        sub = "Ammurapi Shield",
        -- range = Instrument.Potency,
        head = "Brioso Roundlet +3",
        body = "Fili Hongreline +3",
        hands = "Fili Manchettes +3",
        legs = "Fili Rhingrave +2",
        feet = "Brioso Slippers +3",
        neck = "Null Loop",
        waist = {
            name = "Acuity Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Regal Earring",
        right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = {
            name = "Stikini Ring +1",
            bag = "wardrobe3"
        },
        back = {
            name = "Intarabus's Cape",
            augments = {'CHR+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}},
        }

    -- Max duration
    sets.Midcast.Lullaby = set_combine(sets.Midcast.Enfeebling, {
        range = Instrument.Honor,
        body = "Fili Hongreline +3",
        hands = "Brioso Cuffs +3",
        legs = "Inyanga Shalwar +2"
    })
    sets.Midcast.Finale = {}
    sets.Midcast.Requiem = {}
    sets.Midcast.Elegy = {}
    sets.Midcast.Prelude = {}
    sets.Midcast.Madrigal = {
        head = "Fili Calot +3"
    }
    sets.Midcast.Minuet = {
        body = "Fili Hongreline +3"
    }
    sets.Midcast.March = {
        hands = "Fili Manchettes +3"
    }
    sets.Midcast.Ballad = {
        range = Instrument.Ballad,
        legs = "Inyanga Shalwar +2",
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
    -- sets.midcast.AriaOfPassion = {
    --     Range = "Loughnashade",
    --     hands = "Fili Manchettes +3"
    -- }
    -- Job Abilities
    sets.JA = {}
    sets.JA["Box Step"] = {}
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
    sets.Samba = set_combine(sets.Idle.DT, {})

    -- Default WS set base
    sets.WS = {
        range = {
            name = "Linos",
            augments = {'Accuracy+13', 'Weapon skill damage +3%', 'STR+8'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Bihu Jstcorps. +3",
            augments = {'Enhances "Troubadour" effect'}
        },
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
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
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
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
        back={ name="Intarabus's Cape", 
                augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.WS.MAB = set_combine(sets.WS, {
        ammo = "Pemphredo Tathlum",
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
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Freke Ring",
        right_ring = "Cornelia's Ring",
        back = "Toro Cape"
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
        right_ring = "Sroda Ring",
        back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.WS["Mordant Rime"] = set_combine(sets.WS, {
         range = {
            name = "Linos",
            augments = {'Accuracy+13', 'Weapon skill damage +3%', 'STR+8'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Bihu Jstcorps. +3",
            augments = {'Enhances "Troubadour" effect'}
        },
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
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
        left_ear = "Ishvara Earring",
        right_ear = "Regal Earring",
        right_ring = "Cornelia's Ring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        back={ 
            name="Intarabus's Cape", 
            augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%','Damage taken-5%',}},
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
