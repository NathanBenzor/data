-- Relyk
-- Load and initialize the include file.
include('Gunbound-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "1"
MacroBook = "1" -- Sub Job macro pallets can be defined in the sub_job_change_custom function below
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
Organizer = false

-- Add CRIT the base modes to allow AM3 Critical Builds
state.OffenseMode:options('TP', 'ACC', 'DT', 'PDL', 'CRIT')
state.OffenseMode:set('TP')

-- Modes for specific to Corsair
state.WeaponMode:options('Fomalhaut', 'Death Penalty', 'Savage Blade', 'Onion Sword III', 'Aeolian Edge', 'Dynamis',
    'Trials', 'DI')
state.WeaponMode:set('Savage Blade')

-- Enable JobMode for UI.
UI_Name = 'TP Mode'

-- Melee or Ranged Mode
state.JobMode:options('Standard', 'Melee', 'Ranged')
state.JobMode:set('Standard')

elemental_ws = S {'Aeolian Edge', 'Leaden Salute', 'Wildfire', 'Earth Shot', 'Ice Shot', 'Water Shot', 'Fire Shot',
                  'Wind Shot', 'Thunder Shot'}

-- load addons
-- send_command('lua l autocor')

-- Initialize Player
jobsetup(LockStylePallet, MacroBook, MacroSet)

-- Threshold for Ammunition Warning
Ammo_Warning_Limit = 99

function get_sets()
    define_roll_values()
    -- Set the weapon options.  This is set below in job customization section

    -- Weapon setup
    sets.Weapons = {}

    sets.Weapons['Savage Blade'] = {
        main = "Naegling",
        -- sub = {
        --     name = "Gleti's Knife",
        --     augments = {'Path: A'}
        -- },

        sub = "Tauret",
        range = {
            name = "Anarchy +3",
            augments = {'Delay:+60', 'TP Bonus +1000'}
        }
    }

    sets.Weapons['Onion Sword III'] = {
        main = "Onion Sword III",
        sub = "Kaja Knife",
        range = {
            name = "Anarchy +3",
            augments = {'Delay:+60', 'TP Bonus +1000'}
        }
    }

    sets.Weapons['Fomalhaut'] = {
        main = {
            name = "Rostam",
            augments = {'Path: C'}
        },
        -- sub={ name="Rostam", augments={'Path: C'}, bag="Wardrobe 2"},
        range = {
            name = "Fomalhaut",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Death Penalty'] = {
        -- main = {
        --     name = "Rostam",
        --     augments = {'Path: C'}
        -- },
        main = "Naegling",
        sub = "Tauret",
        range = "Fomalhaut"
    }

    sets.Weapons['Aeolian Edge'] = {
        ammo = Ammo.Bullet.MAG_WS,
        main = "Tauret",
        sub = "Naegling",
        range = {
            name = "Anarchy +3",
            augments = {'Delay:+60', 'TP Bonus +1000'}
        }
    }

    sets.Weapons.Melee = {
        sub = "Gleti's Knife",
        range = "Ataktos"
    }

    sets.Weapons.Ranged = {
        sub = {
            name = "Kustawi +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons.Shield = {
        sub = "Nusku Shield"
    }

    sets.Weapons.Sleep = {
        range = "Earp"
    }

    sets.Weapons.Dynamis = {
        main = {
            name = "Rostam",
            augments = {'Path: C'}
        },
        sub = "Tauret",

        -- range = {
        --     name = "Anarchy +3",
        --     augments = {'Delay:+60', 'TP Bonus +1000'}
        -- }
        range = "Fomalhaut"
    }

    sets.Weapons['Trials'] = {
        main = {
            name = "Rostam",
            augments = {'Path: C'}
        },
        sub = "Tauret",
        range = "Quicksilver",
        ammo = "Chrono Bullet"
    }

    sets.Weapons['DI'] = {
        main = "Voluspa Knife",
        sub = "Tauret"
    }
    -- Ammo Selection
    Ammo.Bullet.RA = "Chrono Bullet" -- TP Ammo
    Ammo.Bullet.WS = "Chrono Bullet" -- Physical Weaponskills
    -- Ammo.Bullet.RA = "Decimating Bullet" -- TP Ammo
    -- Ammo.Bullet.WS = "Decimating Bullet" -- Physical Weaponskills
    Ammo.Bullet.CRIT = "Chrono Bullet" -- Critical Hit Mode
    Ammo.Bullet.PDL = "Chrono Bullet" -- Physical Damage Mode
    Ammo.Bullet.SB = "Chrono Bullet" -- Subtle Blow Mode
    Ammo.Bullet.MAB = "Living Bullet" -- Magical Weaponskills
    Ammo.Bullet.MACC = "Chrono Bullet" -- Magic Accuracy
    Ammo.Bullet.QD = "Hauksbok Bullet" -- Quick Draw
    Ammo.Bullet.MAG_WS = "Living Bullet" -- Magic Weapon Skills

    -- Standard Idle set with -DT,Refresh,Regen with NO movement gear
    sets.Idle = {
        ammo = Ammo.Bullet.RA,
        head = "Nyame Helm",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        -- neck = {
        --     name = "Comm. Charm +1",
        --     augments = {'Path: A'}
        -- },
        neck = "Loricate Torque +1",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Odnowa Earring +1",
        right_ear = "Eabani Earring",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Damage taken-5%'}
        }
    }

    sets.Movement = {
        left_ring = "Shneddick Ring"
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

    sets.OffenseMode = {
        ammo = Ammo.Bullet.RA,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        -- legs = {
        --     name = "Samnuha Tights",
        --     augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        -- },
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Iskur Gorget",
        -- neck = {
        --     name = "Comm. Charm +1",
        --     augments = {'Path: A'}
        -- },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Telos Earring",
        right_ear = "Crep. Earring",
        left_ring = "Lehko's Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Base TP set to build off when melee'n
    sets.OffenseMode.TP = {
        ammo = Ammo.Bullet.RA,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        -- legs = {
        --     name = "Samnuha Tights",
        --     augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        -- },
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        -- neck = {
        --     name = "Comm. Charm +1",
        --     augments = {'Path: A'}
        -- },
        neck = "Iskur Gorget",
        waist = "Sailfi Belt +1",
        -- left_ear = "Telos Earring",
        left_ear = "Cessance Earring",
        right_ear = "Dedition Earring",
        -- right_ring = "Chirich Ring +1",
        left_ring = "Petrov Ring",
        -- right_ring = "Ilabrat Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    -- This set is used when OffenseMode is DT and Enaged
    sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
        legs = "Chas. Culottes +3"
    })

    -- This set is used when OffenseMode is PDL and Enaged
    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {
        legs = "Malignance Tights"
    })

    -- This set is used when OffenseMode is CRIT and Enaged
    sets.OffenseMode.CRIT = set_combine(sets.OffenseMode.TP, {})

    -- The following sets augment the base TP set above for Dual Wielding
    sets.DualWield = {
        waist = "Reiki Yotai",
        right_ear = "Eabani Earring"
    }

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = {}

    sets.Precast = {}
    -- 70 snapshot is Cap.  Need 60 due to 10 from gifts
    -- Snapshot / Rapidshot
    -- Rapid shot is like quick magic
    -- Snapshot is like Fast Cast
    -- Flurry is 15% Snapshot
    -- Flurry II 30% Snapshot

    -- No flurry - 60 Snapshot needed
    sets.Precast.RA = {
        ammo = Ammo.Bullet.RA,
        head = "Chass. Tricorne +#", -- 0/14
        body = "Oshosi Vest", -- 12/0
        -- hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, -- 8/11
        hands = {
            name = "Lanun Gants +2",
            augments = {'Enhances "Fold" effect'}
        },
        -- legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, -- 10/13
        legs = "Ikenga's Trousers",
        feet = "Meg. Jam. +2", -- 10/0
        left_ear = {
            name = "Tuisto Earring",
            priority = 2
        },
        right_ear = {
            name = "Etiolation Earring",
            priority = 1
        },
        left_ring = "Dingir Ring",
        right_ring = "Defending Ring", -- 3/0
        neck = {
            name = "Comm. Charm +1",
            augments = {'Path: A'}
        }, -- 4/0
        waist = "Yemaya Belt", -- 0/5
        back = {
            name = "Camulus's Mantle",
            augments = {'HP+60', '"Snapshot"+10'}
        }
    } -- Totals 59/43

    -- Flurry - 45 Snapshot Needed
    sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {
        body = "Laksa. Frac +3" -- 0/20
    }) -- Totals 45/63

    -- Flurry II - 30 Snapshot Needed
    sets.Precast.RA.Flurry_II = set_combine(sets.Precast.RA.Flurry, {
        feet = {
            name = "Pursuer's Gaiters",
            augments = {'Rng.Acc.+10', '"Rapid Shot"+10', '"Recycle"+15'}
        } -- 0/10
    }) -- Totals 35/73

    sets.Precast.RA.ACC = {}

    -- Fast Cast for Magic
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
        }, -- 7  Need to update
        legs = {
            name = "Herculean Trousers",
            augments = {'Mag. Acc.+7', '"Fast Cast"+6'}
        }, -- 6
        feet = {
            name = "Carmine Greaves +1",
            augments = {'HP+80', 'MP+80', 'Phys. dmg. taken -4'}
        }, -- 8
        neck = "Voltsurge Torque", -- 4
        waist = "Eschan Stone",
        left_ear = "Loquac. Earring", -- 2
        right_ear = "Etiolation Earring", -- 1
        left_ring = "Lebeche Ring",
        right_ring = "Kishar Ring", -- 4
        back = {
            name = "Camulus's Mantle",
            augments = {'HP+60', 'HP+20', '"Fast Cast"+10'}
        } -- 10
    } -- 65 FC

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    -- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = {
        ammo = Ammo.Bullet.RA,
        -- head="Ikenga's Hat",
        -- body="Ikenga's Vest",
        -- hands="Ikenga's Gloves",
        -- legs="Chas. Culottes +3",
        -- feet="Ikenga's Clogs",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Chas. Culottes +2",
        feet = "Malignance Boots",
        -- neck = {
        --     name = "Comm. Charm +2",
        --     augments = {'Path: A'}
        -- },
        neck = "Iskur Gorget",
        waist = "Yemaya Belt",
        left_ear = "Telos Earring",
        right_ear = "Enervating Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Dingir Ring",
        -- right_ring="Crepuscular Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    }

    -- Ranged Attack Gear (Triple Shot Midshot)
    sets.Midcast.RA.TripleShot = set_combine(sets.Midcast.RA, {
        head = "Oshosi Mask +1", -- Missing
        body = "Chasseur's Frac +2", -- 14
        hands = "Lanun Gants +2", -- Tripple shot becomes Quad shot
        legs = "Osh. Trousers +1", -- Missing
        feet = "Osh. Leggings +1" -- 3
    }) -- 28

    -- Ranged PDL
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {
        left_ring = "Sroda Ring"
    })

    -- Ranged CRIT
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {
        head = "Meghanada Visor +2",
        body = "Nisroch Jerkin",
        feet = "Osh. Leggings +1",
        waist = "K. Kachina Belt +1",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        }
    })

    sets.Utsusemi = set_combine(sets.Idle, {})

    -- Quick Draw Gear Sets
    sets.QuickDraw = {}

    sets.QuickDraw.ACC = {
        ammo = Ammo.Bullet.QD,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = {
            name = "Comm. Charm +2",
            augments = {'Path: A'}
        },
        waist = "Eschan Stone",
        left_ear = "Hermetic Earring",
        right_ear = "Crep. Earring",
        left_ring = "Kishar Ring",
        right_ring = "Crepuscular Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.QuickDraw.DMG = {
        ammo = Ammo.Bullet.QD,
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Lanun Frac +2",
            augments = {'Enhances "Loaded Deck" effect'}
        },
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Chass. Bottes +2",
        neck = {
            name = "Comm. Charm +2",
            augments = {'Path: A'}
        },
        waist = "Orpheus's Sash",
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Dingir Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.QuickDraw.STP = {
        ammo = Ammo.Bullet.QD,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Chas. Culottes +3",
        feet = "Malignance Boots",
        neck = "Iskur Gorget",
        waist = "Yemaya Belt",
        left_ear = "Telos Earring",
        right_ear = "Crep. Earring",
        left_ring = "Crepuscular Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Quick Draw 
    sets.QuickDraw["Fire Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Ice Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Wind Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Earth Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Thunder Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Water Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Light Shot"] = set_combine(sets.QuickDraw.DMG, {})
    sets.QuickDraw["Dark Shot"] = set_combine(sets.QuickDraw.DMG, {
        right_ring = "Archon Ring",
        head = "Pixie Hairpin +1"
    })

    -- Job Abilities
    sets.JA = {}
    sets.JA["Wild Card"] = {
        feet = {
            name = "Lanun Bottes +3",
            augments = {'Enhances "Wild Card" effect'}
        }
    }
    sets.JA["Phantom Roll"] = {
        range = "Compensator",
        ammo = "Decimating Bullet",
        head = {
            name = "Lanun Tricorne +3",
            augments = {'Enhances "Winning Streak" effect'}
        },
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = {
            name = "Comm. Charm +1",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = "Odnowa Earring +1",
        right_ear = "Ishvara Earring",
        left_ring = "Luzaf's Ring",
        right_ring = "Barataria Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Damage taken-5%'}
        }
    }
    sets.JA["Random Deal"] = {
        body = {
            name = "Lanun Frac +2",
            augments = {'Enhances "Loaded Deck" effect'}
        }
    }
    sets.JA["Snake Eye"] = {
        legs = {
            name = "Lanun Trews +2",
            augments = {'Enhances "Snake Eye" effect'}
        }
    }
    sets.JA["Fold"] = {} -- Use gloves for bust
    sets.JA["Triple Shot"] = {} -- Gear to be worn during Midshot
    sets.JA["Cutting Cards"] = {}
    sets.JA["Crooked Cards"] = {}
    sets.JA["Double-Up"] = {
        right_ring = "Luzaf's Ring" -- 16 yalm range
    }

    -- Dancer JA Section

    sets.Flourish = set_combine(sets.Idle.DT, {})

    sets.Jig = set_combine(sets.Idle.DT, {})

    sets.Step = set_combine(sets.OffenseMode.DT, {})

    sets.Samba = set_combine(sets.Idle.DT, {})

    sets.Waltz = set_combine(sets.OffenseMode.DT, {
        ammo = "Yamarang", -- 5
        -- body={ name="Gleti's Cuirass", augments={'Path: A',}}, -- 10
        hands = "Slither Gloves +1", -- 5
        legs = "Dashing Subligar" -- 10
    }) -- 30% Potency

    -- Base Set used for all rolls
    sets.PhantomRoll = set_combine(sets.Idle, {
        main = {
            name = "Rostam",
            augments = {'Path: C'}
        },
        -- sub={ name="Nusku Shield", priority=2},
        range = "Compensator", -- 20 sec Duration
        head = {
            name = "Lanun Tricorne +3",
            augments = {'Enhances "Winning Streak" effect'}
        }, -- 50% Job ability Bonus
        hands = "Chasseur's Gants +3", -- 60 sec Duration
        neck = "Regal Necklace", -- 20 sec Duration
        left_ring = "Barataria Ring", -- 20 sec Duration
        right_ring = "Luzaf's Ring", -- 16 yalm range
        back = "Camulus's Mantle"
    })

    sets.PhantomRoll['Fighter\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Monk\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Healer\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Wizard\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Warlock\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Rogue\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Gallant\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Chaos Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Beast Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Choral Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Hunter\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Samurai Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Ninja Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Drachen Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Evoker\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Magus\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Corsair\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Puppet Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Dancer\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Scholar\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Bolter\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll["Caster\'s Roll"] = set_combine(sets.PhantomRoll, {
        legs = "Chas. Culottes +2"
    })
    sets.PhantomRoll["Tactician\'s Roll"] = set_combine(sets.PhantomRoll, {
        body = "Chasseur's Frac +2"
    })
    sets.PhantomRoll["Allies\' Roll"] = set_combine(sets.PhantomRoll, {
        hands = "Chasseur's Gants +3"
    })
    sets.PhantomRoll['Miser\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Companion\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Avenger\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll['Naturalist\'s Roll'] = sets.PhantomRoll
    sets.PhantomRoll["Courser\'s Roll"] = set_combine(sets.PhantomRoll, {
        feet = "Chass. Bottes +2"
    })
    sets.PhantomRoll["Blitzer\'s Roll"] = set_combine(sets.PhantomRoll, {
        head = "Chass. Tricorne +3"
    })

    -- Melee Base set
    sets.WS = {
        -- ammo = Ammo.Bullet.WS,
        -- head = {
        --     name = "Nyame Helm",
        --     augments = {'Path: B'}
        -- },
        -- body = {
        --     name = "Nyame Mail",
        --     augments = {'Path: B'}
        -- },
        -- hands = {
        --     name = "Nyame Gauntlets",
        --     augments = {'Path: B'}
        -- },
        -- legs = {
        --     name = "Nyame Flanchard",
        --     augments = {'Path: B'}
        -- },
        -- feet = {
        --     name = "Nyame Sollerets",
        --     augments = {'Path: B'}
        -- },
        -- neck = {
        --     name = "Comm. Charm +2",
        --     augments = {'Path: A'}
        -- },
        -- waist = {
        --     name = "Sailfi Belt +1",
        --     augments = {'Path: A'}
        -- },
        -- left_ear = {
        --     name = "Moonshade Earring",
        --     augments = {'Accuracy+4', 'TP Bonus +250'}
        -- },
        -- right_ear = "Ishvara Earring",
        -- left_ring = "Regal Ring",
        -- right_ring = "Cornelia's Ring",
        -- back = {
        --     name = "Camulus's Mantle",
        --     augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+7', 'Weapon skill damage +10%', 'Damage taken-5%'}
        -- }
        ammo = Ammo.Bullet.WS,
        head = {
            name = "Herculean Helm",
            augments = {'Accuracy+15', 'Weapon skill damage +5%', 'Attack+4'}
        },
        body = "Laksa. Frac +3",
        hands = "Chasseur's Gants +3",
        legs = {
            name = "Herculean Trousers",
            augments = {'Weapon skill damage +5%', 'Accuracy+3'}
        },
        feet = {
            name = "Lanun Bottes +3",
            augments = {'Enhances "Wild Card" effect'}
        },
        -- neck = {
        --     name = "Comm. Charm +1",
        --     augments = {'Path: A'}
        -- },
        neck = "Iskur Gorget",
        waist = "Sailfi Belt +1",
        left_ear = "Odnowa Earring +1",
        right_ear = "Ishvara Earring",
        left_ring = "Petrov Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- Ranged Base Set
    sets.WS.RA = set_combine(sets.WS, {
        body = "Laksa. Frac +3",
        hands = "Chasseur's Gants +3",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Accuracy set used in OffenseMode.ACC
    sets.WS.ACC = set_combine(sets.WS, {})
    sets.WS.ACC.RA = set_combine(sets.WS.RA, {})

    -- Equipment to augment the Melee WS for Physical Damage Limit (Capped Attack)
    sets.WS.PDL = set_combine(sets.WS, {
        left_ring = "Sroda Ring"
    })
    sets.WS.PDL.RA = set_combine(sets.WS.RA, {
        left_ring = "Sroda Ring",
        head = "Ikenga's Hat",
        legs = "Ikenga's Trousers",
        feet = "Ikenga's Clogs"
    })

    -- Critical Hit set used in OffenseMode.SB
    sets.WS.CRIT = set_combine(sets.WS, {})
    sets.WS.CRIT.RA = set_combine(sets.WS.RA, {})

    sets.WS.MAB = set_combine(sets.WS, {
        -- ammo=Ammo.Bullet.MAB,
        feet = {
            name = "Lanun Bottes +3",
            augments = {'Enhances "Wild Card" effect'}
        },
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Crematio Earring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS.MACC = set_combine(sets.WS.MAB, {})

    sets.WS.WSD = set_combine(sets.WS, {})

    sets.WS["Wildfire"] = set_combine(sets.WS.MAB, {})

    sets.WS["Leaden Salute"] = set_combine(sets.WS.MAB, {
        head = "Pixie Hairpin +1",
        body = {
            name = "Lanun Frac +3",
            augments = {'Enhances "Loaded Deck" effect'}
        },
        hands = "Chasseur's Gants +3",
        legs = {
            name = "Herculean Trousers",
            augments = {'Weapon skill damage +5%', 'Accuracy+3'}
        },
        feet = {
            name = "Lanun Bottes +3",
            augments = {'Enhances "Wild Card" effect'}
        },
        neck = {
            name = "Comm. Charm +1",
            augments = {'Path: A'}
        },
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Hermetic Earring",
        left_ring = "Archon Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
        -- waist="Svelt. Gouriz +1",   -- Changes based off elemental function
    })

    sets.WS['Aeolian Edge'] = set_combine(sets.WS.MAB, {
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        }
    })

    sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {
        left_ring = "Sroda Ring",
        neck = "Rep. Plat. Medal"
    })

    sets.WS["Last Stand"] = set_combine(sets.WS.WSD, sets.WS.RA, {
        -- neck={ name="Comm. Charm +2", augments={'Path: A',}},
        -- waist="Fotia Belt",
        head = {
            name = "Lanun Tricorne +3",
            augments = {'Enhances "Winning Streak" effect'}
        },
        body = "Ikenga's Vest",
        hands = "Chasseur's Gants +3",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        -- feet = "Meg. Jam. +2",
        feet = "Lanun Bottes +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Ishvara Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Dingir Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'AGI+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- Uses Default WS set
    sets.WS["Hot Shot"] = set_combine(sets.WS, {})
    sets.WS["Split Shot"] = set_combine(sets.WS, {})
    sets.WS["Sniper Shot"] = set_combine(sets.WS, {})
    sets.WS["Slug Shot"] = set_combine(sets.WS, {})
    sets.WS["Numbing Shot"] = set_combine(sets.WS, {})
    sets.WS["Fast Blade"] = set_combine(sets.WS, {})
    sets.WS["Burning Blade"] = set_combine(sets.WS, {})
    sets.WS["Flat Blade"] = set_combine(sets.WS, {})
    sets.WS["Shining Blade"] = set_combine(sets.WS, {})
    sets.WS["Circle Blade"] = set_combine(sets.WS, {})
    sets.WS["Spirits Within"] = set_combine(sets.WS, {})
    sets.WS["Requiescat"] = set_combine(sets.WS, {})

    sets.WS["Fast Blade II"] = set_combine(sets.WS, {})

    sets.TreasureHunter = {
        waist = "Chaac Belt"
    }
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

function define_roll_values()
    rolls = {
        ["Corsair's Roll"] = {
            lucky = 5,
            unlucky = 9,
            bonus = "Experience Points"
        },
        ["Ninja Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Evasion"
        },
        ["Hunter's Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Accuracy"
        },
        ["Chaos Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Attack"
        },
        ["Magus's Roll"] = {
            lucky = 2,
            unlucky = 6,
            bonus = "Magic Defense"
        },
        ["Healer's Roll"] = {
            lucky = 3,
            unlucky = 7,
            bonus = "Cure Potency Received"
        },
        ["Drachen Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Pet Magic Accuracy/Attack"
        },
        ["Choral Roll"] = {
            lucky = 2,
            unlucky = 6,
            bonus = "Spell Interruption Rate"
        },
        ["Monk's Roll"] = {
            lucky = 3,
            unlucky = 7,
            bonus = "Subtle Blow"
        },
        ["Beast Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Pet Attack"
        },
        ["Samurai Roll"] = {
            lucky = 2,
            unlucky = 6,
            bonus = "Store TP"
        },
        ["Evoker's Roll"] = {
            lucky = 5,
            unlucky = 9,
            bonus = "Refresh"
        },
        ["Rogue's Roll"] = {
            lucky = 5,
            unlucky = 9,
            bonus = "Critical Hit Rate"
        },
        ["Warlock's Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Magic Accuracy"
        },
        ["Fighter's Roll"] = {
            lucky = 5,
            unlucky = 9,
            bonus = "Double Attack Rate"
        },
        ["Puppet Roll"] = {
            lucky = 3,
            unlucky = 7,
            bonus = "Pet Magic Attack/Accuracy"
        },
        ["Gallant's Roll"] = {
            lucky = 3,
            unlucky = 7,
            bonus = "Defense"
        },
        ["Wizard's Roll"] = {
            lucky = 5,
            unlucky = 9,
            bonus = "Magic Attack"
        },
        ["Dancer's Roll"] = {
            lucky = 3,
            unlucky = 7,
            bonus = "Regen"
        },
        ["Scholar's Roll"] = {
            lucky = 2,
            unlucky = 6,
            bonus = "Conserve MP"
        },
        ["Naturalist's Roll"] = {
            lucky = 3,
            unlucky = 7,
            bonus = "Enh. Magic Duration"
        },
        ["Runeist's Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Magic Evasion"
        },
        ["Bolter's Roll"] = {
            lucky = 3,
            unlucky = 9,
            bonus = "Movement Speed"
        },
        ["Caster's Roll"] = {
            lucky = 2,
            unlucky = 7,
            bonus = "Fast Cast"
        },
        ["Courser's Roll"] = {
            lucky = 3,
            unlucky = 9,
            bonus = "Snapshot"
        },
        ["Blitzer's Roll"] = {
            lucky = 4,
            unlucky = 9,
            bonus = "Attack Delay"
        },
        ["Tactician's Roll"] = {
            lucky = 5,
            unlucky = 8,
            bonus = "Regain"
        },
        ["Allies' Roll"] = {
            lucky = 3,
            unlucky = 10,
            bonus = "Skillchain Damage"
        },
        ["Miser's Roll"] = {
            lucky = 5,
            unlucky = 7,
            bonus = "Save TP"
        },
        ["Companion's Roll"] = {
            lucky = 2,
            unlucky = 10,
            bonus = "Pet Regain and Regen"
        },
        ["Avenger's Roll"] = {
            lucky = 4,
            unlucky = 8,
            bonus = "Counter Rate"
        }
    }
end

function display_roll_info(spell)
    local rollinfo = rolls[spell.english] -- Get the roll information from the rolls table
    if rollinfo then
        add_to_chat(001,
            string.char(129, 115) .. '  ' .. string.char(31, 210) .. spell.english .. string.char(31, 001) .. ' : ' ..
                rollinfo.bonus .. ' ' .. string.char(129, 116) .. ' ' .. string.char(129, 195) .. '  Lucky: ' ..
                string.char(31, 204) .. tostring(rollinfo.lucky) .. string.char(31, 001) .. ' /' .. ' Unlucky: ' ..
                string.char(31, 167) .. tostring(rollinfo.unlucky) .. string.char(31, 002) .. '  ')
    end
end

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
    -- Check if the spell is a Corsair Roll
    -- if spell.type == 'CorsairRoll' then
    --     add_to_chat(123, "Test: You used " .. spell.english)
    -- end
    if spell.english == 'Fold' then
        equipSet = set_combine(equipSet, {
            hands = {
                name = "Lanun Gants +2",
                augments = {'Enhances "Fold" effect'}
            }
        })
    end
    if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
        equipSet = set_combine(equipSet, sets.PhantomRoll)
    end
    equipSet = Job_Mode_Check(equipSet)
    return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
    equipSet = {}
    if spell.english == 'Fold' then
        equipSet = set_combine(equipSet, {
            hands = {
                name = "Lanun Gants +2",
                augments = {'Enhances "Fold" effect'}
            }
        })
    end
    if spell.id == 123 or spell.type == 'CorsairRoll' then -- Double up and bypass weapon check
        equipSet = set_combine(equipSet, sets.PhantomRoll)
    end
    equipSet = Job_Mode_Check(equipSet)
    return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
    equipSet = {}
    if state.JobMode.value == 'Ranged' and player.status == "Engaged" then
        equipSet = set_combine(equipSet, sets.OffenseMode.Ranged)
    end
    equipSet = Job_Mode_Check(equipSet)
    if spell.type == 'CorsairRoll' and not spell.interrupted then
        display_roll_info(spell)
    end
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
end

function user_file_unload()
    -- send_command('lua u autocor')
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
    return buff
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
