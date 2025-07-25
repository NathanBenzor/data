-- Salidar
-- Load and initialize the include file.
include('Fudosama-Include')

-- Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "19"
MacroBook = "9"
MacroSet = "1"

-- Uses Items Automatically
AutoItem = false

-- Upon Job change will use a random lockstyleset
Random_Lockstyle = true

-- Lockstyle sets to randomly equip
Lockstyle_List = {19, 20}

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('DT', 'TP', 'SB', 'Aminon') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

state.WeaponMode:options('Aeneas', 'Tauret', 'Karambit', 'Unlocked')
state.WeaponMode:set('Aeneas')

-- Initialize Player
jobsetup(LockStylePallet, MacroBook, MacroSet)

function get_sets()

    sets.Weapons = {}
    -- sets.Weapons['Terpsichore'] = {}
    -- sets.Weapons['Twashtar'] = {}
    sets.Weapons['Aeneas'] = {
        main = "Aeneas",
        sub = {
            name = "Gleti's Knife",
            augments = {'Path: A'}
        }
    }
    sets.Weapons['Tauret'] = {
        main = "Tauret",
        sub = {
            name = "Gleti's Knife",
            augments = {'Path: A'}
        }
    }
    sets.Weapons['Karambit'] = {
        main = "Karambit"
    }
    sets.Weapons['Unlocked'] = {}

    -- Standard Idle set with -DT, Refresh, Regen and movement gear
    sets.Idle = {}

    sets.Idle.DT = {
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
        neck = "Rep. Plat. Medal",
        waist = "Null Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Infused Earring",
        left_ring = "Regal Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.Idle.TP = {
        ammo = "Staunch Tathlum +1",
        head = "Turms Cap",
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
        neck = "Rep. Plat. Medal",
        waist = "Null Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Infused Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.Idle.SB = sets.Idle.DT

    sets.Idle.Aminon = {
        ammo = "Staunch Tathlum +1",
        head = "Turms Cap",
        body = "Gleti's Cuirass",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Gleti's Boots",
        neck = "Rep. Plat. Medal",
        waist = "Null Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Infused Earring",
        left_ring = "Moonlight Ring",
        right_ring = "Roller's Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- sets.Idle.Farm = {
    --     ammo = "Staunch Tathlum +1",
    --     head = "Nyame Helm",
    --     body = {
    --         name = "Nyame Mail",
    --         augments = {'Path: B'}
    --     },
    --     hands = "Nyame Gauntlets",
    --     legs = "Nyame Flanchard",
    --     feet = "Nyame Sollerets",
    --     neck = {
    --         name = "Unmoving Collar +1",
    --         augments = {'Path: A'}
    --     },
    --     waist = "Silver Mog. Belt",
    --     left_ear = {
    --         name = "Odnowa Earring +1",
    --         augments = {'Path: A'}
    --     },
    --     right_ear = "Tuisto Earring",
    --     left_ring = {
    --         name = "Gelatinous Ring +1",
    --         augments = {'Path: A'}
    --     },
    --     right_ring = "Moonlight Ring",
    --     back = "Moonlight Cape"
    -- }

    sets.Movement = {
        right_ring = "Shneddick Ring"
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

    -- This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
    sets.OffenseMode = {}

    sets.OffenseMode.DT = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +2",
        -- waist = "Reiki Yotai",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Moonlight Ring",
        back = "Null Shawl"
    }
    -- Base TP set to build off
    sets.OffenseMode.TP = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = {
            name = "Adhemar Jacket +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+8', 'DEX+9', '"Dbl.Atk."+3', '"Triple Atk."+2'}
        },
        feet = "Malignance Boots",
        neck = "Anu Torque",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = "Sacro Mantle"
    }
    -- Subtle Blow Cap at 50 and II at 25 for a Total of 75.
    -- DNC Subtle Blow = 20/50 w/ Traits. Need +30 in Gear for SBI Cap.
    -- Subtle Blow I: 50/50 | Subtle Blow II:05/25 | DT:50/50 | ACC: High
    sets.OffenseMode.SB = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Anu Torque",
        waist = "Reiki Yotai",
        left_ear = "Sherida Earring", -- SBII+5
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1", -- SB+10
        right_ring = "Chirich Ring +1", -- SB+10
        back = "Sacro Mantle" -- Ambu Cape has SB+10
    }
    sets.OffenseMode.Farm = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Silver Mog. Belt",
        left_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        right_ear = "Tuisto Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = "Moonlight Cape"
    }

    sets.OffenseMode.Aminon = {
        ammo = {
            name = "Coiste Bodhar",
            augments = {'Path: A'}
        },
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +2",
        -- waist = "Reiki Yotai",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Sherida Earring",
        right_ear = "Telos Earring",
        left_ring = "Gere Ring",
        right_ring = "Moonlight Ring",
        back = "Null Shawl"
    }

    -- This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
    sets.OffenseMode.ACC = {}
    -- Dual Wield
    sets.OffenseMode.DW = {}

    sets.Precast = {}
    sets.Precast.FastCast = {
        ammo = "Sapience Orb",
        head = {
            name = "Herculean Helm",
            augments = {'"Fast Cast"+5', 'Mag. Acc.+12', '"Mag.Atk.Bns."+11'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        },
        neck = "Baetyl Pendant",
        waist = "Hachirin-no-Obi",
        left_ear = "Etiolation Earring",
        right_ear = "Enchntr. Earring +1",
        right_ring = "Rahab Ring"
    }
    sets.Enmity = {}
    sets.Midcast = {}
    sets.Midcast.SIRD = {}
    sets.Midcast.Cure = {}
    sets.Midcast.Enhancing = {}
    sets.Midcast.Enfeebling = {}
    sets.Midcast["Stoneskin"] = {}
    -------------------------------------------------------------------------------
    ---------------------------------  JA Sets  -----------------------------------
    -- When you combine with idle during JA's you'll get ~2 sec of high defense --- 
    -------------------- if not overwritten by specified gear ---------------------
    -------------------------------------------------------------------------------
    sets.JA = {}

    sets.JA["Trance"] = {}
    sets.JA["Contradance"] = {}
    sets.JA["Saber Dance"] = {}
    sets.JA["Fan Dance"] = {}
    sets.JA["No Foot Rise"] = {}
    sets.JA["Presto"] = {}
    sets.JA["Grand Pas"] = {}
    -------------------------------------------------------------------------------
    -- Flourishes provide buffs to the Dancer and debuffs to the target monster. --
    -------------------------------------------------------------------------------
    sets.Flourish = set_combine(sets.Idle.DT, {
        head = "Nyame Helm"
    })
    -- Flourishes I : Monster Control
    sets.Flourish["Animated Flourish"] = set_combine(sets.Flourish, sets.Enmity) -- Volatile Enmity spike like Provoke
    sets.Flourish["Desperate Flourish"] = {} -- Gravity effect 
    sets.Flourish["Violent Flourish"] = {} -- Stun effect 
    -- Flourishes II : Skillchain Enhancers
    sets.Flourish["Reverse Flourish"] = {
        back = {
            name = "Toetapper Mantle",
            augments = {'"Store TP"+1', '"Rev. Flourish"+29'}
        }
    } -- Returns TP in exchange for Finishing Moves
    sets.Flourish["Building Flourish"] = {
        head = "Nyame Helm"
    } -- Increases the strength of the next Weapon Skill
    sets.Flourish["Wild Flourish"] = {} -- Readies target for Skillchain
    -- Flourishes III : Weapon Skill Buffs
    sets.Flourish["Climactic Flourish"] = {} -- Forces Critical Hit(s) on the next attack(s) 
    sets.Flourish["Striking Flourish"] = {
        head = "Nyame Helm"
    } -- Forces a Double Attack on the next swing 
    sets.Flourish["Ternary Flourish"] = {} -- Forces a Triple Attack on the next swing
    -------------------------------------------------------------------------------
    -- Waltz Potency gear caps at 50%, while Waltz received potency caps at 30%. -- 
    -------------------------------------------------------------------------------
    sets.Waltz = {
        ammo = "Yamarang",
        head = {
            name = "Horos Tiara +1",
            augments = {'Enhances "Trance" effect'}
        },
        body = "Maxixi Casaque",
        hands = {
            name = "Horos Bangles +1",
            augments = {'Enhances "Fan Dance" effect'}
        },
        legs = "Dashing Subligar",
        feet = "Maxixi Toe Shoes",
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Chaac Belt",
        left_ear = "Sjofn Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Metamorph Ring +1",
        right_ring = "Carb. Ring +1",
        back = {
            name = "Toetapper Mantle",
            augments = {'"Store TP"+1', '"Rev. Flourish"+29'}
        }
    }
    sets.Waltz["Curing Waltz"] = sets.Waltz
    sets.Waltz["Curing Waltz II"] = sets.Waltz
    sets.Waltz["Curing Waltz III"] = sets.Waltz
    sets.Waltz["Curing Waltz IV"] = sets.Waltz
    sets.Waltz["Curing Waltz V"] = sets.Waltz
    sets.Waltz["Divine Waltz"] = sets.Waltz
    sets.Waltz["Divine Waltz II"] = sets.Waltz
    sets.Waltz["Healing Waltz"] = sets.Waltz
    -------------------------------------------------------------------------------
    ---------- Samba duration can be increased using various equipment. -----------
    -------------------------------------------------------------------------------
    sets.Samba = set_combine(sets.Idle.DT, {
        head = "Maxixi Tiara"
    }) --  Missing Ambu Cape for +15

    sets.Samba["Haste Samba"] = {
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.Samba["Aspir Samba"] = {
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.Samba["Aspir Samba II"] = {
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.Samba["Drain Samba"] = {
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.Samba["Drain Samba II"] = {
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.Samba["Drain Samba III"] = {
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    -------------------------------------------------------------------------------
    ----------- Jigs duration can be increased using various equipment. ----------- 
    -------------------------------------------------------------------------------
    sets.Jig = set_combine(sets.Idle.DT, {
        feet = "Maxixi Toe Shoes"
    }) -- Horos Tights +3 and Maxixi Toe Shoes +3

    sets.Jig["Spectral Jig"] = sets.Jig
    sets.Jig["Chocobo Jig"] = sets.Jig
    sets.Jig["Chocobo Jig II"] = sets.Jig
    -------------------------------------------------------------------------------
    ----- Step Accuracy depends on your melee hit rate (including your normal -----
    ---- Accuracy equipment). All Steps tested have shown an innate 10 Accuracy --- 
    -- bonus, which can be further enhanced through various pieces of equipment, -- 
    ----------------------------- merits, and Presto. -----------------------------
    -------------------------------------------------------------------------------
    sets.Step = {
        ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Etoile Gorget +1",
        waist = "Reiki Yotai",
        left_ear = "Odr Earring",
        right_ear = "Telos Earring",
        left_ring = "Chirich Ring +1",
        right_ring = "Chirich Ring +1",
        back = "Sacro Mantle"
    }

    sets.JA["Quickstep"] = sets.Step
    sets.JA["Box Step"] = sets.Step
    sets.JA["Stutter Step"] = sets.Step
    sets.JA["Feather Step"] = set_combine(sets.Idle.DT, {})

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
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Gere Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
    sets.WS.ACC = {}
    -- WS Sets
    -- Dagger WS
    sets.WS["Wasp Sting"] = {}
    sets.WS["Viper Bite"] = {}
    sets.WS["Shadowstich"] = {}
    sets.WS["Gust Slash"] = {}
    sets.WS["Cyclone"] = {}
    sets.WS["Energy Steal"] = {}
    sets.WS["Energy Drain"] = {}
    sets.WS["Dancing Edge"] = {}
    sets.WS["Shark Bite"] = {}
    sets.WS["Evisceration"] = {
        ammo = "Ginsen",
        head = {
            name = "Blistering Sallet +1",
            augments = {'Path: A'}
        },
        body = "Gleti's Cuirass",
        hands = "Gleti's Gauntlets",
        legs = "Gleti's Breeches",
        feet = "Gleti's Boots",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Regal Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Aeolian Edge"] = {
        ammo = "Yamarang",
        head = "Nyame Helm",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Nyame Gauntlets",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
        neck = "Baetyl Pendant",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Regal Ring",
        right_ring = "Ilabrat Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }
    sets.WS["Rudra's Storm"] = {
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
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Senuna's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    -- Hand to Hand WS
    sets.WS["Combo"] = {}
    sets.WS["Shoulder Tackle"] = {}
    sets.WS["Backhand Blow"] = {}
    sets.WS["Asuran Fists"] = {} -- Only if Karambit Weapon Equipt
    sets.WS["Dragon Kick"] = {} -- Only if Hepatizon Baghnakhs NQ/+1 Weapon Equipt
    sets.WS["One Inch Punch"] = {} -- Must Sub MNK
    sets.WS["Raging Fists"] = {} -- Must Sub MNK
    sets.WS["Tornado Kick"] = {} -- Must Sub MNK

    sets.TreasureHunter = {
        ammo = "Per. Lucky Egg",
        body = {
            name = "Herculean Vest",
            augments = {'"Mag.Atk.Bns."+3', 'Magic burst dmg.+4%', '"Treasure Hunter"+2', 'Accuracy+12 Attack+12'}
        },
        neck = "Rep. Plat. Medal",
        waist = "Chaac Belt"
    }

    sets.Rollers = {
        left_ring = "Cornelia's Ring"
    }
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

function hasCorsairRollXI()
    for buffName, active in pairs(buffactive) do
        if active == 11 and string.find(buffName, "Roll") then
            windower.add_to_chat(8, "Detected XI Roll: " .. buffName)
            return true
        end
    end
    return false
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

    return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function midcast_custom(spell)
    equipSet = {}

    return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function aftercast_custom(spell)
    equipSet = {}
    equip(choose_set_custom())
    return Weapon_Check(equipSet)
end
-- Function is called when the player gains or loses a buff
function buff_change_custom(name, gain)
    equipSet = {}

    if string.find(name, "Roll") then
        equip(choose_set_custom())
    end

    return Weapon_Check(equipSet)
end
-- This function is called when a update request the correct equipment set
function choose_set_custom()
    equipSet = {}

    local equipSet = {}

    if player.status == "Engaged" then
        equipSet = sets.OffenseMode[state.OffenseMode.current] or sets.OffenseMode.DT
    else
        equipSet = sets.Idle[state.OffenseMode.current] or sets.Idle.DT
    end

    if hasCorsairRollXI() then
        equipSet.right_ring = "Roller's Ring"
        windower.add_to_chat(8, "Equipping Roller's Ring due to XI roll!")
    end

    return Weapon_Check(equipSet)
end
-- Function is called when the player changes states
function status_change_custom(new, old)
    equipSet = {}
    equip(choose_set_custom())
    return Weapon_Check(equipSet)
end
-- Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when a lua is unloaded
function user_file_unload()

end

-- Function used to automate Job Ability use
function check_buff_JA()
    buff = 'None'
    local ja_recasts = windower.ffxi.get_ability_recasts()

    if player.sub_job == 'SAM' and player.sub_job_level > 8 then
        if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
            buff = "Hasso"
        elseif not buffactive['Meditate'] and ja_recasts[134] == 0 then
            buff = "Meditate"
        end
    end

    if player.sub_job == 'WAR' and player.sub_job_level > 8 then
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

function Weapon_Check(equipSet)
    equipSet = set_combine(equipSet, sets.Weapons[state.JobMode.value])

    return equipSet
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
