function get_sets()
    mote_include_version = 2
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    -- include('organizer-lib')
end

function job_setup()
    state.CapacityMode = M(false, 'Capacity Point Mantle')

    -- state.Buff.Berserk = buffactive.berserk or false
    -- state.Buff.Retaliation = buffactive.retaliation or false

    elemental_ws = S {'Aeolian Edge', "Cloudsplitter", "Shadow of Death", "Cataclysm", "Sanguine Blade"}
    WSDlist = S {"King's Justice", "Fell Cleave", 'Steel Cyclone', "Calamity", "Mistral Axe", "Impulse Drive",
                 "Sonic Thrust", "Retribution", "Spiral Hell", "Entropy", "Ground Strike", "Judgement", "Black Halo"}
    MultiAtklist = S {"Stardiver", "Dragon Kick", "Tornado Kick", "Raging Fists"}
    CMultilist = S {"Rampage", "Vorpal Blade", "Hexa Strike", "Evisceration"}
    MACClist = S {"Full Break", "Armor Break", "Shield Break", "Weapon Break", "Shockwave"}
    Set1List = S {}
    Set2List = S {"Ukonvasara", "Shining One", "Raetic Algol"} -- 134 tp/hit
    Set3List = S {"Quint Spear"}
    sub_weapons = S {"Sangarius +1", "Perun", "Kaja Axe", "Reikiko", "Firangi", "Naegling", "Infiltrator", "Fernagu"}
    sam_sj = player.sub_job == 'SAM' or false

    get_combat_form()
    get_combat_weapon()
    update_melee_groups()

    lockstyleset = 198

end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
-- not set:alt F9 is range mode
function user_setup()
    -- Options: Override default values
    state.OffenseMode:options('Normal', 'Mid', 'Acc', 'SubtleBlow', 'Crit') -- F9
    state.HybridMode:options('Normal', 'PDT') -- ctrl F9
    state.WeaponskillMode:options('Normal', 'Mid', 'Acc', 'PDL') -- wind F9
    state.CastingMode:options('Normal') -- ctrl F11
    state.IdleMode:options('Normal') -- alt F10
    state.RestingMode:options('Normal') -- ctrl F12
    state.PhysicalDefenseMode:options('PDT', 'DT', 'Reraise') -- F10 enters mode/ctrl F10 changes option/F12 reset
    state.MagicalDefenseMode:options('MDT') -- F11 enters mode/

    state.drain = M(false)

    -- Additional local binds
    send_command('bind != gs c toggle CapacityMode')
    send_command('bind ^` input /ja "Hasso" <me>') -- ^ means cntrl
    send_command('bind !` input /ja "Seigan" <me>') -- ! means alt

    select_default_macro_book()

    set_lockstyle()
end

