
--Inyana

-- Load and initialize the include file.
include('Lilypeach-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "3"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Modes for TP
state.WeaponMode:options('Unlocked', 'Aminon', 'Seraph Blade', 'Sanguine Blade', 'Red Lotus Blade', 'Chant du Cygne','Savage Blade', 'Eviceration', 'Aeolian Edge', 'Black Halo', 'Ullr')
state.WeaponMode:set('Sanguine Blade')

-- Set to true to run organizer on job changes
Organizer = false

elemental_ws = S{'Aeolian Edge', 'Seraph Blade', 'Shining Blade','Red Lotus Blade', 'Burning Blade', 'Sanguine Blade', 'Energy Drain','Energy Steal','Cyclone','Gust Slash'}

-- Goal 2100 hp and 1300 MP
function get_sets()

	-- ===================================================================================================================
	--		sets.Weapons
	-- ===================================================================================================================

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Unlocked'] ={
		-- main={ name="Crocea Mors", augments={'Path: C',}},
		-- sub = "Ammurapi Shield",
	}

	sets.Weapons['Aminon'] ={
		main = "Maxentius",
		sub={ name="Forfend +1", augments={'Path: A',}},
	}

	sets.Weapons['Seraph Blade'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Daybreak"
	}

	sets.Weapons['Sanguine Blade'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub={ name="Bunzi's Rod", augments={'Path: A',}},
	}

	sets.Weapons['Chant du Cygne'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub={ name="Demers. Degen +1", augments={'Path: A',}},
	}

	sets.Weapons['Savage Blade'] ={
		main="Naegling",
		sub = {
            name = "Thibron",
            augments = {'TP Bonus +1000'}
        },
	}

	sets.Weapons['Eviceration'] ={
		main="Qutrub Knife",
    	sub="Norgish Dagger",
		-- main="Tauret",
		-- sub="Gleti's Knife",
	}

	sets.Weapons['Aeolian Edge'] ={
		main="Tauret",
		sub={ name="Thibron", augments={'TP Bonus +1000',}},
	}

	sets.Weapons['Black Halo'] ={
		main="Maxentius",
		sub = {
            name = "Thibron",
            augments = {'TP Bonus +1000'}
        },
	}

	sets.Weapons['Ullr'] = {
		range="Ullr",
		ammo="Stone Arrow",
	}


	sets.Weapons['Red Lotus Blade'] ={
		main={ name="Crocea Mors", augments={'Path: C',}},
    	sub={ name="Thibron", augments={'TP Bonus +1000',}},
	}

	--Shield used when melee and not dual wield.
	sets.Weapons.Shield = {
		sub="Ammurapi Shield",
		-- sub={ name="Forfend +1", augments={'Path: A',}},
	}

	sets.Weapons.Sleep = {
		sub="Caliburnus",
	}

	--Default arrow to use
	Ammo.RA = "Stone Arrow"
	Ammo.ACC = "Stone Arrow"

	-- ===================================================================================================================
	--		sets.Idle
	-- ===================================================================================================================

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1", -- 3/3
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy'}, priority=3}, -- +3 Refresh
		body="Lethargy Sayon +3", -- 14/14  +4 Refresh
		hands="Leth. Ganth. +3", -- 11/11
		legs="Malignance Tights", -- 7/7
		feet="Malignance Boots",
		neck="Loricate Torque +1", -- 6/6
		waist="Orpheus's Sash",
		left_ear="Regal Earring",
		right_ear={ name="Etiolation Earring", priority=1}, -- 0/1
		left_ring={name="Stikini Ring +1", bag="wardrobe3"}, -- +1 Refresh
		right_ring={name="Stikini Ring +1", bag="wardrobe4"}, -- +1 Refresh
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}, -- 10/0
		-- 50% PDT, 50% MDT, 11 MP/Tic
    }
	-- Gear to swap out for Movement
	sets.Movement = {
		left_ring="Defending Ring",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}}
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring={ name="Saida Ring", bag="wardrobe3", priority=1},
		waist="Gishdubar Sash",
	}

	-- ===================================================================================================================
	--		sets.OffenseMode (F12)
	-- ===================================================================================================================

	sets.OffenseMode = {
		ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
	}

	sets.OffenseMode.TP = set_combine(sets.OffenseMode, {

	})

	sets.OffenseMode.DT = set_combine(sets.OffenseMode, { 
	
	})
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, { 
	
	})

	sets.DualWield = {
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		hands="Ayanmo Manopolas +2",
        legs = {
            name = "Carmine Cuisses +1",
            augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6'},
        },
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
	}

	-- ===================================================================================================================
	--		sets.Precast
	-- ===================================================================================================================

	-- Used for Magic Spells
	sets.Precast = {}

	-- 50% Fast Cast is needed on RDM (Fast Cast V - 30%)
	sets.Precast.FastCast = {
        head = "Atrophy Chapeau +3", -- 16%
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}, --15
		hands="Malignance Gloves",
		legs="Aya. Cosciales +2", -- 6
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Embla Sash", -- 5
		left_ear={ name="Eabani Earring", priority=4},
		right_ear={ name="Etiolation Earring", priority=3}, --1
		left_ring="Kishar Ring",
		right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=1},
		back = {
            name = "Sucellos's Cape",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Mag. Acc.+10', '"Fast Cast"+10'}
        } --10
	} -- 51% total Fast Cast

	-- Used for Raises and Cures
	sets.Precast.QuickMagic = set_combine(sets.Precast.FastCast, {
		-- Cap is 10%
	    ammo="Impatiens", -- 2
	    waist="Witful Belt", -- 3
		left_ring="Lebeche Ring", -- 2
	    back="Perimede Cape", -- 4
	})

	sets.Precast.RA = set_combine(sets.Precast, {
		ammo=Ammo.RA,
		waist="Yemaya Belt", -- 0 / 5
		right_ring="Crepuscular Ring", -- 3
    })	

	-- Only the bullet needs to be set for ACC sets (so that it will match the sets.Midcast.RA.ACC)
    sets.Precast.RA.ACC = set_combine(sets.Precast.RA, {
		ammo=Ammo.ACC,
    })

	-- Flurry - 55 Snapshot Needed
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {

	}) 

	-- Flurry II - 40 Snapshot Needed
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, { 

    })

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	-- Ranged Attack Gear (Normal Midshot)
    sets.Midcast.RA = set_combine(sets.Midcast, {

    })

	-- Ranged Attack Gear (High Accuracy Midshot)
    sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
		ammo=Ammo.ACC,
    })

	-- Ranged Attack Gear (Physical Damage Limit)
    sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {

    })

	-- Ranged Attack Gear (Critical Build)
    sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {

    })

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
        main = "Daybreak",
        sub = "Sors Shield",
        ammo = "Pemphredo Tathlum",
        head = {
            name = "Vanya Hood",
            augments = {'MP+50', '"Fast Cast"+10', 'Haste+2%'}
        },
        body = "Bunzi's Robe",
        hands = {
            name = "Kaykaus Cuffs +1",
            augments = {'MP+80', 'MND+12', 'Mag. Acc.+20'}
        },
        legs = "Atrophy Tights +3",
        feet = {
            name = "Medium's Sabots",
            augments = {'MP+40', 'MND+6', '"Conserve MP"+5', '"Cure" potency +3%'}
        },
        neck = "Incanter's Torque",
        waist = "Acerbic Sash +1",
        left_ear = "Mendi. Earring",
        right_ear = "Regal Earring",
        left_ring = "Lebeche Ring",
        right_ring = "Menelaus's Ring",
        back = "Solemnity Cape"
    }

	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {
	
	})

	-- Enhancing Duration on SELF
	sets.Midcast.Enhancing = {
        main = {
            name = "Colada",
            augments = {'Enh. Mag. eff. dur. +3', 'STR+2'}
        },
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = {
            name = "Telchine Cap",
            augments = {'Enh. Mag. eff. dur. +9'}
        },
        body = {
            name = "Viti. Tabard +3",
            augments = {'Enhances "Chainspell" effect'}
        },
        hands = "Atrophy Gloves +3",
        legs = "Atrophy Tights +3",
        feet = "Leth. Houseaux +3",
        neck = {
            name = "Dls. Torque +2",
            augments = {'Path: A'}
        },
        waist = "Embla Sash",
        right_ear = {
            name = "Leth. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', '"Dbl.Atk."+5'}
        },
        left_ear = "Mimir Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back={ 
			name="Ghostfyre Cape", 
			augments={'Enfb.mag. skill +5','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},
    }

	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		legs="Leth. Fuseau +3",
		-- hands="Leth. Ganth. +3",
	})

	-- Regen
	sets.Midcast.Regen = {
		feet={ name="Bunzi's Sabots", augments={'Path: A',}},
	}

	-- Spells that require SKILL - RDM only needs 500 or more except Temper II
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
        main="Pukulatmuj +1",
        sub={ name="Forfend +1", augments={'Path: A',}},
        ammo="Staunch Tathlum",
        head="Befouled Crown",
        body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
        hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
        legs="Atrophy Tights +3",
        feet="Leth. Houseaux +3",
        neck="Incanter's Torque",
        waist="Olympus Sash",
        left_ear="Andoaa Earring",
        right_ear="Mimir Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ 
			name="Ghostfyre Cape", 
			augments={'Enfb.mag. skill +5','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}}, 
	})

	-- used to boost Gain Spells
	sets.Midcast.Enhancing.Gain = set_combine(sets.Midcast.Enhancing, {
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
	})

	-- Enfeebling
	sets.Midcast.Enfeebling = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Atrophy Tabard +3",
		hands="Leth. Ganth. +3",
        legs = {
            name = "Chironic Hose",
            augments = {'Mag. Acc.+25 "Mag.Atk.Bns."+25', 'MND+13', 'Mag. Acc.+9', '"Mag.Atk.Bns."+15'}
        },
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist={ name="Obstin. Sash", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Snotra Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe3"},
		right_ring={name="Stikini Ring +1", bag="wardrobe4"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {
        main = {
            name = "Contemplator +1",
            augments = {'Path: A'}
        },
        sub = "Enki Strap",
        range = "Ullr",
        ammo = empty,
        head = {
            name = "Viti. Chapeau +3",
            augments = {'Enfeebling Magic duration', 'Magic Accuracy'}
        },
        body = "Atrophy Tabard +3",
        hands = "Leth. Ganth. +3",
		neck = "Null Loop",
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
		main = {
            name = "Contemplator +1",
            augments = {'Path: A'}
        },
		sub="Mephitis Grip",
		ammo="Regal Gem", -- 10%
		body="Lethargy Sayon +3", -- 14%
		-- legs="Lethargy Fuseau +3",
		left_ear="Malignance Earring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}, -- 10%
		feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}}, -- 10%
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, -- 10%
		-- back = {
        --     name = "Aurist's Cape +1",
        --     augments = {'Path: A'}
        -- }
	})

	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {
		-- head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}}, -- 15s (3 seconds x 5 merits)
		head="Leth. Chappel +3",
		hands="Regal Cuffs", --20% swaps out with Saboteur active
		-- hands = "Leth. Ganth. +3",
		body="Lethargy Sayon +3",
		legs = {
            name = "Chironic Hose",
            augments = {'Mag. Acc.+25 "Mag.Atk.Bns."+25', 'MND+13', 'Mag. Acc.+9', '"Mag.Atk.Bns."+15'}
        },
		-- legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		right_ear="Snotra Earring", -- 10%
		left_ring="Kishar Ring", -- 10%
		waist={ name="Obstin. Sash", augments={'Path: A',}}, -- 5%
		neck={ name="Dls. Torque +2", augments={'Path: A',}}, -- 25%
		back = {
            name = "Aurist's Cape +1",
            augments = {'Path: A'}
        }
		-- back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
	})

	-- sets.midcast['Divine Magic'] = {
    --     main="Mafic Cudgel",
    --     sub="Genmei Shield",
    --     range="Gjallarhorn",
    --     head="Halitus Helm",
    --     body="Emet Harness +1",
    --     hands="Fili Manchettes +3",
    --     legs="Zoar Subligar +1",
    --     feet={ name="Nyame Sollerets", augments={'Path: B',}},
    --     neck="Unmoving Collar +1",
    --     waist="Trance Belt",
    --     left_ear="Etiolation Earring",
    --     right_ear="Cryptic Earring",
    --     left_ring="Provocare Ring",
    --     right_ring="Supershear Ring",
    --     back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
    -- }
	sets.Enspell = {
        -- main={ name="Crocea Mors", augments={'Path: C',}},
		-- sub={ name="Demers. Degen +1", augments={'Path: A',}},
		-- ammo="Sroda Tathlum",
		-- -- head="Malignance Chapeau",
		-- head="Umuthi Hat",
		-- body="Malignance Tabard",
		-- hands="Aya. Manopolas +2",
		-- legs="Malignance Tights",
		-- feet="Malignance Boots",
		-- neck={ name="Dls. Torque +2", augments={'Path: A',}},
		-- waist="Orpheus's Sash",
		-- left_ear="Eabani Earring",
		-- right_ear="Halasz Earring",
		-- left_ring="Resonance Ring",
		-- right_ring="Chirich Ring +1",
		-- -- back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +2','Enha.mag. skill +8','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
		-- back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},

		ammo="Sroda Tathlum",
		head="Umuthi Hat",
		body="Lethargy Sayon +3",
		hands="Aya. Manopolas +2",
		legs="Malignance Tights",
		-- legs = {
        --     name = "Carmine Cuisses +1",
        --     augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6'},
        -- },
		feet="Leth. Houseaux +3",
		neck="Null Loop",
		waist="Orpheus's Sash",
		left_ear="Suppanomimi",
		right_ear="Halasz Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
}
	sets.Saboteur = {hands="Leth. Ganth. +3",}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		neck="Nodens Gorget",
		legs="Shedir Seraweels",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
	})

    sets.Midcast["Phalanx"] = set_combine(sets.Midcast.Enhancing, {
            main = "Sakpata's Sword",
            head={ name="Chironic Hat", augments={'CHR+5','Phalanx +3',}},
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

        sets.Midcast["Phalanx II"] = set_combine(sets.Midcast.Enhancing, {
            main = "Sakpata's Sword",
            head={ name="Chironic Hat", augments={'CHR+5','Phalanx +3',}},
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
        
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		hands="Regal Cuffs",
		head="Amalric Coif +1",
		legs="Shedir Seraweels",
		waist="Emphatikos Rope",
	})

	-- Spells that require SKILL - RDM only needs +500 skill except Temper II
	sets.Midcast["Temper II"] = set_combine(sets.Midcast.Enhancing, {
		ammo="Hydrocera",
		head="Befouled Crown",
		hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
		legs="Atrophy Tights +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		back={ 
			name="Ghostfyre Cape", 
			augments={'Enfb.mag. skill +5','Enha.mag. skill +10','Mag. Acc.+9','Enh. Mag. eff. dur. +20',}},
	}) -- Max Enhancing 613

	sets.Midcast["Foil"] = set_combine(sets.Midcast.Enhancing, {
		main="Mafic Cudgel",
        sub="Genmei Shield",
        range="Gjallarhorn",
        head="Halitus Helm",
        body="Emet Harness +1",
        hands="Fili Manchettes +3",
        legs="Zoar Subligar +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Unmoving Collar +1",
        waist="Trance Belt",
        left_ear="Etiolation Earring",
        right_ear="Cryptic Earring",
        left_ring="Provocare Ring",
        right_ring="Supershear Ring",
        -- back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
	})

--	Aminon Occult Acument set only
	sets.Midcast['Thunder V'] = { 
		ammo="Aurgelmir Orb",
		head = "Welkin crown",
		body={ name="Merlinic Jubbah", augments={'"Occult Acumen"+11','Mag. Acc.+1',}},
		hands={ name="Merlinic Dastanas", augments={'"Occult Acumen"+10','INT+1','Mag. Acc.+5',}},
		legs="Perdition Slops",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+7','"Occult Acumen"+11','CHR+1',}},
		neck="Anu Torque",
		waist="Oneiros Rope",
		left_ear="Dedition Earring",
		right_ear="Crep. Earring",
		left_ring="Crepuscular Ring",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
	}
	sets.Midcast['Absorb-TP'] = {
		-- sub = "Enki Strap",
        -- range = "Ullr",
        head = "Leth. Chappel +3",
        body = "Atrophy Tabard +3",
		-- body = "Lethargy Sayon +3",
        hands = "Leth. Ganth. +3",
		legs = "Leth. Fuseau +3",
		feet = "Leth. Houseaux +3", 
		neck = "Erra Pendant",
        left_ring = "Kishar Ring",
		-- right_ring = {
        --     name = "Metamor. Ring +1",
        --     augments = {'Path: A'}
        -- },
		-- left_ring = "metamorph Ring +1",
		right_ring = "Stikini Ring +1",
		left_ear="Malignance Earring",
		right_ear = {
            name = "Leth. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', '"Dbl.Atk."+5'}
        },
        waist = {
            name = "Acuity Belt +1",
            augments = {'Path: A'}
        },
        back = {
            name = "Aurist's Cape +1",
            augments = {'Path: A'}
        }
	}

	sets.Midcast["Flash"] = set_combine(sets.Midcast.Enhancing, {
		main="Mafic Cudgel",
        sub="Genmei Shield",
        -- range="Gjallarhorn",
        head="Halitus Helm",
        body="Emet Harness +1",
        hands = "Leth. Ganth. +3",
        legs="Zoar Subligar +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Unmoving Collar +1",
        waist="Trance Belt",
        left_ear="Etiolation Earring",
        right_ear="Cryptic Earring",
        left_ring="Provocare Ring",
        right_ring="Supershear Ring",
        -- back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
	})

	-- sets.Midcast["Diaga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)
	sets.Midcast["Diaga"] = set_combine(sets.Midcast.Enhancing, {
		main="Mafic Cudgel",
        sub="Genmei Shield",
        -- range="Gjallarhorn",
        head="Halitus Helm",
        body="Emet Harness +1",
        hands = "Leth. Ganth. +3",
        legs="Zoar Subligar +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Unmoving Collar +1",
        waist="Trance Belt",
        left_ear="Etiolation Earring",
        right_ear="Cryptic Earring",
        left_ring="Provocare Ring",
        right_ring="Supershear Ring",
        -- back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
	})
	
	sets.Midcast["Dispelga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		body="Atrophy Tabard +3",
		legs="Leth. Fuseau +3",
		right_ear={ name="Tuisto Earring", priority=1},
	})

	sets.Midcast.Nuke = {
		main = "Bunzi's Rod",
        sub = "Ammurapi Shield",
        ammo = {
            name = "Ghastly Tathlum +1",
            augments = {'Path: A'}
        },
        head = "Leth. Chappel +3",
        body = "Lethargy Sayon +3",
        hands = "Leth. Ganth. +3",
        legs = "Leth. Fuseau +3",
        feet = "Leth. Houseaux +3",
        neck = "Sibyl Scarf",
        waist = {
            name = "Acuity Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Freke Ring",
        right_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		head = "Ea Hat +1", -- 7/(7)
        body = "Ea Houppe. +1", -- 9/(9)
        hands = {
            name = "Amalric Gages +1",
            augments = {'INT+12', 'Mag. Acc.+20', '"Mag.Atk.Bns."+20'}
        }, -- (6)
        legs = "Leth. Fuseau +3",
        feet = "Leth. Houseaux +3",
        neck = "Sibyl Scarf",
        ring2= "Mujin Band" --(5)
	})

	-- ===================================================================================================================
	--		sets.JA
	-- ===================================================================================================================

	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}}
	sets.JA["Saboteur"] = {hands = "Leth. Ganth. +3",}
	sets.JA["Spontaneity"] = {}
	sets.JA["Stymie"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {
        head = "Leth. Chappel +3",
        body = "Lethargy Sayon +3",
        hands = "Leth. Ganth. +3",
        legs = "Leth. Fuseau +3",
        feet = "Leth. Houseaux +3"
    }
	sets.JA["Tellus"] = {}
	sets.JA["Vallation"] = {
		main="Mafic Cudgel",
        sub="Genmei Shield",
        -- range="Gjallarhorn",
        head="Halitus Helm",
        body="Emet Harness +1",
        hands="Fili Manchettes +3",
        legs="Zoar Subligar +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Unmoving Collar +1",
        waist="Trance Belt",
        left_ear="Etiolation Earring",
        right_ear="Cryptic Earring",
        left_ring="Provocare Ring",
        right_ring="Supershear Ring",
        -- back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
	}
	sets.JA["Valiance"] = {
		main="Mafic Cudgel",
        sub="Genmei Shield",
        -- range="Gjallarhorn",
        head="Halitus Helm",
        body="Emet Harness +1",
        hands="Fili Manchettes +3",
        legs="Zoar Subligar +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Unmoving Collar +1",
        waist="Trance Belt",
        left_ear="Etiolation Earring",
        right_ear="Cryptic Earring",
        left_ring="Provocare Ring",
        right_ring="Supershear Ring",
        -- back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
	}
	sets.JA["Pflug"] = {
		main="Mafic Cudgel",
        sub="Genmei Shield",
        -- range="Gjallarhorn",
        head="Halitus Helm",
        body="Emet Harness +1",
        hands="Fili Manchettes +3",
        legs="Zoar Subligar +1",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Unmoving Collar +1",
        waist="Trance Belt",
        left_ear="Etiolation Earring",
        right_ear="Cryptic Earring",
        left_ring="Provocare Ring",
        right_ring="Supershear Ring",
        -- back={ name="Intarabus's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
	}

	-- ===================================================================================================================
	--		sets.WS
	-- ===================================================================================================================

	sets.WS = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		-- ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet = "Leth. Houseaux +3",
		neck = "Rep. Plat. Medal",
		waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
		right_ear = "Regal Earring",
		-- left_ear = "Sherida Earring",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
		left_ring="Sroda Ring",
		right_ring="Cornelia's Ring",
        back = {
            name = "Sucellos's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

	sets.WS.ACC = {}

	sets.WS.WSD = set_combine(sets.WS, { -- Setup for Capped Attack

	})

	sets.WS.MAB = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Leth. Houseaux +3",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
	    right_ear="Regal Earring",
		left_ring="Cornelia's Ring",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	sets.WS.CRIT = { -- Setup for Capped Attack
		ammo="Yetshila +1",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Thereoid Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Damage taken-5%',}},
	}

	sets.WS.RA = set_combine(sets.WS,{

	})

	sets.WS["Seraph Blade"] =  set_combine(sets.WS.MAB, {
		ammo="Sroda Tathlum",
		head="Leth. Chappel +3",
		neck="Fotia Gorget",
		hands="Leth. Ganth. +3",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		-- left_ring="Weather. Ring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	})

	sets.WS["Sanguine Blade"] = set_combine(sets.WS.MAB, {
		ammo="Sroda Tathlum",
        head="Pixie Hairpin +1",
        body={ name="Nyame Mail", augments={'Path: B',}},
        -- hands="Leth. Ganth. +3",
		hands="Jhakri Cuffs +2",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Leth. Houseaux +3",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	})

	sets.WS["Red Lotus Blade"] =  set_combine(sets.WS.MAB, {
		ammo="Sroda Tathlum",
		head="Leth. Chappel +3",
		neck="Sibyl Scarf",
		-- hands="Leth. Ganth. +3",
		hands="Jhakri Cuffs +2",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		-- left_ring="Weather. Ring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        back = {
            name = "Sucellos's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
	})

	sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {
		ammo = "Sroda Tathlum",
        head="Leth. Chappel +3",
		-- head = {
        --     name = "Nyame Helm",
        --     augments = {'Path: B'}
        -- },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs="Leth. Fuseau +3",
		-- legs = {
        --     name = "Nyame Flanchard",
        --     augments = {'Path: B'}
        -- },
        feet = "Leth. Houseaux +3",
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Malignance Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Freke Ring",
        right_ring = "Cornelia's Ring",
        back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	})

	sets.WS["Chant du Cygne"] = sets.WS.CRIT

	sets.WS["Savage Blade"] = sets.WS.WSD

	-- sets.WS["Black Halo"] = sets.WS.WSD {
	sets.WS["Black Halo"] = set_combine(sets.WS.WSD, {	
		ammo="Oshasha's Treatise",
		right_ear = {
            name = "Leth. Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+14', 'Mag. Acc.+14', '"Dbl.Atk."+5'}
        },
		left_ring={ 
			name="Metamor. Ring +1", 
			augments={'Path: A',}},
		hands={ name="Gazu Bracelets +1", augments={'Path: A',}}
		-- right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	})
		

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		head="Volte Cap",
	    legs="Volte Hose",
		waist="Chaac Belt",
	}

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

Enspell_Buff = false

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}

	return equipSet
end

-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}
	if buffactive['Saboteur'] and spell.skill == 'Enfeebling Magic' then
		equipSet = sets.Saboteur
	end
	-- Check if casting Thundara III and target is Aminon
    if spell.english == 'Thunder V' then
        local target = windower.ffxi.get_mob_by_target('t')
        if target and target.name and target.name:lower():find('aminon') then
            equipSet = sets.Midcast['Thunder V']
        else
            equipSet = sets.Midcast.Nuke
        end
        return equipSet
    end

	return equipSet
end

-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}
	if not buffactive['Composure'] and spell.name ~=  "Composure" then
		--add_to_chat(8,'Composure is down')
	end
	coroutine.schedule(Enspell_Check,1) -- windower is not firing buff_change correctly with Enspells and has a delay

	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}
	Enspell_Check()
	return equipSet
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}
	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}
	if player.status == "Engaged" and Enspell_Buff then
		equipSet = set_combine(equipSet, sets.Enspell)
	end
	return equipSet
end

--Function is called when a self command is issued
function self_command_custom(command)

end

-- This function is called when the job file is unloaded
function user_file_unload()

end

function Enspell_Check()
	-- Tier I
	if buffactive["Enfire"] or buffactive["Enwater"] or buffactive["Enthunder"] or buffactive["Enstone"] or buffactive["Enblizzard"] or buffactive["Enaero"] then
		Enspell_Buff = true
		send_command('gs c update auto')
	-- Tier II
	elseif buffactive["Enfire II"] or buffactive["Enwater II"] or buffactive["Enthunder II"] or buffactive["Enstone II"] or buffactive["Enblizzard II"] or buffactive["Enaero II"] then
		Enspell_Buff = true
		send_command('gs c update auto')
	else
		Enspell_Buff = false
	end
end

--Function used to automate Job Ability use
function check_buff_JA()
	buff = 'None'

	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'

	return buff
end