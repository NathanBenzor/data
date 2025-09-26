-- Yavanna
-- Load and initialize the include file.
include('Daiitoku-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "3"
MacroBook = "3"
MacroSet = "1"

-- Uses Items Automatically
AutoItem = false

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- Lockstyle sets to randomly equip
Lockstyle_List = {1, 2, 6, 12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

-- Set default mode (TP,ACC,DT)
state.OffenseMode:options('TP', 'ACC', 'DT', 'PDL', 'SB', 'Enspell')
state.OffenseMode:set('DT')

-- Command to Lock Style and Set the correct macros
jobsetup(LockStylePallet, MacroBook, MacroSet)

-- Modes for TP
state.WeaponMode:options('Seraph Blade', 'Sanguine Blade', 'Chant du Cygne', 'Savage Blade', 'Eviceration',
    'Aeolian Edge', 'Black Halo', 'Ullr', 'Unlocked')
state.WeaponMode:set('Black Halo')

-- Goal 2100 hp and 1300 MP
function get_sets()

    -- ===================================================================================================================
    --		sets.Weapons
    -- ===================================================================================================================

    -- Set the weapon options.  This is set below in job customization section
    sets.Weapons = {}

    sets.Weapons['Seraph Blade'] = {
        main = {
            name = "Crocea Mors",
            augments = {'Path: C'}
        },
        sub = "Daybreak"
    }

    sets.Weapons['Sanguine Blade'] = {
        main = {
            name = "Crocea Mors",
            augments = {'Path: C'}
        },
        sub = {
            name = "Demers. Degen +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Chant du Cygne'] = {
        main = {
            name = "Crocea Mors",
            augments = {'Path: C'}
        },
        sub = {
            name = "Demers. Degen +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Savage Blade'] = {
        main = "Naegling",
        -- sub = {
        --     name = "Demers. Degen +1",
        --     augments = {'Path: A'}
        -- }
        sub = "Machaera +2"
    }

    sets.Weapons['Eviceration'] = {
        main = "Tauret",
        sub = {
            name = "Demers. Degen +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Aeolian Edge'] = {
        main = "Tauret",
        sub = {
            name = "Demers. Degen +1",
            augments = {'Path: A'}
        }
    }

    sets.Weapons['Black Halo'] = {
        main="Kaja Rod",
        sub="Machaera +2",
    }

    sets.Weapons['Ullr'] = {
        range = "Ullr",
        ammo = "Beryllium Arrow"
    }

    sets.Weapons['Unlocked'] = {
        main = {
            name = "Crocea Mors",
            augments = {'Path: C'}
        },
        sub = {
            name = "Demers. Degen +1",
            augments = {'Path: A'}
        }
    }

    -- Shield used when melee and not dual wield.
    sets.Weapons.Shield = {
        sub = "Sacro Bulwark"
    }

    sets.Weapons.Sleep = {
        sub = "Caliburnus"
    }

    -- Default arrow to use
    Ammo.RA = "Beryllium Arrow"
    Ammo.ACC = "Beryllium Arrow"

    -- ===================================================================================================================
    --		sets.Idle
    -- ===================================================================================================================

    -- Standard Idle set with -DT,Refresh,Regen and movement gear
    sets.Idle = {
        ammo="Pemphredo Tathlum",
        head="Leth. Chappel +2",
        body = "Lethargy Sayon +3", -- 14/14  +4 Refresh
        hands="Leth. Ganth. +3", -- 11/11
        legs="Nyame Flanchard",
        feet="Malignance Boots",
        neck={ 
            name="Dls. Torque +2", 
            augments={'Path: A',}},
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ 
            name="Leth. Earring +1", 
            augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Murky Ring",
        right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}       
        
    --     ammo = "Staunch Tathlum +1", -- 3/3
    --     head = {
    --         name = "Viti. Chapeau +3",
    --         augments = {'Enfeebling Magic duration', 'Magic Accuracy'},
    --         priority = 3
    --     }, -- +3 Refresh
    --     body = "Lethargy Sayon +3", -- 14/14  +4 Refresh
    --     hands = "Leth. Ganth. +3", -- 11/11
    --     legs = "Bunzi's Pants", -- 9/9
    --     feet = {
    --         name = "Bunzi's Sabots",
    --         augments = {'Path: A'}
    --     }, -- 6/6
    --     neck = "Loricate Torque +1", -- 6/6
    --     waist = "Carrier's Sash",
    --     left_ear = {
    --         name = "Etiolation Earring",
    --         priority = 1
    --     }, -- Used to Keep HP/MP pool
    --     right_ear = {
    --         name = "Odnowa Earring +1",
    --         augments = {'Path: A'},
    --         priority = 2
    --     }, -- 3/5
    --     left_ring = {
    --         name = "Stikini Ring +1",
    --         bag = "wardrobe1"
    --     }, -- +1 Refresh
    --     right_ring = {
    --         name = "Stikini Ring +1",
    --         bag = "wardrobe2"
    --     }, -- +1 Refresh
    --     back = {
    --         name = "Sucellos's Cape",
    --         augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
    --     } -- 10/0
    -- }
    sets.Idle.TP = sets.Idle
    sets.Idle.ACC = sets.Idle
    sets.Idle.DT = sets.Idle
    sets.Idle.PDL = sets.Idle
    sets.Idle.SB = sets.Idle
    sets.Idle.MEVA = sets.Idle
    sets.Idle.Enspell = sets.Idle

    -- Set is only applied when sublimation is charging
    sets.Idle.Sublimation = set_combine(sets.Idle, {
        waist = "Embla Sash" -- +3 Submlimation when active
    })

    -- Gear to swap out for Movement
    sets.Movement = {
        left_ring = "Shneddick Ring"
    }

    -- Set to be used if you get 
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = {
            name = "Eshmun's Ring",
            bag = "wardrobe1",
            priority = 2
        },
        right_ring = {
            name = "Eshmun's Ring",
            bag = "wardrobe2",
            priority = 1
        },
        waist = "Gishdubar Sash"
    }

    -- ===================================================================================================================
    --		sets.OffenseMode
    -- ===================================================================================================================

    -- 'TP','ACC','DT','PDL','SB','Enspell'
    sets.OffenseMode = {
        ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Malignance Gloves",
        legs={ 
            name="Carmine Cuisses +1", 
            augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
        feet="Malignance Boots",
        -- neck="Anu Torque",
        neck={ 
            name="Dls. Torque +2", 
            augments={'Path: A',}},
        waist="Eschan Stone",
        left_ear="Sherida Earring",
        right_ear="Eabani Earring",
        left_ring="Hetairoi Ring",
        right_ring="Apate Ring",
        back={ 
            name="Sucellos's Cape", 
            augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }
          
    --     ammo = {
    --         name = "Coiste Bodhar",
    --         augments = {'Path: A'}
    --     },
    --     head = "Malignance Chapeau",
    --     body = "Malignance Tabard",
    --     hands = "Malignance Gloves",
    --     legs = "Malignance Tights",
    --     feet = "Malignance Boots",
    --     neck = "Anu Torque",
    --     waist = {
    --         name = "Sailfi Belt +1",
    --         augments = {'Path: A'}
    --     },
    --     left_ear = "Sherida Earring",
    --     right_ear = {
    --         name = "Leth. Earring +1"
    --     },
    --     left_ring = {
    --         name = "Chirich Ring +1",
    --         bag = "wardrobe1"
    --     },
    --     right_ring = {
    --         name = "Chirich Ring +1",
    --         bag = "wardrobe2"
    --     },
    --     back = {
    --         name = "Sucellos's Cape",
    --         augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
    --     }
    -- }

    sets.OffenseMode.TP = set_combine(sets.OffenseMode, {})
    sets.OffenseMode.DT = set_combine(sets.OffenseMode, {})
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {})
    sets.OffenseMode.PDT = set_combine(sets.OffenseMode, {})
    sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, {})

    sets.OffenseMode.SB = set_combine(sets.OffenseMode, {
        hands = "Volte Mittens",
        legs = "Volte Tights",
        neck = "Bathy Choker +1",
        waist = "Sarissapho. Belt"
    })

    sets.OffenseMode.Enspell = set_combine(sets.OffenseMode, {
        sub = "Ammurapi Shield",
        range = "Ullr",
        head = "Umuthi Hat",
        body = "Lethargy Sayon +3",
        hands = "Aya. Manopolas +2",
        legs = {
            name = "Viti. Tights +3",
            augments = {'Enspell Damage', 'Accuracy'}
        },
        feet = "Leth. Houseaux +3",
        neck = "Quanpur Necklace",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = "Leth. Earring +1",
        left_ring = "Freke Ring",
        right_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        back = {
            name = "Sucellos's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.DualWield = {
        waist = "Reiki Yotai",
        right_ear = "Eabani Earring"
    }

    sets.Enspell = {}

    sets.Saboteur = {
        hands = "Leth. Ganth. +3"
    }

    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        head = "Volte Cap",
        legs = "Volte Hose",
        waist = "Chaac Belt"
    }

    -- ===================================================================================================================
    --		sets.Precast
    -- ===================================================================================================================

    -- Used for Magic Spells
    sets.Precast = {}

    -- 42% Fast Cast is needed on RDM (Fast Cast IX - 38%)
    -- 10% is Quick Magic limit
    sets.Precast.FastCast = {
        ammo="Pemphredo Tathlum",
        head="Atro. Chapeau +2",
        body = {
            name = "Viti. Tabard +3",
            augments = {'Enhances "Chainspell" effect'}
        }, -- 15
        hands="Jhakri Cuffs +2",
        legs="Aya. Cosciales +2",
        feet={ name="Merlinic Crackows", augments={'MND+10','Mag. Acc.+20 "Mag.Atk.Bns."+20','Accuracy+8 Attack+8',}},
        neck="Loricate Torque +1",
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ 
            name="Leth. Earring +1", 
            augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Lebeche Ring",
        right_ring="Kishar Ring",
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
        
    --     ammo = "Impatiens", -- 2 Quick Magic
    --     head = "Bunzi's Hat", -- 10
    --     body = {
    --         name = "Viti. Tabard +3",
    --         augments = {'Enhances "Chainspell" effect'}
    --     }, -- 15
    --     hands = {
    --         name = "Leyline Gloves",
    --         augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
    --     }, -- 8
    --     legs = {
    --         name = "Kaykaus Tights +1",
    --         augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
    --     }, -- 7
    --     feet = {
    --         name = "Bunzi's Sabots",
    --         augments = {'Path: A'}
    --     },
    --     neck = {
    --         name = "Unmoving Collar +1",
    --         augments = {'Path: A'},
    --         priority = 3
    --     },
    --     waist = "Witful Belt", -- 3 Quick Magic
    --     left_ear = {
    --         name = "Etiolation Earring",
    --         priority = 1
    --     }, -- Used to Keep HP/MP pool
    --     right_ear = {
    --         name = "Leth. Earring +1"
    --     }, -- 8
    --     left_ring = "Lebeche Ring", -- 2 Quick Magic
    --     right_ring = {
    --         name = "Etana Ring",
    --         priority = 2
    --     },
    --     back = "Perimede Cape" -- 4 Quick Magic
    -- } -- 50%+ total Fast Cast and 11% Quick Magic

    -- Used for Enhancing Magic
    sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, sets.Precast.QuickMagic, {})

    -- Used for Healing Magic
    sets.Precast.Cure = set_combine(sets.Precast.FastCast, sets.Precast.QuickMagic, {})

    sets.Precast.RA = set_combine(sets.Precast, {
        ammo = Ammo.RA,
        waist = "Yemaya Belt", -- 0 / 5
        right_ring = "Crepuscular Ring" -- 3
    })

    -- Flurry
    sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {})

    -- Flurry II
    sets.Precast.RA.Flurry_II = set_combine(sets.Precast.RA.Flurry, {})

    sets.Precast.BlueMagic = set_combine(sets.Precast.FastCast, {})

    -- ===================================================================================================================
    --		sets.midcast
    -- ===================================================================================================================

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    sets.Midcast.Utsusemi = set_combine(sets.Midcast, {})

    -- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = set_combine(sets.Midcast, {})

    -- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
        ammo = Ammo.ACC
    })

    -- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {})

    -- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {})

    -- This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
    sets.Midcast.SIRD = {}

    -- Cure Set
    sets.Midcast.Cure = {
        main="Daybreak",
        sub="Sors Shield",
        ammo="Pemphredo Tathlum",
        head="Vanya Hood",
        body="Nyame Mail",
        hands="Bokwus Gloves",
        legs="Atrophy Tights +2",
        feet={ name="Merlinic Crackows", augments={'MND+10','Mag. Acc.+20 "Mag.Atk.Bns."+20','Accuracy+8 Attack+8',}},
        neck="Loricate Torque +1",
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ 
            name="Leth. Earring +1", 
            augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Lebeche Ring",
        right_ring="Naji's Loop",
        back="Perimede Cape",
    }
        
    --     ammo = "Staunch Tathlum +1",
    --     head = {
    --         name = "Kaykaus Mitra +1",
    --         augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
    --     }, -- 11
    --     body = {
    --         name = "Kaykaus Bliaut +1",
    --         augments = {'MP+80', '"Cure" potency +6%', '"Conserve MP"+7'}
    --     }, -- 6
    --     hands = {
    --         name = "Kaykaus Cuffs +1",
    --         augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
    --     }, -- 11
    --     legs = {
    --         name = "Kaykaus Tights +1",
    --         augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
    --     }, -- 11
    --     feet = {
    --         name = "Kaykaus Boots +1",
    --         augments = {'MP+80', '"Cure" spellcasting time -7%', 'Enmity-6'}
    --     }, -- 11
    --     neck = {
    --         name = "Loricate Torque +1",
    --         augments = {'Path: A'}
    --     },
    --     waist = "Sacro Cord",
    --     left_ear = {
    --         name = "Etiolation Earring",
    --         priority = 1
    --     }, -- Used to Keep HP/MP pool
    --     right_ear = {
    --         name = "Odnowa Earring +1",
    --         augments = {'Path: A'}
    --     },
    --     right_ring = {
    --         name = "Gelatinous Ring +1",
    --         augments = {'Path: A'}
    --     },
    --     left_ring = "Defending Ring",
    --     back = {
    --         name = "Sucellos's Cape",
    --         augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
    --     }
    -- } -- 50% Cure I, 16% Cure II

    sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {})

    -- Regen
    sets.Midcast.Regen = {
        feet = {
            name = "Bunzi's Sabots",
            augments = {'Path: A'}
        }
    }

    -- Enhancing Duration on SELF
    sets.Midcast.Enhancing = {
        main={ name="Colada", augments={'Enh. Mag. eff. dur. +2','STR+3','"Mag.Atk.Bns."+13','DMG:+5',}},
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
        body = {
            name = "Viti. Tabard +3",
            augments = {'Enhances "Chainspell" effect'}
        },
        hands="Atrophy Gloves +2",
        legs="Atrophy Tights +2",
        feet="Leth. Houseaux +3",
        neck={ 
            name="Dls. Torque +2", 
            augments={'Path: A',}},
        waist="Embla Sash",
        left_ear="Malignance Earring",
        right_ear={ 
            name="Leth. Earring +1", 
            augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Lebeche Ring",
        right_ring="Stikini Ring +1",
        back={ 
            name="Ghostfyre Cape", 
            augments={'Enfb.mag. skill +9','Enha.mag. skill +9','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
    }
        
    --     main={ name="Colada", augments={'Enh. Mag. eff. dur. +2','STR+3','"Mag.Atk.Bns."+13','DMG:+5',}},
    --     sub = "Ammurapi Shield",
    --     ammo = "Pemphredo Tathlum",
    --     head = {
    --         name = "Telchine Cap",
    --         augments = {'"Regen"+2', 'Enh. Mag. eff. dur. +10'}
    --     },
    --     body = {
    --         name = "Viti. Tabard +3",
    --         augments = {'Enhances "Chainspell" effect'}
    --     }, -- 15
    --     hands = "Atrophy Gloves +2", -- 20
    --     legs = {
    --         name = "Telchine Braconi",
    --         augments = {'"Regen"+2', 'Enh. Mag. eff. dur. +10'}
    --     },
    --     feet = "Leth. Houseaux +3", -- 35
    --     neck = {
    --         name = "Dls. Torque +2",
    --         augments = {'Path: A'}
    --     }, -- 25
    --     waist = "Embla Sash", -- 10
    --     left_ear = {
    --         name = "Etiolation Earring",
    --         priority = 1
    --     }, -- Used to Keep HP/MP pool
    --     right_ear = "Lethargy Earring", -- 8
    --     left_ring = {
    --         name = "Stikini Ring +1",
    --         bag = "wardrobe1"
    --     },
    --     right_ring = {
    --         name = "Stikini Ring +1",
    --         bag = "wardrobe2"
    --     },
    --     back = {
    --         name = "Sucellos's Cape",
    --         augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
    --     } -- 20
    -- } -- 150% Duration

    -- Enhancing Duration on OTHERS
    sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
        head = "Leth. Chappel +2",
        -- head={ 
        --     name="Telchine Cap", 
        --     augments={'Enh. Mag. eff. dur. +9',}},
        body = "Lethargy Sayon +3",
        legs = "Leth. Fuseau +2"
    })

    -- Spells that require SKILL - RDM only needs 500 or more except Temper II
    sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
        main="Pukulatmuj +1",
        sub={ 
            name="Forfend +1", 
            augments={'Path: A',}},
        ammo = "Staunch Tathlum",
        head = "Befouled Crown",
        body = {
            name = "Viti. Tabard +3",
            augments = {'Enhances "Chainspell" effect'}
        },
        hands = {
            name = "Viti. Gloves +2",
            augments = {'Enhancing Magic duration'}
        },
        legs = "Atrophy Tights +2",
        feet = "Leth. Houseaux +3",
        neck = "Incanter's Torque",
        waist = "Olympus Sash",
        left_ear = "Andoaa Earring",
        right_ear = "Mimir Earring",
        back={ 
            name="Ghostfyre Cape", 
            augments={'Enfb.mag. skill +9','Enha.mag. skill +9','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
    })

    -- used to boost Gain Spells
    sets.Midcast.Enhancing.Gain = set_combine(sets.Midcast.Enhancing, {
        hands = {
            name = "Viti. Gloves +2",
            augments = {'Enhancing Magic duration'}
        }
    })

    -- Elemental
    sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {})

    -- Status
    sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {})

    -- Blue Magic
    sets.Midcast.BlueMagic = {}
    sets.Midcast.BlueMagic.Skill = set_combine(sets.Midcast.Enhancing, {})
    sets.Midcast.BlueMagic.Nuke = set_combine(sets.Midcast.Enhancing, {})
    sets.Midcast.BlueMagic.Healing = set_combine(sets.Midcast.Cure, {})
    sets.Midcast.BlueMagic.ACC = set_combine(sets.Midcast.Enhancing, {})
    sets.Midcast.BlueMagic.Enmity = set_combine(sets.Enmity, {})

    -- Enfeebling
    sets.Midcast.Enfeebling = {
        main="Daybreak",
        sub="Kaja Rod",
        ammo="Pemphredo Tathlum",
        head = {
            name = "Viti. Chapeau +4",
            augments = {'Enfeebling Magic duration', 'Magic Accuracy'}
        },
        body="Atrophy Tabard +4",
        hands = "Leth. Ganth. +3",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
        neck={ 
            name="Dls. Torque +2", 
            augments={'Path: A',}},
        waist="Luminary Sash",
        left_ear="Malignance Earring",
        right_ear="Digni. Earring",
        left_ring="Metamor. Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
        
    --     ammo = "Regal Gem",
    --     head = {
    --         name = "Viti. Chapeau +3",
    --         augments = {'Enfeebling Magic duration', 'Magic Accuracy'}
    --     },
    --     body = "Atrophy Tabard +2",
    --     hands = "Leth. Ganth. +3",
    --     legs = {
    --         name = "Chironic Hose",
    --         augments = {'Mag. Acc.+23 "Mag.Atk.Bns."+23', '"Drain" and "Aspir" potency +8', 'MND+1', 'Mag. Acc.+12'}
    --     },
    --     feet = {
    --         name = "Vitiation Boots +3",
    --         augments = {'Immunobreak Chance'}
    --     },
    --     neck = {
    --         name = "Dls. Torque +2",
    --         augments = {'Path: A'}
    --     },
    --     waist = {
    --         name = "Obstin. Sash",
    --         augments = {'Path: A'}
    --     },
    --     left_ear = "Regal Earring",
    --     right_ear = "Snotra Earring",
    --     left_ring = {
    --         name = "Stikini Ring +1",
    --         bag = "wardrobe2"
    --     },
    --     right_ring = {
    --         name = "Stikini Ring +1",
    --         bag = "wardrobe1"
    --     },
    --     back = {
    --         name = "Sucellos's Cape",
    --         augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
    --     }
    -- }

    -- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
    sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {
        range = "Kaja bow",
        ammo = empty,
        head = {
            name = "Viti. Chapeau +4",
            augments = {'Enfeebling Magic duration', 'Magic Accuracy'}
        },
        body = "Atrophy Tabard +4",
        hands = "Leth. Ganth. +3",

		neck={ 
            name="Dls. Torque +2", 
            augments={'Path: A',}},
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        waist={ name="Obstin. Sash", augments={'Path: A',}},
        back = {
            name = "Aurist's Cape +1",
            augments = {'Path: A'}
        }
    })


    
    -- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
    sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {
        ammo = "Regal Gem", -- 10%
        body = "Lethargy Sayon +3", -- 14%
        -- legs={ 
        --     name="Chironic Hose", 
        --     augments={'Mag. Acc.+30','Haste+2','MND+9',}},
        back = {
            name = "Sucellos's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        }, -- 10%
        feet = {
            name = "Vitiation Boots +3",
            augments = {'Immunobreak Chance'}
        }, -- 10%
        neck = {
            name = "Dls. Torque +2",
            augments = {'Path: A'}
        } -- 10%
    })

    -- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
    sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {
        head = {
            name = "Viti. Chapeau +4",
            augments = {'Enfeebling Magic duration', 'Magic Accuracy'}
        }, -- 15s (3 seconds x 5 merits)
        hands = "Regal Cuffs", -- 20% swaps out with Saboteur active
        legs={ 
            name="Chironic Hose", 
            augments={'Mag. Acc.+30','Haste+2','MND+9',}},
        right_ear = "Snotra Earring", -- 10%
        left_ring = "Kishar Ring", -- 10%
        waist = {
            name = "Obstin. Sash",
            augments = {'Path: A'}
        }, -- 5%
        neck = {
            name = "Dls. Torque +2",
            augments = {'Path: A'}
        } -- 25%
    })

    -- Specific gear for spells
    sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
        neck = "Nodens Gorget",
        waist = "Siegel Sash",
        legs="Shedir Seraweels",
        left_ear = "Earthcry Earring"
    })

    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
        hands = "Regal Cuffs",
        head = "Chironic Hat",
        legs = "Shedir Seraweels",
        waist = "Emphatikos Rope"
    })

    -- Spells that require SKILL - RDM only needs +500 skill except Temper II
    sets.Midcast["Temper II"] = set_combine(sets.Midcast.Enhancing, {
        main="Pukulatmuj +1",
        sub={ 
            name="Forfend +1", 
            augments={'Path: A',}},
        ammo = "Psilomene",
        head = "Befouled Crown",
        hands = {
            name = "Viti. Gloves +3",
            augments = {'Enhancing Magic duration'}
        },
        legs = "Atrophy Tights +2",
        neck = "Incanter's Torque",
        left_ear = "Mimir Earring",
        right_ear = "Andoaa Earring",
        waist = "Olympus Sash",
        back={ 
            name="Ghostfyre Cape", 
            augments={'Enfb.mag. skill +9','Enha.mag. skill +9','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
    }) -- Max Enhancing 672

    sets.Midcast["Diaga"] = set_combine(sets.Midcast.Enfeebling, sets.TreasureHunter)
    sets.Midcast["Dispelga"] = set_combine(sets.Midcast.Enfeebling, sets.TreasureHunter)

    sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
        head = "Amalric Coif +1",
        body = "Atrophy Tabard +4",
        legs = "Leth. Fuseau +2",
        waist = "Gishdubar Sash",
    })

    sets.Midcast.Phalanx = set_combine(sets.Midcast.Enhancing.Skill, {
            main = "Sakpata's Sword",
            head={ 
                name="Chironic Hat", 
                augments={'Pet: VIT+6','Damage taken-1%','Phalanx +2','Accuracy+5 Attack+5','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
            body = {
                name = "Taeon Tabard",
                augments = {'Phalanx +2'}
            },
            hands={ name="Taeon Gloves", augments={'Phalanx +2',}},
            legs = {
                name = "Taeon Tights",
                augments = {'Phalanx +2'}
            },
            feet={ 
                name="Chironic Slippers", 
                augments={'Accuracy+9','Phalanx +2','Accuracy+10 Attack+10','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
        })

        sets.Midcast["Phalanx II"] = set_combine(sets.Midcast.Enhancing, {
            main = "Sakpata's Sword",
            head={ 
                name="Chironic Hat", 
                augments={'Pet: VIT+6','Damage taken-1%','Phalanx +2','Accuracy+5 Attack+5','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
            body = {
                name = "Taeon Tabard",
                augments = {'Phalanx +2'}
            },
            hands={ name="Taeon Gloves", augments={'Phalanx +2',}},
            legs = {
                name = "Taeon Tights",
                augments = {'Phalanx +2'}
            },
            feet={ name="Chironic Slippers", augments={'Attack+14','"Dbl.Atk."+4','Phalanx +3','Accuracy+5 Attack+5',}}
    })

    sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})

    sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})

    sets.Midcast.Nuke = {
        sub = "Ammurapi Shield",
        ammo = {
            name = "Ghastly Tathlum +1",
            augments = {'Path: A'}
        },
        head = "Leth. Chappel +2",
        body = "Lethargy Sayon +3",
        hands = "Leth. Ganth. +3",
        legs = "Leth. Fuseau +2",
        feet = "Leth. Houseaux +3",
        neck = "Sibyl Scarf",
        waist = {
            name = "Acuity Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Freke Ring",
        back = {
            name = "Sucellos's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
        left_ring = "Mujin Band",
        neck = "Mizu. Kubikazari"
    })

    -- ===================================================================================================================
    --		sets.JA
    -- ===================================================================================================================

    -- Job Abilities
    sets.JA = {}
    sets.JA["Chainspell"] = {
        body = {
            name = "Viti. Tabard +3",
            augments = {'Enhances "Chainspell" effect'}
        }
    }
    sets.JA["Saboteur"] = {}
    sets.JA["Spontaneity"] = {}
    sets.JA["Stymie"] = {}
    sets.JA["Convert"] = {}
    sets.JA["Composure"] = {
        head = "Leth. Chappel +2",
        body = "Lethargy Sayon +3",
        hands = "Leth. Ganth. +3",
        legs = "Leth. Fuseau +2",
        feet = "Leth. Houseaux +3"
    }

    -- Dancer JA Section
    sets.Flourish = set_combine(sets.Idle.DT, {})

    sets.Jig = set_combine(sets.Idle.DT, {})

    sets.Step = set_combine(sets.OffenseMode.DT, {})

    sets.Samba = set_combine(sets.Idle.DT, {})

    -------------------------------------------------------------------------------
    -- Waltz Potency gear caps at 50%, while Waltz received potency caps at 30%. -- 
    -------------------------------------------------------------------------------
    sets.Waltz = set_combine(sets.OffenseMode.DT, {
        legs = "Dashing Subligar" -- 10
        -- ammo="Yamarang", -- 5
        -- body={ name="Gleti's Cuirass", augments={'Path: A',}}, -- 10
        -- hands="Slither Gloves +1", -- 5
    }) -- 10% Potency

    -- ===================================================================================================================
    --		sets.WS
    -- ===================================================================================================================

    sets.WS = {
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
        feet = "Leth. Houseaux +3",
        neck = {
            name = "Dls. Torque +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Leth. Earring +1"
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Epaminondas's Ring",
        back = {
            name = "Sucellos's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS.ACC = set_combine(sets.WS, {})

    sets.WS.PDL = set_combine(sets.WS, {
        ammo = "Crepuscular Pebble",
        right_ring = "Sroda Ring"
    })

    sets.WS.WSD = set_combine(sets.WS, {
        ammo = "Oshasha's Treatise",
        left_ear = "Ishvara Earring"
    })

    sets.WS.MAB = set_combine(sets.WS, {
        ammo = "Oshasha's Treatise",
        neck = "Sanctity Necklace",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = "Regal Earring"
    })

    sets.WS.CRIT = set_combine(sets.WS, {
        ammo = "Yetshila +1",
        head = {
            name = "Blistering Sallet +1",
            augments = {'Path: A'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        right_ring = "Hetairoi Ring",
        back = {
            name = "Sucellos's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Crit.hit rate+10', 'Damage taken-5%'}
        }
    })

    sets.WS.RA = set_combine(sets.WS, {})

    sets.WS.SB = sets.Subtle_Blow

    sets.WS["Seraph Blade"] = set_combine(sets.WS.MAB, {
        right_ring = "Weather. Ring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        }
    })

    sets.WS["Sanguine Blade"] = set_combine(sets.WS.MAB, {
        head = "Pixie Hairpin +1",
        right_ring = "Archon Ring"
    })

    sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        }
    })

    sets.WS["Red Lotus Blade"] = sets.WS.MAB

    sets.WS["Chant du Cygne"] = sets.WS.CRIT

    sets.WS["Savage Blade"] = set_combine(sets.WS,{
        ammo="Oshasha's Treatise",
        head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Lethargy Sayon +3",
        hands="Atrophy Gloves +2",
        legs="Leth. Fuseau +2",
        feet="Leth. Houseaux +3",
        neck = "Republican Platinum Medal",
        -- neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Regal Earring",
        left_ring="Cornelia's Ring",
        right_ring="Rufescent Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
        
        -- ammo="Hasty Pinion +1",
        -- head="Aya. Zucchetto +2",
        -- body="Ayanmo Corazza +2",
        -- hands="Malignance Gloves",
        -- legs="Aya. Cosciales +2",
        -- feet="Aya. Gambieras +2",
        -- neck="Anu Torque",
        -- waist="Eschan Stone",
        -- left_ear="Sherida Earring",
        -- right_ear="Digni. Earring",
        -- left_ring="Hetairoi Ring",
        -- right_ring="Apate Ring", 
        -- back={ name="Sucellos's Cape", 
        -- augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
    })

    sets.WS["Black Halo"] = set_combine(sets.WS.WSD, {
        ammo="Oshasha's Treatise",
        head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="Lethargy Sayon +3",
        hands="Atrophy Gloves +2",
        legs="Leth. Fuseau +2",
        feet="Leth. Houseaux +3",
        neck = "Republican Platinum Medal",
        -- neck={ name="Dls. Torque +2", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Sherida Earring",
        right_ear="Regal Earring",
        left_ring="Cornelia's Ring",
        right_ring="Rufescent Ring",
        back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
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
    local equipSet = {}

    return equipSet
end

-- Augment basic equipment sets
function midcast_custom(spell)
    local equipSet = {}
    if buffactive['Saboteur'] and spell.skill == 'Enfeebling Magic' then
        equipSet = sets.Saboteur
    end
    return equipSet
end

-- Augment basic equipment sets
function aftercast_custom(spell)
    local equipSet = {}

    return equipSet
end

-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    local equipSet = {}
    return equipSet
end

-- This function is called when a update request the correct equipment set
function choose_set_custom()
    local equipSet = {}

    return equipSet
end

-- Function is called when the player changes states
function status_change_custom(new, old)
    local equipSet = {}

    return equipSet
end

-- Function is called when a self command is issued
function self_command_custom(command)

end

-- This function is called when the job file is unloaded
function user_file_unload()

end

-- Function used to automate Job Ability use
function check_buff_JA()
    local buff = 'None'

    return buff
end

-- Function used to automate Spell use
function check_buff_SP()
    local buff = 'None'

    return buff
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
