-- Original: Motenten / Modified: Arislan
-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------
--  Modes:      [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ CTRL+F11 ]        Cycle Casting Modes
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ ALT+` ]           Toggle Magic Burst Mode
--              [ WIN+D ]           Toggle Death Casting Mode Toggle
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Spells:     [ CTRL+` ]          Stun
--              [ ALT+P ]           Shock Spikes
--
--  Weapons:    [ CTRL+W ]          Toggles Weapon Lock
--
--  WS:         [ CTRL+Numpad0 ]    Myrkr
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    -- state.CP = M(false, "Capacity Points Mode")

    no_swap_gear = S {"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)", "Trizek Ring",
                      "Echad Ring", "Facility Ring", "Capacity Ring"}

    degrade_array = {
        ['Aspirs'] = {'Aspir', 'Aspir II', 'Aspir III'}
    }

    lockstyleset = 58

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.CastingMode:options('Normal', 'Resistant', 'Spaekona')
    state.IdleMode:options('Normal', 'DT')

    state.WeaponLock = M(false, 'Weapon Lock')
    state.MagicBurst = M(false, 'Magic Burst')
    state.DeathMode = M(false, 'Death Mode')
    state.CP = M(false, "Capacity Points Mode")

    lowTierNukes = S {'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder'}

    -- Additional local binds
    -- include('Global-Binds.lua') -- OK to remove this line
    -- include('Global-GEO-Binds.lua') -- OK to remove this line

    send_command('bind ^` input /ma Stun <t>')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind !w input /ma "Aspir III" <t>')
    send_command('bind !p input /ma "Shock Spikes" <me>')
    send_command('bind @d gs c toggle DeathMode')
    -- send_command('bind @c gs c toggle CP')
    send_command('bind @w gs c toggle WeaponLock')
    send_command('bind ^numpad0 input /Myrkr')

    select_default_macro_book()
    set_lockstyle()

    state.Auto_Kite = M(false, 'Auto_Kite')
    moving = false
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind !w')
    send_command('unbind !p')
    send_command('unbind ^,')
    send_command('unbind !.')
    send_command('unbind @d')
    -- send_command('unbind @c')
    send_command('unbind @w')
    send_command('unbind ^numpad0')

    send_command('unbind #`')
    send_command('unbind #1')
    send_command('unbind #2')
    send_command('unbind #3')
    send_command('unbind #4')
    send_command('unbind #5')
    send_command('unbind #6')
    send_command('unbind #7')
    send_command('unbind #8')
    send_command('unbind #9')
    send_command('unbind #0')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    ---- Precast Sets ----

    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {
        feet = "Wicce Sabots +3",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }

    sets.precast.JA.Manafont = {
        body = "Arch. Coat +1"
    }

    -- Fast cast sets for spells
    sets.precast.FC = {
        --    /RDM --15
        ammo = "Impatiens",
        head = {
            name = "Amalric Coif +1",
            augments = {'MP+80', 'Mag. Acc.+20', '"Mag.Atk.Bns."+20'}
        },
        body = "Agwu's Robe",
        hands = {
            name = "Agwu's Gages",
            augments = {'Path: A'}
        },
        legs = "Agwu's Slops",
        feet = "Regal Pumps +1",
        neck = {
            name = "Src. Stole +2",
            augments = {'Path: A'}
        },
        waist = "Witful Belt",
        left_ear = "Malignance Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Kishar Ring",
        right_ring = "Rahab Ring",
        back = {
            name = "Taranus's Cape",
            augments = {'MP+60', 'Mag. Acc+20 /Mag. Dmg.+20', '"Fast Cast"+10'}
        }
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash",
        back = "Perimede Cape"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        ear1 = "Mendi. Earring", -- 5
        ring1 = "Lebeche Ring" -- (2)
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {
        head = empty,
        body = "Twilight Cloak",
        waist = "Shinjutsu-no-Obi +1"
    })
    sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        waist = "Shinjutsu-no-Obi +1"
    })
    sets.precast.Storm = set_combine(sets.precast.FC, {
        ring2 = {
            name = "Stikini Ring +1",
            bag = "wardrobe4"
        }
    })

    sets.precast.FC.DeathMode = {
        ammo = "Ghastly Tathlum +1",
        head = "Amalric Coif +1", -- 11
        body = "Amalric Doublet +1",
        hands = "Merlinic Dastanas", -- 6
        legs = "Volte Brais", -- 8
        feet = "Volte Gaiters", -- 6
        neck = "Orunmila's Torque", -- 5
        ear1 = "Etiolation Earring", -- 1
        ear2 = "Loquacious Earring", -- 2
        ring1 = "Mephitas's Ring +1",
        ring2 = "Weather. Ring +1", -- 5
        back = "Bane Cape", -- 4
        waist = "Embla Sash"
    }

    sets.precast.FC.Impact.DeathMode = set_combine(sets.precast.FC.DeathMode, {
        head = empty,
        body = "Twilight Cloak",
        waist = "Shinjutsu-no-Obi +1"
    })

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        -- ammo="Floestone",
        head = "Jhakri Coronal +2",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = gear.Telchine_ENH_legs,
        feet = "Jhakri Pigaches +2",
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Telos Earring",
        ring1 = "Epaminondas's Ring",
        ring2 = "Shukuyu Ring",
        back = "Relucent Cape",
        waist = "Fotia Belt"
    }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Vidohunir'] = {
        ammo = "Ghastly Tathlum +1",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck = {
            name = "Src. Stole +2",
            augments = {'Path: A'}
        },
        ear1 = "Malignance Earring",
        ear2 = "Moonshade Earring",
        ring1 = "Cornelia's Ring",
        ring2 = "Freke Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
        waist = "Orpheus's Sash"
    } -- INT

    sets.precast.WS['Myrkr'] = {
        ammo = "Ghastly Tathlum +1",
        head = "Amalric Coif +1",
        neck = "Sanctity Necklace",
        ear1 = "Loquacious Earring",
        ear2 = "Etiolation Earring",
        body = "Rosette Jaseran +1",
        hands = "Spaekona's Gloves +3",
        ring1 = "Metamorph Ring +1",
        ring2 = "Mephitas's Ring +1",
        back = {
            name = "Taranus's Cape",
            augments = {'MP+60', 'Mag. Acc+20 /Mag. Dmg.+20', '"Fast Cast"+10'}
        },
        waist = "Shinjutsu-no-Obi +1",
        legs = "Spaekona's Tonban +3",
        feet = "Merlinic Crackows"
    } -- Max MP

    ---- Midcast Sets ----

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {
        main = "Raetic Rod +1", -- 30
        sub = "Sors Shield", -- 3/(-5)
        ammo = "Staunch Tathlum",
        head = "Vanya Hood", -- 10
        neck = "Incanter's Torque",
        ear1 = "Mendicant's Earring", -- 5
        ear2 = "Magnetic Earring",
        body = "Vrikodara Jupon", -- 13
        hands = "Wicce Gloves +3",
        ring1 = "Menelaus's Ring", -- 5
        ring2 = "Defending Ring",
        back = "Solemnity Cape", -- 10
        waist = "Luminary Sash",
        legs = "Doyen Pants",
        feet = "Vanya Clogs" -- 5
    }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        neck = "Nuna Gorget +1",
        ring1 = {
            name = "Stikini Ring +1",
            bag = "wardrobe3"
        },
        ring2 = "Metamor. Ring +1",
        waist = "Luminary Sash"
    })

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        main = gear.Gada_ENH,
        sub = "Genmei Shield",
        head = "Vanya Hood",
        body = "Vanya Robe",
        hands = "Hieros Mittens",
        feet = "Vanya Clogs",
        neck = "Debilis Medallion",
        ear1 = "Beatific Earring",
        ear2 = "Meili Earring",
        ring1 = "Menelaus's Ring",
        ring2 = "Haoma's Ring"
    })

    sets.midcast['Enhancing Magic'] = {
        main = {
            name = "Gada",
            augments = {'Enh. Mag. eff. dur. +5', 'VIT+2'}
        },
        sub = "Ammurapi Shield",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
        legs = "Agwu's Slops",
        feet = "Wicce Sabots +3",
        neck = "Incanter's Torque",
        ear1 = "Mimir Earring",
        ear2 = "Andoaa Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Perimede Cape",
        waist = "Olympus Sash"
    }

    sets.midcast.EnhancingDuration = {
        main = {
            name = "Gada",
            augments = {'Enh. Mag. eff. dur. +5', 'VIT+2'}
        },
        sub = "Ammurapi Shield",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +5',}},
        neck = "Incanter's Torque",
        ear1 = "Mimir Earring",
        ear2 = "Andoaa Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Perimede Cape",
        waist = "Embla Sash"
    }

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        head = gear.Telchine_ENH_head,
        body = gear.Telchine_ENH_body,
        hands = gear.Telchine_ENH_hands,
        legs = gear.Telchine_ENH_legs,
        feet = gear.Telchine_ENH_feet
    })

    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        head = "Amalric Coif +1",
        -- feet="Inspirited Boots",
        waist = "Gishdubar Sash",
        back = "Grapevine Cape"
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration, {
        neck = "Nodens Gorget",
        waist = "Siegel Sash",
        left_ear = "Earthcry Earring",
        legs="Shedir Seraweels",
    })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        main = "Vadose Rod",
        sub = "Ammurapi Shield",
        ammo = "Staunch Tathlum",
        head = "Amalric Coif +1",
        hands = "Regal Cuffs",
        legs="Shedir Seraweels",
        ear1 = "Halasz Earring",
        ring1 = "Freke Ring",
        ring2 = "Evanescence Ring",
        waist = "Emphatikos Rope"
    })

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {
        ring1 = "Sheltered Ring"
    })
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect

    sets.midcast.MndEnfeebles = {
        main={ name="Contemplator +1", augments={'Path: A',}},
        sub="Khonsu",
        ammo = "Pemphredo Tathlum",
        head = "Wicce Petasos +3",
        neck = "Sorcerer's Stole +2",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Spaekona's Coat +2",
        hands = "Spaekona's Gloves +3",
        ring1 = "Stikini Ring +1",
        ring2 = "Metamorph Ring +1",
        back = "Aurist's Cape +1",
        waist = "Acuity Belt +1",
        legs = "Spaekona's Tonban +3",
        feet = "Archmage's Sabots +3"
    } -- MND/Magic accuracy

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        main = "Maxentius",
        sub = "Ammurapi Shield",
        waist = "Acuity Belt +1"
    }) -- INT/Magic accuracy

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.MndEnfeebles, {
        legs = "Archmage's Tonban +3",
        feet = "Archmage's Sabots +3",
        hands = "Spaekona's Gloves +3"
    })
    
    sets.midcast.Dispelga = set_combine(sets.midcast.IntEnfeebles, {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        waist = "Shinjutsu-no-Obi +1"
    })

    sets.midcast['Dark Magic'] = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Pemphredo Tathlum",
        head = "Agwu's Cap",
        body = "Wicce Coat +3",
        hands = "Archmage's Gloves +2",
        legs = "Spaekona's Tonban +3",
        feet = "Agwu's Pigaches",
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Damage taken-5%'}
        },
        waist = "Fucho-no-obi",
    }

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        ammo = "Pemphredo Tathlum",
        head = "Agwu's Cap",
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        body = "Wicce Coat +3",
        hands = "Archmage's Gloves +2",
        ring1 = "Evanescence Ring",
        ring2 = "Metamorph Ring +1",
        back = "Aurist's Cape +1",
        waist = "Fucho-no-obi",
        legs = "Spaekona's Tonban +3",
        feet = "Agwu's Pigaches"
    })

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {
        ammo = "Pemphredo Tathlum",
        head = "Amalric Coif +1",
        neck = "Erra Pendant",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        ring1 = "Kishar Ring",
        ring2 = "Stikini Ring +1",
        back = {
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Damage taken-5%'}
        },
        waist = "Acuity Belt +1",
        legs = "Agwu's Slops",
        feet = "Agwu's Pigaches"
    }    

    sets.midcast.Death = {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub = "Enki Strap",
        ammo = "Sapience Orb",
        head = "Amalric Coif +1",
        neck = "Sanctity Necklace",
        ear2 = "Etiolation Earring",
        ear1 = "Loquac. Earring",
        body = "Rosette Jaseran +1", -- 5
        hands = "Agwu's Gages",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Medada's Ring",
        back = {
            name = "Taranus's Cape",
            augments = {'MP+60', 'Mag. Acc+20 /Mag. Dmg.+20', '"Fast Cast"+10'}
        },
        waist = "Shinjutsu-no-Obi +1", -- 5,
        legs = "Agwu's Slops",
        feet = "Amalric Nails +1"
    }

    sets.midcast.Death.Resistant = set_combine(sets.midcast.Death, {
        main = gear.Grioavolr_MB,
        sub = "Enki Strap",
        head = "Amalric Coif +1",
        waist = "Acuity Belt +1"
    })

    -- Elemental Magic sets

    sets.midcast['Elemental Magic'] = {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = "Wicce Petasos +3",
        body = "Wicce Coat +3",
        hands = "Wicce Gloves +3",
        legs = "Wicce Chausses +3",
        feet = "Wicce Sabots +3",
        neck = {
            name = "Src. Stole +2",
            augments = {'Path: A'}
        },
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
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Damage taken-5%'}
        }
    }

    sets.midcast['Elemental Magic'].DeathMode = set_combine(sets.midcast['Elemental Magic'], {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub = "Enki Strap",
        ammo = "Ghastly Tathlum +1",
        legs = "Amalric Slops +1",
        feet = "Merlinic Crackows",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    })

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub="Khonsu",
        ammo="Pemphredo Tathlum",
        head="Wicce Petasos +3",
        body="Wicce Coat +3",
        hands="Wicce Gloves +3",
        legs="Wicce Chausses +3",
        feet="Spaekona's Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    })

    sets.midcast['Elemental Magic'].Spaekona = set_combine(sets.midcast['Elemental Magic'], {
        sub = "Khonsu",
        ammo = "Pemphredo Tathlum",
        body = "Spaekona's Coat +2",
        legs = "Merlinic Shalwar",
        feet = "Merlinic Crackows",
        neck = "Erra Pendant",
        right_ear={ name="Wicce Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+15','Enmity-5',}},
    })

    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head = empty,
        body = "Twilight Cloak",
        ring2 = "Archon Ring"
    })

    sets.midcast.Impact.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
        sub = "Khonsu",
        head = empty,
        body = "Twilight Cloak"
    })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    sets.resting = {
        main = "Chatoyant Staff",
        waist = "Shinjutsu-no-Obi +1"
    }

    -- Idle sets

    sets.idle = {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub="Enki Strap",
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Wicce Petasos +3",
        body="Wicce Coat +3",
        hands="Wicce Gloves +3",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet="Wicce Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Etiolation Earring",
        left_ring="Stikini Ring +1",
        right_ring="Shneddick Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }

    sets.idle.DT = set_combine(sets.idle, {
        main = "Daybreak",
        sub = "Genmei Shield", -- 10/0
        ammo = "Staunch Tathlum +1", -- 3/3
        head = "Volte Beret",
        body = "Mallquis Saio +2", -- 8/8
        hands = "Raetic Bangles +1",
        feet = "Volte Gaiters",
        neck = "Loricate Torque +1", -- 6/6
        ear1 = "Sanare Earring",
        ear2 = "Lugalbanda Earring",
        ring1 = "Gelatinous Ring +1", -- 7/(-1)
        ring2 = "Defending Ring", -- 10/10
        back = "Moonlight Cape", -- 6/6
        waist = "Carrier's Sash"
    })

    sets.idle.ManaWall = {
        feet = "Wicce Sabots +3",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }

    sets.idle.DeathMode = {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub = "Khonsu",
        ammo = "Ghastly Tathlum +1",
        head = "Pixie Hairpin +1",
        body = "Amalric Doublet +1",
        hands = "Amalric Gages",
        legs = "Amalric Slops +1",
        feet = "Merlinic Crackows",
        neck = "Sanctity Necklace",
        ear1 = "Malignance Earring",
        ear2 = "Regal Earring",
        ring1 = "Mephitas's Ring +1",
        ring2 = "Mephitas's Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
        waist = "Shinjutsu-no-Obi +1"
    }

    sets.idle.Town = set_combine(sets.idle, {
        main={ name="Laevateinn", augments={'Path: A',}},
        sub = "Enki Strap",
        ammo = "Pemphredo Tathlum",
        head = "Wicce Petasos +3",
        body = "Wicce Coat +3",
        hands = "Wicce Gloves +3",
        legs = "Wicce Chausses +3",
        feet = "Wicce Sabots +3",
        neck = {
            name = "Src. Stole +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Acuity Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Regal Earring",
        right_ear = "Malignance Earring",
        left_ring = "Shneddick Ring",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Taranus's Cape",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'INT+10', '"Mag.Atk.Bns."+10', 'Damage taken-5%'}
        }
    })

    -- Defense sets

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {
        feet = "Herald's Gaiters"
    }
    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_dt = {
        ear2 = "Sorcerer's Earring"
    }

    sets.magic_burst = {
        -- main={ name="Marin Staff +1", augments={'Path: A',}},
        main={ name="Laevateinn", augments={'Path: A',}},
        -- sub="Enki Strap",
        sub="Alber Strap",
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Ea Hat +1",
        body="Wicce Coat +3",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs="Wicce Chausses +3",
        feet="Wicce Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist={ name="Acuity Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }

    sets.magic_burst.Resistant = {
        feet = "Merlinic Crackows", -- 11
        neck = "Sanctity Necklace"
    }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group

    sets.engaged = {
        main = "Maxentius",
        sub = "Ammurapi Shield",
        ammo="Oshasha's Treatise",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck = "Combatant's Torque",
        waist="Olseni Belt",
        left_ear="Telos Earring",
        right_ear="Cessance Earring",
        left_ring="Chirich Ring +1",
        right_ring="Petrov Ring",
        back={ name="Taranus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}
    sets.buff.Doom = {
        neck = "Nicander's Necklace", -- 20
        ring1 = {
            name = "Eshmun's Ring",
            bag = "wardrobe3"
        }, -- 20
        ring2 = {
            name = "Eshmun's Ring",
            bag = "wardrobe4"
        }, -- 20
        waist = "Gishdubar Sash" -- 10
    }

    sets.DarkAffinity = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }
    sets.Obi = {
        waist = "Hachirin-no-Obi"
    }
    -- sets.CP = {back="Mecisto. Mantle"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' and state.DeathMode.value then
        eventArgs.handled = true
        equip(sets.precast.FC.DeathMode)
        if spell.english == "Impact" then
            equip(sets.precast.FC.Impact.DeathMode)
        end
    end
    if spell.name:startswith('Aspir') then
        refine_various_spells(spell, action, spellMap, eventArgs)
    end
    if buffactive['Mana Wall'] then
        equip(sets.precast.JA['Mana Wall'])
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' and state.DeathMode.value then
        eventArgs.handled = true
        if spell.skill == 'Elemental Magic' then
            equip(sets.midcast['Elemental Magic'].DeathMode)
        else
            if state.CastingMode.value == "Resistant" then
                equip(sets.midcast.Death.Resistant)
            else
                equip(sets.midcast.Death)
            end
        end
    end

    if buffactive['Mana Wall'] then
        equip(sets.precast.JA['Mana Wall'])
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enhancing Magic' and classes.NoSkillSpells:contains(spell.english) and not state.DeathMode.value then
        equip(sets.midcast.EnhancingDuration)
        if spellMap == 'Refresh' then
            equip(sets.midcast.Refresh)
        end
    end
    if spell.skill == 'Elemental Magic' and spell.english == "Comet" then
        equip(sets.DarkAffinity)
    end
    if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value and spell.english ~= 'Death' then
            -- if state.CastingMode.value == "Resistant" then
            -- equip(sets.magic_burst.Resistant)
            -- else
            equip(sets.magic_burst)
            -- end
            if spell.english == "Impact" then
                equip(sets.midcast.Impact)
            end
        end
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end
    if buffactive['Mana Wall'] then
        equip(sets.precast.JA['Mana Wall'])
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == "Sleep II" or spell.english == "Sleepga II" then
            send_command('@timers c "Sleep II [' .. spell.target.name .. ']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep [' .. spell.target.name .. ']" 60 down spells/00253.png')
        elseif spell.english == "Break" or spell.english == "Breakga" then
            send_command('@timers c "Break [' .. spell.target.name .. ']" 30 down spells/00255.png')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock armor when Mana Wall buff is lost.
    if buff == "Mana Wall" then
        if gain then
            -- send_command('gs enable all')
            equip(sets.precast.JA['Mana Wall'])
            -- send_command('gs disable all')
        else
            -- send_command('gs enable all')
            handle_equipping_gear(player.status)
        end
    end

    if buff == "doom" then
        if gain then
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
            disable('ring1', 'ring2', 'waist')
        else
            enable('ring1', 'ring2', 'waist')
            handle_equipping_gear(player.status)
        end
    end

end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main', 'sub')
    else
        enable('main', 'sub')
    end
end

-- latent DT set auto equip on HP% change
windower.register_event('hpp change', function(new, old)
    if new <= 25 then
        equip(sets.latent_dt)
    end
end)

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    check_moving()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.DeathMode.value then
        idleSet = sets.idle.DeathMode
    end
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if player.hpp <= 25 then
        idleSet = set_combine(idleSet, sets.latent_dt)
    end
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end
    if buffactive['Mana Wall'] then
        idleSet = set_combine(idleSet, sets.precast.JA['Mana Wall'])
    end
    if state.Auto_Kite.value == true then
        idleSet = set_combine(idleSet, sets.Kiting)
    end

    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if buffactive['Mana Wall'] then
        meleeSet = set_combine(meleeSet, sets.precast.JA['Mana Wall'])
    end

    return meleeSet
end

function customize_defense_set(defenseSet)
    if buffactive['Mana Wall'] then
        defenseSet = set_combine(defenseSet, sets.precast.JA['Mana Wall'])
    end

    return defenseSet
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)

    local c_msg = state.CastingMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.MagicBurst.value then
        msg = ' Burst: On |'
    end
    if state.DeathMode.value then
        msg = msg .. ' Death: On |'
    end
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(060,
        '| Magic: ' .. string.char(31, 001) .. c_msg .. string.char(31, 002) .. ' |' .. string.char(31, 004) ..
            ' Defense: ' .. string.char(31, 001) .. d_msg .. string.char(31, 002) .. ' |' .. string.char(31, 008) ..
            ' Idle: ' .. string.char(31, 001) .. i_msg .. string.char(31, 002) .. ' |' .. string.char(31, 002) .. msg)

    eventArgs.handled = true
end

function refine_various_spells(spell, action, spellMap, eventArgs)
    local aspirs = S {'Aspir', 'Aspir II', 'Aspir III'}

    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All ' .. spell.english .. ' are on cooldown. Cancelling.'

    local spell_index

    if spell_recasts[spell.recast_id] > 0 then
        if aspirs:contains(spell.name) then
            spell_index = table.find(degrade_array['Aspirs'], spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aspirs'][spell_index - 1]
                send_command('@input /ma ' .. newSpell .. ' ' .. tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(cmdParams[4]) == 'string' then
            if cmdParams[4] == 'true' then
                moving = true
            elseif cmdParams[4] == 'false' then
                moving = false
            end
        end
        if not midaction() then
            job_update()
        end
    end
end

function check_moving()
    if state.DefenseMode.value == 'None' and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function check_gear()
    if no_swap_gear:contains(player.equipment.left_ring) then
        disable("ring1")
    else
        enable("ring1")
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        disable("ring2")
    else
        enable("ring2")
    end
end

windower.register_event('zone change', function()
    if no_swap_gear:contains(player.equipment.left_ring) then
        enable("ring1")
        equip(sets.idle)
    end
    if no_swap_gear:contains(player.equipment.right_ring) then
        enable("ring2")
        equip(sets.idle)
    end
end)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 5)
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
