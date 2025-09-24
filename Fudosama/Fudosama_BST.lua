-- Colonnello
-- Load and initialize the include file.
include('Fudosama-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "137"
MacroBook = "19"
MacroSet = "1"

-- Uses Items Automatically
AutoItem = false

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP', 'ACC', 'DT', 'PDL', 'SB', 'MEVA') -- ACC effects WS and TP modes

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = true

-- Set to true to run organizer on job changes
Organizer = false

-- Lockstyle sets to randomly equip
Lockstyle_List = {135, 137}

-- Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

-- Modes for specific to Ninja
state.WeaponMode:options('Agwus Axe', 'Dolichenus', 'Naegling', 'Unlocked', 'Locked')
state.WeaponMode:set('Agwus Axe')

-- Enable JobMode for UI.
UI_Name = 'Pet'

-- Modes for specific Pets
state.JobMode:options('None', 'GenerousArthur', 'FatsoFargann', 'ScissorlegXerin', 'BlackbeardRandy', 'AcuexFamiliar',
    'VivaciousVickie', 'BouncingBertha', 'WarlikePatrick', 'RhymingShizuna', 'SwoopingZhivago', 'HeraldHenry',
    'DaringRoland', 'SultryPatrice', 'VivaciousGaston', 'JovialEdwin', 'SuspiciousAlice', 'FunguarFamiliar')
state.JobMode:set('GenerousArthur')

-- Initialize Player
jobsetup(LockStylePallet, MacroBook, MacroSet)

function get_sets()

    -- This uses a set Jug based off the Pet selected in the "JobMode"
    sets.Jugs = {}
    sets.Jugs['FatsoFargann'] = {
        ammo = "C. Plasma Broth"
    }
    sets.Jugs['AcuexFamiliar'] = {
        ammo = "Venomous Broth"
    }
    sets.Jugs['GenerousArthur'] = {
        ammo = "Dire Broth"
    }
    sets.Jugs['BlackbeardRandy'] = {
        ammo = "Meaty Broth"
    }
    sets.Jugs['ScissorlegXerin'] = {
        ammo = "Spicy Broth"
    }
    sets.Jugs['VivaciousVickie'] = {
        ammo = "Tant. Broth"
    }
    sets.Jugs['BouncingBertha'] = {
        ammo = "Bubbly Broth"
    }
    sets.Jugs['WarlikePatrick'] = {
        ammo = "Livid Broth"
    }
    sets.Jugs['RhymingShizuna'] = {
        ammo = "Lyrical Broth"
    }
    sets.Jugs['SwoopingZhivago'] = {
        ammo = "Windy Greens"
    }
    sets.Jugs['HeraldHenry'] = {
        ammo = "Trans. Broth"
    }
    sets.Jugs['DaringRoland'] = {
        ammo = "Feculent Broth"
    }
    sets.Jugs['SultryPatrice'] = {
        ammo = "Putrescent Broth"
    }
    sets.Jugs['VivaciousGaston'] = {
        ammo = "Spumante Broth"
    }
    sets.Jugs['JovialEdwin'] = {
        ammo = "Pungent Broth"
    }
    sets.Jugs['SuspiciousAlice'] = {
        ammo = "Furious Broth"
    }
    sets.Jugs['FunguarFamiliar'] = {
        ammo = "Seedbed Soil"
    }

    -- Weapon setup
    sets.Weapons = {}

    sets.Weapons['Dolichenus'] = {
        main = "Dolichenus",
        sub = "Ikenga's Axe"
    }

    sets.Weapons['Pangu'] = {
        main = "Pangu",
        sub = "Ikenga's Axe"
    }

    sets.Weapons["Agwus Axe"] = {
        main = "Agwu's Axe",
        sub = "Ikenga's Axe"
    }

    sets.Weapons['Aymur'] = {
        main = "Aymur",
        sub = "Farsha"
    }

    sets.Weapons['Naegling'] = {
        main = "Naegling",
        sub = "Fernagu"
    }

    sets.Weapons['Unlocked'] = {}

    sets.Weapons.Shield = {
        sub = "Sacro Bulwark"
    }

    -- Standard Idle set with -DT, Refresh, Regen and movement gear
    sets.Idle = {
        ammo = "Staunch Tathlum +1",
        head = "Null Masque",
        body = "Adamantite Armor",
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
        neck = "Null Loop",
        waist = "Null Belt",
        left_ear = "Alabaster Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Murky Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'Pet: Damage taken -5%'}
        }
    }

    sets.Idle.Pet = set_combine(sets.Idle, {
        hands = "Gleti's Gauntlets",
        feet = "Gleti's Boots",
        neck = "Empath Necklace",
        waist = "Isa Belt",
        left_ear = "Enmerkar Earring",
        right_ear = "Handler's Earring +1",
        left_ring = "C. Palug Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'Eva.+20 /Mag. Eva.+20', 'Pet: "Regen"+10', 'Pet: Damage taken -5%'}
        }
    })

    -- Used to swap into movement gear when the player is detected movement when not engaged
    sets.Movement = {
        left_ring = "Shneddick Ring"
    }

    -- Set to be used if you get cursna casted on you
    sets.Cursna_Received = {
        neck = "Nicander's Necklace",
        left_ring = "Eshmun's Ring",
        right_ring = "Eshmun's Ring",
        waist = "Gishdubar Sash"
    }

    sets.OffenseMode = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = {
            name = "Bst. Collar +2",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Crep. Earring",
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    -- Base TP set to build off
    sets.OffenseMode.TP = set_combine(sets.OffenseMode, {
        neck = "Anu Torque",
        left_ear = "Telos Earring",
        right_ring = "Epona's Ring",
        back = "Null Shawl"
    })
    -- This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
    sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {})
    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {})

    sets.OffenseMode.PDL = set_combine(sets.OffenseMode.TP, {})

    sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.TP, {
        neck = "Warder's Charm +1"
    })

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    -- Cap is 75% - 50% limit in I or II
    sets.OffenseMode.SB = {}

    sets.DualWield = {
        left_ear = "Eabani Earring",
        waist = "Reiki Yotai"
    }

    -- Ready JA command
    sets.Ready = {
        legs = "Gleti's Breeches"
    }

    sets.Precast = {}

    -- Used for Magic Spells
    sets.Precast.FastCast = {
        ammo = "Sapience Orb",
        head = {
            name = "Valorous Mask",
            augments = {'"Resist Silence"+2', 'MND+3', '"Fast Cast"+7', 'Mag. Acc.+9 "Mag.Atk.Bns."+9'}
        },
        neck = "Orunmila's Torque",
        ear1 = "Loquacious Earring",
        ear2 = "Enchanter Earring +1",
        body = "Sacro Breastplate",
        hands = "Leyline Gloves",
        legs = {
            name = "Valorous Hose",
            augments = {'Crit.hit rate+2', '"Dual Wield"+1', '"Fast Cast"+7'}
        },
        feet = {
            name = "Valorous Greaves",
            augments = {'"Mag.Atk.Bns."+17', 'AGI+7', '"Fast Cast"+7', 'Accuracy+14 Attack+14'}
        },
        left_ring = "Prolix Ring",
        right_ring = "Rahab Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Fast Cast"+10',
                        'Spell interruption rate down-10%'}
        }
    }

    sets.Precast.Enmity = {}

    -- Base set for midcast - if not defined will notify and use your idle set for surviability
    sets.Midcast = set_combine(sets.Idle, {})

    -- Pet Moves

    -- Default
    sets.Pet_Midcast = {
        ammo = {
            name = "Hesperiidae",
            augments = {'Path: A'}
        },
        head = "Nuk. Cabasset +2",
        body = "Nukumi Gausape +3",
        hands = "Nukumi Manoplas +3",
        legs = "Nukumi Quijotes +2",
        feet = "Gleti's Boots",
        neck = {
            name = "Bst. Collar +2",
            augments = {'Path: A'}
        },
        waist = "Incarnation Sash",
        left_ear = "Sroda Earring",
        right_ear = {
            name = "Nukumi Earring",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
        },
        left_ring = "Tali'ah Ring",
        right_ring = "C. Palug Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20', 'Pet: Accuracy+10 Pet: Rng. Acc.+10',
                        'Pet: Haste+10', 'Pet: Damage taken -5%'}
        }
    }

    -- TP based Ready moves
    sets.Pet_Midcast.TP = {
        hands = "Nukumi Manoplas +3"
    }

    -- Magic Attack Bonus Ready moves
    sets.Pet_Midcast.MAB = {
        ammo = "Voluspa Tathlum",
        neck = "Adad Amulet",
        left_ring = "Tali'ah Ring",
        right_ring = "Cath Palug Ring",
        waist = "Incarnation Sash"
    }

    -- Debuff moves that need MACC
    sets.Pet_Midcast.MACC = {
        ammo = "Voluspa Tathlum",
        head = "Nuk. Cabasset +2",
        body = "Nukumi Gausape +3",
        hands = "Nukumi Manoplas +3",
        legs = "Nukumi Quijotes +2",
        feet = "Gleti's Boots",
        neck = {
            name = "Bst. Collar +2",
            augments = {'Path: A'}
        },
        waist = "Incarnation Sash",
        left_ear = "Kyrene's Earring",
        right_ear = "Enmerkar Earring",
        left_ring = "Murky Ring",
        right_ring = "C. Palug Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'Pet: M.Acc.+20 Pet: M.Dmg.+20', 'Pet: Mag. Acc.+10'}
        }
    }

    -- Example for a specific move
    -- sets.Pet_Midcast['TP Drainkiss'] = set_combine(sets.Pet_Midcast.MACC, { })

    -- Job Abilities
    sets.JA = {}
    sets.JA['Familiar'] = set_combine(sets.Idle, {
        legs = {
            name = "Ankusa Trousers +3",
            augments = {'Enhances "Familiar" effect'}
        }
    })

    sets.JA['Charm'] = set_combine(sets.Idle, {
        ammo = "Voluspa Tathlum",
        head = "Totemic Helm +3",
        neck = "Unmoving Collar +1",
        ear1 = "Enchanter's Earring",
        ear2 = "Enchanter Earring +1",
        body = "Ankusa Jackcoat +2",
        hands = "Ankusa Gloves +3",
        ring1 = "Dawnsoul Ring",
        ring2 = "Dawnsoul Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        },
        waist = "Aristo Belt",
        legs = {
            name = "Ankusa Trousers +3",
            augments = {'Enhances "Familiar" effect'}
        },
        feet = {
            name = "Ankusa Gaiters +3",
            augments = {'Enhances "Beast Healer" effect'}
        }
    })

    sets.JA['Gauge'] = set_combine(sets.Idle, {})

    sets.JA['Tame'] = set_combine(sets.Idle, {
        head = "Totemic Helm +3",
        ear1 = "Tamer's Earring",
        legs = "Stout Kecks"
    })

    sets.JA['Reward'] = set_combine(sets.Idle, {
        ammo = "Pet Food Theta",
        head = "Brave's Warbonnet",
        neck = "Aife's Medal",
        body = "Totemic Jackcoat +3",
        hands = "Malignance Gloves",
        legs = {
            name = "Ankusa Trousers +3",
            augments = {'Enhances "Familiar" effect'}
        },
        feet = {
            name = "Ankusa Gaiters +3",
            augments = {'Enhances "Beast Healer" effect'}
        },
        left_ring = "Leviathan Ring +1",
        right_ring = "Metamorph Ring +1",
        waist = "Engraved Belt",
        back = {
            name = "Artio's Mantle",
            augments = {'MND+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'MND+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })
    sets.JA['Call Beast'] = set_combine(sets.Idle, {
        head = {
            name = "Acro Helm",
            augments = {'"Call Beast" ability delay -5'}
        },
        body = {
            name = "Acro Surcoat",
            augments = {'"Call Beast" ability delay -5'}
        },
        hands = {
            name = "Ankusa Gloves +3",
            augments = {'Enhances "Beast Affinity" effect'}
        },
        legs = {
            name = "Acro Breeches",
            augments = {'"Call Beast" ability delay -5'}
        },
        feet = {
            name = "Acro Leggings",
            augments = {'"Call Beast" ability delay -5'}
        },
        neck = {
            name = "Bst. Collar +2",
            augments = {'Path: A'}
        }
    })

    sets.JA['Feral Howl'] = set_combine(sets.Idle, {
        body = {
            name = "An. Jackcoat +3",
            augments = {'Enhances "Feral Howl" effect'}
        }
    })

    sets.JA['Unleash'] = set_combine(sets.Idle, {})

    sets.JA['Bestial Loyalty'] = set_combine(sets.Idle, {
        hands = {
            name = "Ankusa Gloves +3",
            augments = {'Enhances "Bestial Loyalty" effect'}
        }
    })
    sets.JA['Killer Instinct'] = set_combine(sets.Idle, {
        head = {
            name = "Ankusa Helm +3",
            augments = {'Enhances "Killer Instinct" effect'}
        }
    })

    -- Pet Commands
    sets.JA['Fight'] = set_combine(sets.Idle, {})
    sets.JA['Heel'] = set_combine(sets.Idle, {})
    sets.JA['Leave'] = set_combine(sets.Idle, {})
    sets.JA['Stay'] = set_combine(sets.Idle, {})
    sets.JA['Snarl'] = set_combine(sets.Idle, {})
    sets.JA['Ready'] = set_combine(sets.Idle, {})
    sets.JA['Spur'] = set_combine(sets.Idle, {
        back = "Artio's Mantle",
        feet = "Nukumi Ocreae +2"
    })
    sets.JA['Run Wild'] = set_combine(sets.Idle, {})

    -- Default WS set base
    sets.WS = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Nukumi Gausape +3",
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
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Thrud Earring",
        right_ear = "Sherida Earring",
        left_ring = "Sroda Ring",
        right_ring = "Gere Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'} -- need to update +10 STR
        }
    }

    sets.WS.SB = set_combine(sets.WS, { -- This maximize SB

    })

    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = set_combine(sets.WS, {})

    sets.WS.PDL = set_combine(sets.WS, {})

    -- WS Sets
    sets.WS["Ragin Axe"] = set_combine(sets.WS, {})
    sets.WS["Smash Axe"] = set_combine(sets.WS, {})
    sets.WS["Gale Axe"] = set_combine(sets.WS, {})
    sets.WS["Avalanche Axe"] = set_combine(sets.WS, {})
    sets.WS["Spinning Axe"] = set_combine(sets.WS, {})
    sets.WS["Rampage"] = set_combine(sets.WS, {})
    sets.WS["Calamity"] = set_combine(sets.WS, {})
    sets.WS["Bora Axe"] = set_combine(sets.WS, {})

    sets.WS["Mistral Axe"] = set_combine(sets.WS, {
        neck = "Rep. Plat. Medal",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Thrud Earring"
    })

    sets.WS["Decimation"] = set_combine(sets.WS, {
        feet = "Nukumi Ocreae +2",
        neck = "Beastmaster Collar +2",
        waist = "Fotia Belt",
        left_ear = "Sroda Earring",
        back = {
            name = "Artio's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'} -- should be DA here
        }
    })

    sets.WS['Cloudsplitter'] = set_combine(sets.WS, {
        ammo = "Oshasha's Treatise",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Beithir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'} -- more STR
        }
    })

    sets.WS['Primal Rend'] = set_combine(sets.WS, {
        ammo = "Oshasha's Treatise",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        neck = "Baetyl Pendant",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Beithir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Artio's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    })

    sets.WS['Savage Blade'] = set_combine(sets.WS, {})

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
    if spell.name:contains('Maneuver') then
        equipSet = sets.JA.Maneuver
    elseif spell.type == 'WeaponSkill' then
        if state.OffenseMode.value == "MEVA" then
            equipSet = {
                neck = "Warder's Charm +1"
            }
        end
    end
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

    return choose_gear()
end

-- Called when the pet dies or is summoned
function pet_change_custom(pet, gain)
    equipSet = {}

    return equipSet
end

-- Called during a pet midcast
function pet_midcast_custom(spell)
    equipSet = {}
    local message = 'Pet Not Set'
    if Ready_Standard[spell.name] then
        equipSet = set_combine(equipSet, sets.Pet_Midcast)
        message = 'Pet Standard Set'
    end
    if Ready_TP[spell.name] then
        equipSet = set_combine(equipSet, sets.Pet_Midcast.TP)
        message = 'Pet TP Set'
    end
    if Ready_Magic[spell.name] then
        equipSet = set_combine(equipSet, sets.Pet_Midcast.MAB)
        message = 'Pet Magic Set'
    end
    if Ready_Debuff[spell.name] then
        equipSet = set_combine(equipSet, sets.Pet_Midcast.MACC)
        message = 'Pet Magic Accuracy Set'
    end
    info(message)
    return equipSet
end

-- Called after the performs an action
function pet_aftercast_custom(spell)
    equipSet = {}

    return equipSet
end

-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    equipSet = {}

    return choose_gear()
end
-- This function is called when a update request the correct equipment set
function choose_set_custom()
    equipSet = {}

    return choose_gear()
end
-- Function is called when the player changes states
function status_change_custom(new, old)
    equipSet = {}

    return choose_gear()
end
-- Function is called when a self command is issued
function self_command_custom(command)
end
-- Custom Function
function choose_gear()
    equipSet = {}

    return equipSet
end

function check_buff_JA()
    buff = 'None'
    local ja_recasts = windower.ffxi.get_ability_recasts()

    -- Sub job has least priority
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

-- This function is called when the job file is unloaded
function user_file_unload()
end
