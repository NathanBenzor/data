--Elendnur

-- Load and initialize the include file.
include('Lilypeach-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "58"
MacroBook = "15"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = true

--Lockstyle sets to randomly equip
Lockstyle_List = {58,59,60}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Weapon Modes
state.WeaponMode:options('Nuke','Unlocked')
state.WeaponMode:set('Nuke')

-- Set to true to run organizer on job changes
Organizer = false

elemental_ws = S{'Aeolian Edge'}

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Nuke'] ={
		main={ name="Laevateinn", augments={'Path: A',}},
		sub="Enki Strap",
	}

	sets.Weapons['Unlocked'] ={
		main={ name="Laevateinn", augments={'Path: A',}},
		sub="Enki Strap",
	}

	--Standard Idle set with -DT,Refresh,Regen and movement gear
	sets.Idle = {
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
        right_ring="Stikini Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
    }

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		left_ring = "Shneddick Ring",
	}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
	    left_ring={ name="Saida Ring", bag="wardrobe1", priority=2},
		right_ring= "Purity Ring",
		waist="Gishdubar Sash",
	}

	sets.OffenseMode = {}
	-- Base TP set
	sets.OffenseMode.TP = {}

	-- TP set when in -Damage Taken mode
	sets.OffenseMode.DT = {}

	-- TP set to use when mode is in accuracy
	sets.OffenseMode.ACC = {}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {
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
	} -- 80% FC

	sets.Precast["Impact"] = set_combine(sets.Precast.FastCast,{
	    ammo="Sapience Orb",
		neck="Voltsurge Torque",
		body="Twilight Cloak",
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Collimated Fervor"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Bolster"] = {}
	sets.JA["Full Circle"] = {}
	sets.JA["Lasting Emanation"] = {}
	sets.JA["Ecliptic Attrition"] = {}
	sets.JA["Life Cycle"] = {}
	sets.JA["Blaze of Glory"] = {}
	sets.JA["Dematerialzie"] = {}
	sets.JA["Theurgic Focus"] = {}
	sets.JA["Concentric Pulse"] = {}
	sets.JA["Mending Halation"] = {}
	sets.JA["Radial Arcana"] = {}
	sets.JA["Widened Compass"] = {}
	sets.JA["Entrust"] = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {

	}

	-- Cure Set
	sets.Midcast.Cure = {
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
        feet = "Vanya Clogs"
    }

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
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
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
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
	}

	sets.Midcast.Nuke = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Wicce Petasos +3",
		body="Wicce Coat +3",
		hands="Wicce Gloves +3",
		legs="Wicce Chausses +3",
		feet="Wicce Sabots +3",
		neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Freke Ring",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		left_ring="Mujin Band",
	})

	-- Misc Sets
	sets.Midcast.CuragaSet = sets.Midcast.Cure

	sets.Midcast.Cursna = {}

	sets.MP_Recover = {
	    body="Spaekona's Coat +3",
	}

	--Used for elemental Bar Magic Spells
	sets.Midcast.Enhancing.Elemental = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		right_ring="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1"
	})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head={ name="Amalric Coif +1"}
	})

	-- Aspir Set
	sets.Midcast.Aspir = {}

	sets.WS = {}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS["Myrkr"] = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Vanya Cuffs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Etiolation Earring",
		left_ring="Etana Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	sets.TreasureHunter = { }

end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

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
	if spell.skill == 'Elemental Magic' and not Elemental_Magic_Enfeeble:contains(spell.name) then
		if player.MPP < 50 then
			windower.add_to_chat(8,'Recover MP!')
			equipSet = sets.MP_Recover
		end
	end
	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return equipSet
end

function pet_change_custom(pet,gain)
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

--Function is called when a self command is issued
function self_command_custom(command)

end

-- Function is called when the job lua is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end