-- Called when this job file is unloaded (eg: job change)
function file_unload()
    send_command('unbind ^`')
    send_command('unbind !=')
    send_command('unbind ^[')
    send_command('unbind ![')
    send_command('unbind @f9')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    -- Enmity set
    sets.Enmity = {
        ammo = "Aqreqaq Bomblet",
        head = "Pummeler's Mask +3",
        body = {
            name = "Souveran Cuirass",
            augments = {'HP+80', 'Enmity+7', 'Potency of "Cure" effect received +10%'}
        },
        hands = "Pumm. Mufflers +2",
        legs = "Brontes Cuisses",
        feet = "Eschite Greaves",
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Trance Belt",
        left_ear = "Cryptic Earring",
        right_ear = "Trux Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Supershear Ring",
        back = "Enuma Mantle"
    }

    sets.precast.JA['Provoke'] = sets.Enmity

    sets.precast.JA['Mighty Strikes'] = {
        hands = "Agoge Mufflers"
    }
    sets.precast.JA['Blood Rage'] = {
        body = "Ravager's Lorica +1"
    }
    sets.precast.JA['Warcry'] = {
        head = "Agoge Mask +3"
    }
    sets.precast.JA['Berserk'] = {
        body = "Pumm. Lorica +3",
        feet = "Agoge Calligae +2"
    }
    sets.precast.JA['Tomahawk'] = {
        feet = "Agoge Calligae +2"
    }
    sets.precast.JA["Warrior's Charge"] = {
        legs = {
            name = "Agoge Cuisses +1",
            augments = {'Enhances "Warrior\'s Charge" effect'}
        }
    }
    sets.precast.JA['Restraint'] = {
        hands = "Boii Mufflers +3"
    }
    sets.precast.JA['Retaliation'] = {
        hands = "Pummeler's Mufflers +2",
        feet = "Boii Calligae +3"
    }
    sets.precast.JA['Aggressor'] = {
        body = "Agoge Lorica +3",
        head = "Pummeler's Mask +3"
    }
    sets.precast.JA['Jump'] = {
        body = "Agoge Lorica +3",
        head = "Pummeler's Mask +3"
    }
    sets.precast.JA['High Jump'] = {
        body = "Agoge Lorica +3",
        head = "Pummeler's Mask +3"
    }

    -- Magic sets
    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo = "Sapience Orb",
        head = "Sakpata's Helm",
        body = "Sakpata's Breastplate",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = "Arjuna Breeches",
        feet = "Odyssean Greaves",
        neck = "Voltsurge Torque",
        waist = "Audumbla Sash",
        left_ear = "Loquac. Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = "Solemnity Cape"
    }

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {
        ammo = "Staunch Tathlum +1",
        legs = "Jokushu Haidate"
    })

    sets.midcast.Utsusemi = {
        ammo = "Staunch Tathlum +1",
        head = "Sakpata's Helm",
        body = "Sakpata's Breastplate",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = "Arjuna Breeches",
        feet = "Odyssean Greaves",
        neck = "Voltsurge Torque",
        waist = "Audumbla Sash",
        left_ear = "Loquac. Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring",
        back = "Solemnity Cape"
    }

    -- WS sets

    -- General WS set
    sets.precast.WS = {
        ammo = "Knobkierrie",
        head = "Agoge Mask +3",
        body = "Sakpata's Breastplate",
        hands = "Boii Mufflers +3",
        legs = "Boii Cuisses +3",
        feet = "Sakpata's Leggings",
        neck = "Warrior's Bead Necklace +2",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS.Mid = set_combine(sets.precast.WS, {
        legs = "Pumm. Cuisses +3"
    })

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        legs = "Pummeler's Cuisses +3",
        feet = "Pummeler's Calligae +3"
    })

    sets.precast.WS.PDL = set_combine(sets.precast.WS, {
        ammo = "Knobkierrie",
        head = "Agoge Mask +3",
        body = "Sakpata's Plate",
        hands = "Boii Mufflers +3",
        legs = "Boii Cuisses +3",
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Warrior's Bead Necklace +2",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Sroda Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    })

    sets.MACC = set_combine(sets.precast.WS, {
        -- ammo = "Pemphredo Tathlum",
        -- head = "Flam. Zucchetto +2",
        -- body = "Flamma Korazin +2",
        -- hands = "Flamma Manopolas +2",
        -- legs = "Flamma Dirs +2",
        -- feet = "Flamma Gambieras +2",
        -- neck = "Sanctity Necklace",
        -- waist = "Eschan Stone",
        -- left_ear = "Thrud Earring",
        -- right_ear = "Moonshade Earring",
        -- left_ring = "Flamma Ring",
        -- right_ring = "Niqmaddu Ring",
        -- back = {
        --     name = "Cichol's Mantle",
        --     augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        -- }
    })

    -- sets.MACC.Mid = sets.MACC
    -- sets.MACC.Acc = sets.MACC

    sets.WSD = set_combine(sets.precast.WS, {
        -- ammo = "Knobkierrie",
        -- head = "Agoge Mask +3",
        -- body = "Sakpata's Breastplate",
        -- -- body = "Pumm. Lorica +3",
        -- -- hands = "Sakpata's Gauntlets",
        -- hands = "Boii Mufflers +3",
        -- legs = "Boii Cuisses +3",
        -- -- feet = "Sulevia's Leggings +2",
        -- feet = "Sakpata's Leggings",
        -- neck = "Warrior's Bead Necklace +2",
        -- waist = "Sailfi Belt +1",
        -- left_ear = "Thrud Earring",
        -- right_ear = "Moonshade Earring",
        -- left_ring = "Regal Ring",
        -- right_ring = "Cornelia's Ring",
        -- back = {
        --     name = "Cichol's Mantle",
        --     augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        -- }
        ammo = "Knobkierrie",
        head = "Agoge Mask +3",
        body = "Sakpata's Breastplate",
        -- hands = "Sakpata's Gauntlets",
        hands = "Boii Mufflers +3",
        legs = "Boii Cuisses +3",
        -- feet = "Sulevia's Leggings +2",
        feet = "Sakpata's Leggings",
        neck = "Warrior's Bead Necklace +2",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    })

    sets.WSDMid = set_combine(sets.WSD, {
        legs = "Pumm. Cuisses +3"
    })
    sets.WSDAcc = set_combine(sets.WSD, {
        legs = "Pummeler's Cuisses +3",
        feet = "Pummeler's Calligae +3"
    })

    sets.MultiAtk = set_combine(sets.precast.WS, {
        ammo = "Coiste Bodhar",
        head = "Sakpata's Helm",
        body = "Sakpata's Breastplate",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Boii Cuisses +3",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10'}
        }
    })

    -- sets.MultiAtkMid = set_combine(sets.MultiAtk, {
    --     legs = "Pumm. Cuisses +3"
    -- })
    -- sets.MultiAtkAcc = set_combine(sets.MultiAtk, {
    --     legs = "Pummeler's Cuisses +3",
    --     feet = "Pummeler's Calligae +3"
    -- })

    sets.CMulti = set_combine(sets.precast.WS, {
        -- ammo = "Yetshila +1",
        -- head = "Flam. Zucchetto +2",
        -- body = "Tatenashi Haramaki +1",
        -- hands = "Sakpata's Gauntlets",
        -- legs = "Sakpata's Cuisses",
        -- feet = "Boii Calligae +1",
        -- neck = "Fotia Gorget",
        -- waist = "Fotia Belt",
        -- left_ear = "Moonshade Earring",
        -- right_ear = "Schere Earring",
        -- left_ring = "Regal Ring",
        -- right_ring = "Niqmaddu Ring",
        -- back = {
        --     name = "Cichol's Mantle",
        --     augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10'}
        -- }
    })

    -- sets.CMultiMid = set_combine(sets.CMulti, {
    --     legs = "Pumm. Cuisses +3"
    -- })
    -- sets.CMultiAcc = set_combine(sets.CMulti, {
    --     legs = "Pumm. Cuisses +3"
    -- })

    -- Great Axe
    sets.precast.WS['Upheaval'] = {
        ammo = "Knobkierrie",
        head = {
            name = "Agoge Mask +3",
            augments = {'Enhances "Savagery" effect'}
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
            augments = "Path: B"
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.precast.WS['Upheaval'].PDL = set_combine(sets.precast.WS['Upheaval'], {
        ammo = "Knobkierrie",
        head = {
            name = "Agoge Mask +3",
            augments = {'Enhances "Savagery" effect'}
        },
        body = "Sakpata's Plate",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Nyame Flanchard",
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    -- sets.precast.WS['Upheaval'].Mid = set_combine(sets.precast.WS['Upheaval'], {
    -- legs="Pumm. Cuisses +3",
    -- })

    -- sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS['Upheaval'], {
    -- hands="Sakpata's Gauntlets",
    -- legs="Pumm. Cuisses +3",
    -- })

    sets.precast.WS["Ukko's Fury"] = {
        ammo = "Yetshila +1",
        head = "Boii Mask +3",
        body = "Hjarrandi Breastplate",
        hands = "Flamma Manopolas +2",
        legs = "Boii Cuisses +3",
        feet = "Boii Calligae +3",
        neck = {
            name = "War. Beads +2",
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
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS["Raging Rush"] = {
        ammo = {
            name = "Seeth. Bomblet +1",
            augments = {'Path: A'}
        },
        head = "Sakpata's Helm",
        body = "Sakpata's Plate",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Pumm. Cuisses +3",
        feet = "Pumm. Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Genmei Earring",
        right_ear = "Thrud Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS["King's Justice"] = {
        ammo = "Knobkierrie",
        head = {
            name = "Agoge Mask +3",
            augments = {'Enhances "Savagery" effect'}
        },
        body = "Pumm. Lorica +3",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Sakpata's Cuisses",
        feet = "Sulev. Leggings +2",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Beithir Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    -- sets.precast.WS["King's Justice"].Mid = set_combine(sets.precast.WS["King's Justice"], {
    -- legs="Pumm. Cuisses +3",
    -- })
    -- sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS["King's Justice"], {
    -- hands="Sakpata's Gauntlets",
    -- legs="Pumm. Cuisses +3",
    -- })

    sets.precast.WS['Steel Cyclone'] = sets.WSD
    sets.precast.WS['Steel Cyclone'].Mid = sets.WSDMid
    sets.precast.WS['Steel Cyclone'].Acc = sets.WSDAcc

    sets.precast.WS['Fell Cleave'] = sets.WSD
    sets.precast.WS['Fell Cleave'].Mid = sets.WSDMid
    sets.precast.WS['Fell Cleave'].Acc = sets.WSDAcc

    sets.precast.WS['Full Break'] = sets.MACC
    sets.precast.WS['Full Break'].Mid = sets.MACC
    sets.precast.WS['Full Break'].Acc = sets.MACC

    sets.precast.WS['Armor Break'] = sets.MACC
    sets.precast.WS['Armor Break'].Mid = sets.MACC
    sets.precast.WS['Armor Break'].Acc = sets.MACC

    sets.precast.WS['Weapon Break'] = sets.MACC
    sets.precast.WS['Weapon Break'].Mid = sets.MACC
    sets.precast.WS['Weapon Break'].Acc = sets.MACC

    sets.precast.WS['Shield Break'] = sets.MACC
    sets.precast.WS['Shield Break'].Mid = sets.MACC
    sets.precast.WS['Shield Break'].Acc = sets.MACC

    -- Polearm
    sets.precast.WS['Impulse Drive'] = {
        head = {
            name = "Agoge Mask +3",
            augments = {'Enhances "Savagery" effect'}
        },
        -- body = "Pumm. Lorica +3",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        -- hands = {
        --     name = "Sakpata's Gauntlets",
        --     augments = {'Path: A'}
        -- },\
        hands = "Boii Mufflers +3",
        -- legs = "Sakpata's Cuisses",
        legs = "Boii Cuisses +3",
        -- feet = "Sulev. Leggings +2",
        feet = "Boii Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }
    sets.precast.WS['Impulse Drive'].Mid = sets.WSDMid
    sets.precast.WS['Impulse Drive'].Acc = sets.WSDAcc

    sets.precast.WS['Stardiver'] = sets.MultiAtk
    sets.precast.WS['Stardiver'].Mid = sets.MultiAtkMid
    sets.precast.WS['Stardiver'].Acc = sets.MultiAtkAcc

    sets.precast.WS['Sonic Thrust'] = sets.WSD
    sets.precast.WS['Sonic Thrust'].Mid = sets.WSDMid
    sets.precast.WS['Sonic Thrust'].Acc = sets.WSDAcc

    -- Axe

    sets.precast.WS['Decimation'] = set_combine(sets.MultiAtk, {
        left_ear = "Brutal Earring"
    })
    sets.precast.WS['Decimation'].Mid = set_combine(sets.MultiAtkMid, {
        left_ear = "Brutal Earring"
    })
    sets.precast.WS['Decimation'].Acc = set_combine(sets.MultiAtkAcc, {
        left_ear = "Brutal Earring"
    })

    sets.precast.WS['Ruinator'] = sets.precast.WS['Decimation']
    sets.precast.WS['Ruinator'].Mid = sets.precast.WS['Decimation'].Mid
    sets.precast.WS['Ruinator'].Acc = sets.precast.WS['Decimation'].Acc

    sets.precast.WS['Mistral Axe'] = sets.WSD
    sets.precast.WS['Mistral Axe'].Mid = sets.WSDMid
    sets.precast.WS['Mistral Axe'].Acc = sets.WSDAcc

    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, {
        ammo = "Knobkierrie",
        head = "Agoge Mask +3",
        body = "Pumm. Lorica +3",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        -- legs = OdysseanLegs.Magic,
        -- feet = OdysseanFeet.Magic,
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    })

    sets.precast.WS['Rampage'] = sets.CMulti
    sets.precast.WS['Rampage'].Mid = sets.CMultiMid
    sets.precast.WS['Rampage'].Acc = sets.CMultiAcc

    -- Club
    -- sets.precast.WS['Judgement'] = set_combine(sets.precast.WS, {
    --     ammo = "Knobkierrie",
    --     head = "Agoge Mask +3",
    --     body = "Sakpata's Breastplate",
    --     -- hands = "Sakpata's Gauntlets",
    --     hands = "Boii Mufflers +3",
    --     legs = "Boii Cuisses +3",
    --     -- feet = "Sulevia's Leggings +2",
    --     feet = "Sakpata's Leggings",
    --     neck = "Warrior's Bead Necklace +2",
    --     waist = "Sailfi Belt +1",
    --     left_ear = "Thrud Earring",
    --     right_ear = "Moonshade Earring",
    --     left_ring = "Regal Ring",
    --     right_ring = "Cornelia's Ring",
    --     back = {
    --         name = "Cichol's Mantle",
    --         augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
    --     }
    -- })
    sets.precast.WS['Judgement'] = sets.WSD
    sets.precast.WS['Judgement'].Mid = sets.WSDMid
    sets.precast.WS['Judgement'].Acc = sets.WSDAcc

    sets.precast.WS['Black Halo'] = sets.WSD
    sets.precast.WS['Black Halo'].Mid = sets.WSDMid
    sets.precast.WS['Black Halo'].Acc = sets.WSDAcc

    sets.precast.WS['Hexa Strike'] = sets.CMulti
    sets.precast.WS['Hexa Strike'].Mid = sets.CMultiMid
    sets.precast.WS['Hexa Strike'].Acc = sets.CMultiAcc

    -- Staff
    sets.precast.WS['Retribution'] = sets.WSD
    sets.precast.WS['Retribution'].Mid = sets.WSDMid
    sets.precast.WS['Retribution'].Acc = sets.WSDAcc

    sets.precast.WS['Cataclysm'] = {
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
        neck = "Baetyl Pendant",
        waist = "Fotia Belt",
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    -- Scythe
    sets.precast.WS['Spiral Hell'] = sets.WSD
    sets.precast.WS['Spiral Hell'].Mid = sets.WSDMid
    sets.precast.WS['Spiral Hell'].Acc = sets.WSDAcc

    -- make seperate set
    sets.precast.WS['Entropy'] = sets.MultiAtk
    sets.precast.WS['Entropy'].Mid = sets.MultiAtkMid
    sets.precast.WS['Entropy'].Acc = sets.MultiAtkAcc

    sets.precast.WS['Shadow of Death'] = set_combine(sets.precast.WS, {
        ammo = "Knobkierrie",
        head = "Pixie Hairpin +1",
        body = "Pumm. Lorica +3",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        -- legs = OdysseanLegs.Magic,
        -- feet = OdysseanFeet.Magic,
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    })

    -- sets.precast.WS['Infernal Scythe']

    -- Great Sword
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
        ammo = "Seething bomblet +1",
        head = "Sakpata's Helm",
        body = "Sakpata's Breastplate",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Boii Cuisses +3",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10'}
        }
    })

    sets.precast.WS['Resolution'].Mid = set_combine(sets.precast.WS['Resolution'], sets.precast.WS.Mid)
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], sets.precast.WS.Acc)

    sets.precast.WS['Groundstrike'] = sets.WSD
    sets.precast.WS['Groundstrike'].Mid = sets.WSDMid
    sets.precast.WS['Groundstrike'].Acc = sets.WSDAcc

    sets.precast.WS['Shockwave'] = sets.MACC
    sets.precast.WS['Shockwave'].Mid = sets.MACC
    sets.precast.WS['Shockwave'].Acc = sets.MACC

    -- Sword
    sets.precast.WS['Savage Blade'] = {
        ammo = "Knobkierrie",
        head = "Agoge Mask +3",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Boii Mufflers +3",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Thrud Earring",
        right_ear = "Moonshade Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Savage Blade'].Mid = set_combine(sets.precast.WS['Savage Blade'], sets.precast.WS.Mid)
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], sets.precast.WS.Acc)
    sets.precast.WS['Savage Blade'].PDL = set_combine(sets.precast.WS['Savage Blade'], sets.precast.WS.PDL)

    sets.precast.WS['Vorpal Blade'] = sets.CMulti
    sets.precast.WS['Vorpal Blade'].Mid = sets.CMultiMid
    sets.precast.WS['Vorpal Blade'].Acc = sets.CMultiAcc

    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {
        ammo = "Knobkierrie",
        head = "Pixie Hairpin +1",
        body = "Pumm. Lorica +3",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        -- legs = OdysseanLegs.Magic,
        -- feet = OdysseanFeet.Magic,
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Thrud Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    })

    -- H2H
    sets.precast.WS['Dragon Kick'] = sets.MultiAtk
    sets.precast.WS['Dragon Kick'].Mid = sets.MultiAtkMid
    sets.precast.WS['Dragon Kick'].Acc = sets.MultiAtkAcc

    sets.precast.WS['Tornado Kick'] = sets.MultiAtk
    sets.precast.WS['Tornado Kick'].Mid = sets.MultiAtkMid
    sets.precast.WS['Tornado Kick'].Acc = sets.MultiAtkAcc

    sets.precast.WS['Raging Fists'] = {
        ammo = "Coiste Bodhar",
        head = "Flam. Zucchetto +2",
        body = "Tatenashi Haramaki +1",
        hands = "Tatenashi Gote +1",
        legs = "Pummeler's Cuisses +3",
        feet = "Pummeler's Calligae +3",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Moonshade Earring",
        right_ear = "Schere Earring",
        left_ring = "Regal Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10'}
        }
    }
    -- sets.precast.WS['Raging Fists'].Mid = sets.MultiAtkMid
    -- sets.precast.WS['Raging Fists'].Acc = sets.MultiAtkAcc

    -- Other
    sets.precast.WS['Blade: Ei'] = {
        neck = "Yarak Torque"
    }

    sets.precast.WS['Tachi: Jinpu'] = {
        neck = "Agelast Torque"
    }

    sets.precast.WS['Tachi: Koki'] = {
        head = "Kengo Hachimaki",
        neck = "Agelast Torque"
    }

    sets.MSWSMA = set_combine(sets.MultiAtk, {
        ammo = "Yetshila +1",
        feet = "Boii Calligae +3"
    })

    sets.MSWSD = set_combine(sets.WSD, {
        ammo = "Yetshila +1",
        feet = "Boii Calligae +3"
    })

    sets.MSUP = set_combine(sets.precast.WS['Upheaval'], {
        ammo = "Yetshila +1",
        feet = "Boii Calligae +3"
    })

    -- Idle Sets

    sets.idle = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Boii Mask +3",
        body = "Boii Lorica +3",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Shneddick Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.idle.Town = set_combine(sets.idle, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Boii Mask +3",
        body = "Boii Lorica +3",
        hands = "Boii Mufflers +3",
        legs = "Boii Cuisses +3",
        feet = "Boii Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Regal Ring",
        right_ring = "Shneddick Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.idle.Field = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Boii Mask +3",
        body = "Boii Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings",
        neck = "Bathy Choker +1",
        waist = "Plat. Mog. Belt",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Shneddick Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Damage Taken sets

    sets.defense.PDT = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.defense.DT = sets.defense.PDT

    sets.defense.Reraise = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- TP sets

    sets.engaged = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Boii Mask +3",
        body = "Hjarrandi Breastplate",
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = "Pumm. Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- sets.engaged.Mid = set_combine(sets.engaged, {
    --     body = "Agoge Lorica +3"
    -- })

    -- sets.engaged.Acc = set_combine(sets.engaged.Mid, {
    --     body = "Agoge Lorica +3"
    -- })

    sets.engaged.PDT = set_combine(sets.engaged, sets.defense.PDT)

    sets.engaged.SamWar = set_combine(sets.engaged, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = "Sakpata's Leggings",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.engaged.PDT.SamWar = set_combine(sets.engaged, {
        ammo = "Seething Bomblet +1",
        -- head = "Hjarrandi Helm",
        head = "Boii Mask +3",
        body = "Hjarrandi Breastplate",
        hands = "Tatenashi Gote +1",
        legs = "Pumm. Cuisses +3",
        feet = "Pumm. Calligae +3",
        neck = "Vim Torque +1",
        waist = "Ioskeha Belt +1",
        left_ear = "Dedition Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Defending Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.engaged.SUB = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Boii Mask +3",
        body = "Boii Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = "Pumm. Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- sets.engaged.SUB.Mid =

    -- sets.engaged.SUB.Acc =

    sets.engaged.SUB.PDT = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- 25stp
    -- --[[
    sets.engaged.Set1 = {
        ammo = "Coiste Bodhar",
        head = "Flam. Zucchetto +2",
        body = {
            name = "Valorous Mail",
            augments = {'Accuracy+22', '"Dbl.Atk."+5', 'Attack+14'}
        },
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = "Pumm. Calligae +3",
        neck = "Warrior's Bead Necklace +2",
        waist = "Ioskeha Belt +1",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = "Flamma Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }
    -- ]] --

    -- 41stp also make a SUB set for set2
    sets.engaged.Set2 = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        -- head = "Hjarrandi Helm",
        head = "Boii Mask +3",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- sets.engaged.Set2.PDT = set_combine(sets.engaged.Set2, {
    -- ammo="Seething Bomblet +1",
    -- head="Hjarrandi Helm",
    -- body="Hjarrandi Breastplate",
    -- hands="Tatenashi Gote +1",
    -- left_ring="Gelatinous Ring +1",
    -- right_ring="Defending Ring",
    -- })

    sets.engaged.Set2.PDT = set_combine(sets.engaged.Set2, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    -- make mid and acc version of AM sets
    sets.engaged.Set2.AM3 = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- sets.engaged.Set2.PDT.AM3 = set_combine(sets.engaged.Set2.AM3, {
    -- hands="Sakpata's Gauntlets",
    -- left_ring="Gelatinous Ring +1",
    -- right_ring="Defending Ring",
    -- })

    sets.engaged.SUB.Set2 = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        -- head = "Hjarrandi Helm",
        head = "Boii Mask +3",
        -- body = "Sakpata's Plate",
        -- body = "Hjarrandi Breastplate",
        body = "Boii Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        -- feet = {
        --     name = "Sakpata's Leggings",
        --     augments = {'Path: A'}
        -- },
        feet = "Pumm. Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        -- waist = "Ioskeha Belt +1",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.engaged.SUB.Set2.PDT = set_combine(sets.engaged.SUB.Set2, {
        ammo = "Seething Bomblet +1",
        head = "Hjarrandi Helm",
        body = "Hjarrandi Breastplate",
        hands = "Tatenashi Gote +1",
        neck = "Vim Torque +1",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring"
    })

    sets.engaged.Set3 = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Hjarrandi Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Dual Wield TP sets
    sets.engaged.DW = set_combine(sets.engaged, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        -- head = "Hjarrandi Helm",
        head = "Boii Mask +3",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = {
            name = "Sakpata's Leggings",
            augments = {'Path: A'}
        },
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = "Telos Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {
        ammo = "Staunch Tathlum +1",
        body = "Hjarrandi Breastplate",
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring"
    })

    sets.engaged.OneHand = set_combine(sets.engaged, {
        -- ammo = {
        --     name = "Coiste Bodhar",
        --     augments = {'Path: A'}
        -- },
        -- head = "Hjarrandi Helm",
        -- body = "Sakpata's Plate",
        -- hands = "Sakpata's Gauntlets",
        -- legs = "Sakpata's Cuisses",
        -- feet = {
        --     name = "Sakpata's Leggings",
        --     augments = {'Path: A'}
        -- },
        -- neck = {
        --     name = "War. Beads +2",
        --     augments = {'Path: A'}
        -- },
        -- waist = "Ioskeha Belt +1",
        -- left_ear = {
        --     name = "Schere Earring",
        --     augments = {'Path: A'}
        -- },
        -- right_ear = "Telos Earring",
        -- left_ring = "Moonlight Ring",
        -- right_ring = "Niqmaddu Ring",
        -- back = {
        --     name = "Cichol's Mantle",
        --     augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        -- }
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        -- head = "Hjarrandi Helm",
        head = "Boii Mask +3",
        -- body = "Sakpata's Plate",
        -- body = "Hjarrandi Breastplate",
        body = "Boii Lorica +3",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        legs = "Sakpata's Cuisses",
        -- feet = {
        --     name = "Sakpata's Leggings",
        --     augments = {'Path: A'}
        -- },
        feet = "Pumm. Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        -- waist = "Ioskeha Belt +1",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.engaged.OneHand.PDT = set_combine(sets.engaged.OneHand, {
        body = "Sakpata's Breastplate",
        hands = {
            name = "Sakpata's Gauntlets",
            augments = {'Path: A'}
        },
        left_ring = "Gelatinous Ring +1",
        right_ring = "Defending Ring"
    })

    sets.engaged.SubtleBlow = set_combine(sets.engaged, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Sakpata's Helm",
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
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.engaged.Crit = set_combine(sets.engaged, {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        -- head = "Hjarrandi Helm",
        head = {
            name = "Blistering Sallet +1",
            augments = {'Path: A'}
        },
        -- body = "Sakpata's Plate",
        body = "Hjarrandi Breastplate",
        -- body = "Boii Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        -- feet = {
        --     name = "Sakpata's Leggings",
        --     augments = {'Path: A'}
        -- },
        feet = "Pumm. Calligae +3",
        neck = {
            name = "War. Beads +2",
            augments = {'Path: A'}
        },
        -- waist = "Ioskeha Belt +1",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Schere Earring",
            augments = {'Path: A'}
        },
        right_ear = {
            name = "Boii Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+11', 'Mag. Acc.+11', 'Crit.hit rate+3'}
        },
        left_ring = "Moonlight Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

end

-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
end

-- Modify the default idle set after it was constructed.
--[[function customize_idle_set(idleSet)
    if player.hpp < 90 then
        idleSet = set_combine(idleSet, sets.idle.Regen)
    end
    if state.HybridMode.current == 'PDT' then
        idleSet = set_combine(idleSet, sets.defense.PDT)
    end
    return idleSet
end]] --

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if buffactive["Mighty Strikes"] and (spell.english == "Resolution" or MultiAtklist:contains(spell.english)) then
            equip(sets.MSWSMA)
        elseif buffactive["Mighty Strikes"] and (spell.english == "Savage Blade" or WSDlist:contains(spell.english)) then
            equip(sets.MSWSD)
        elseif buffactive["Mighty Strikes"] and (spell.english == "Upheaval") then
            equip(sets.MSUP)
        end
    end
    if elemental_ws:contains(spell.name) then
        -- Matching double weather (w/o day conflict).
        if spell.element == world.weather_element and
            (get_weather_intensity() == 2 and spell.element ~= elements.weak_to[world.day_element]) then
            equip({
                waist = "Hachirin-no-Obi"
            })
            -- Target distance under 1.7 yalms.
            -- elseif spell.target.distance < (1.7 + spell.target.model_size) then
            -- equip({waist="Orpheus's Sash"})
            -- Matching day and weather.
        elseif spell.element == world.day_element and spell.element == world.weather_element then
            equip({
                waist = "Hachirin-no-Obi"
            })
            -- Target distance under 8 yalms.
            -- elseif spell.target.distance < (8 + spell.target.model_size) then
            -- equip({waist="Orpheus's Sash"})
            -- Match day or weather.
        elseif spell.element == world.day_element or spell.element == world.weather_element then
            equip({
                waist = "Hachirin-no-Obi"
            })
        end
    end
end

-- Called when the player's status changes.
function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == "Engaged" then
        get_combat_form()
        get_combat_weapon()
        update_melee_groups()
        -- elseif job_status_change(newStatus, oldStatus, eventArgs)
        --    determine_idle_group()
    end
end

function job_buff_change(buff, gain)

    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
    -- AM
    if buff:startswith('Aftermath') then
        if player.equipment.main == 'Ukonvasara' then
            classes.CustomMeleeGroups:clear()

            if (buff == "Aftermath: Lv.3" and gain) or buffactive['Aftermath: Lv.3'] then
                classes.CustomMeleeGroups:append('AM3')
                add_to_chat(8, '-------------Empy AM3 UP-------------')
            elseif (buff == "Aftermath: Lv.3" and not gain) then
                add_to_chat(8, '-------------Empy AM3 DOWN-------------')
            end

            if not midaction() then
                handle_equipping_gear(player.status)
            end
        else
            classes.CustomMeleeGroups:clear()

            if buff == "Aftermath" and gain or buffactive.Aftermath then
                classes.CustomMeleeGroups:append('AM')
            end

            if not midaction() then
                handle_equipping_gear(player.status)
            end
        end
    end
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)

    get_combat_form()
    get_combat_weapon()
    update_melee_groups()
    sam_sj = player.sub_job == 'SAM' or false

end

function get_combat_form()
    state.CombatForm:reset()
    if S {'NIN', 'DNC'}:contains(player.sub_job) and sub_weapons:contains(player.equipment.sub) then
        state.CombatForm:set("DW")
    elseif S {"Blurred Shield +1"}:contains(player.equipment.sub) then
        state.CombatForm:set("OneHand")
    elseif not sam_sj then
        state.CombatForm:set("SUB")
        -- else
        -- state.CombatForm:reset()
    end

end

function get_combat_weapon()
    state.CombatWeapon:reset()
    if Set2List:contains(player.equipment.main) then
        state.CombatWeapon:set("Set2")
    elseif Set3List:contains(player.equipment.main) then
        state.CombatWeapon:set("Set3")
    end
end

function update_melee_groups()

    -- Empy AM  
    if player.equipment.main == 'Ukonvasara' then
        if buffactive['Aftermath: Lv.3'] then
            classes.CustomMeleeGroups:append('AM3')
        end
    elseif buffactive['Samurai Roll'] and buffactive['Fighter\'s Roll'] then
        classes.CustomMeleeGroups:append('SamWar')
        -- elseif buffactive['Samurai Roll'] then
        --      classes.CustomMeleeGroups:append('Sam')
        -- elseif buffactive['Fighter\'s Roll'] then
        --     classes.CustomMeleeGroups:append('War')
    else
        classes.CustomMeleeGroups:clear()
    end
end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 9)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 27)
    else
        set_macro_page(1, 27)
    end
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
