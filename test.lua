function user_setup()

    state.OffenseMode:options('Normal', 'Parry', 'DDHybrid', 'Empyrean', 'TPBuild', 'Helheim')
    state.HybridMode:options('Normal', 'DTLite', 'Tank')
    state.WeaponskillMode:options('Match', 'Normal', 'SomeAcc', 'Acc', 'HighAcc', 'FullAcc')
    state.CastingMode:options('Normal', 'SIRD', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
    state.MagicalDefenseMode:options('MDT', 'MDT_HP', 'BDT', 'BDT_HP')
    state.ResistDefenseMode:options('MEVA', 'MEVA_HP', 'Death', 'Charm', 'DTCharm')
    state.IdleMode:options('Normal', 'DT', 'Tank', 'KiteTank', 'Sphere')
    state.Weapons:options('Epeolatry', 'EpeolatryDD', 'Lionheart', 'Helheim', 'DualWeapons', 'Lycurgos', 'Axe', 'Sword')

    state.ExtraDefenseMode = M {
        ['description'] = 'Extra Defense Mode',
        'None',
        'MP'
    }

    gear.enmity_jse_back = {
        name = "Ogma's cape",
        augments = {'HP+80', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', '"Phys.dmg.taken"-10%'}
    }
    gear.stp_jse_back = {
        name = "Ogma's cape",
        augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10'}
    }
    gear.da_jse_back = {
        name = "Ogma's cape",
        augments = {'STR+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10'}
    }

    -- Additional local binds
    send_command('bind ` gs c cycle OffenseMode')
    send_command('bind  gs c cycle weapons')
    send_command('bind !` gs c SubJobEnmity')
    send_command('bind @` gs c cycle RuneElement')
    send_command('bind ^` gs c RuneElement')
    send_command('bind @pause gs c toggle AutoRuneMode')
    send_command('bind ^delete input /ja "Provoke" <stnpc>')
    send_command('bind !delete input /ma "Cure IV" <stal>')
    send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind ^\\\\ input /ma "Protect IV" <t>')
    send_command('bind @\\\\ input /ma "Shell V" <t>')
    send_command('bind !\\\\ input /ma "Crusade" <me>')
    send_command('bind ^backspace input /ja "Lunge" <t>')
    send_command('bind @backspace input /ja "Gambit" <t>')
    send_command('bind !backspace input /ja "Rayke" <t>')
    send_command('bind @f8 gs c toggle AutoTankMode')
    send_command('bind @f10 gs c toggle TankAutoDefense')
    send_command('bind ^@!` gs c cycle SkillchainMode')
    send_command('bind ! gs c weapons Lionheart;gs c update')

    select_default_macro_book()
end

function init_gear_sets()
    sets.Enmity = {
        ammo = "Sapience orb",
        head = "Halitus Helm",
        neck = "Moonlight Necklace",
        ear1 = "Cryptic Earring",
        ear2 = "Trux Earring",
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        ring1 = "Provocare Ring",
        ring2 = "Supershear ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Trance Belt",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }

    sets.Enmity.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Halitus Helm",
        neck = "Futhark Torque +2",
        ear1 = "Cryptic Earring",
        ear2 = "Trux Earring",
        body = "Futhark coat +3",
        hands = "Kurys Gloves",
        ring1 = "Defending",
        ring2 = "Moonbeam Ring",
        back = {
            name = "Ogma's cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        },
        waist = "Trance Belt",
        legs = "Eri. Leg Guards +3",
        feet = "Ahosi Leggings"
    }

    sets.Enmity.SIRD = {
        ammo = "Staunch Tathlum +1",
        head = "Meghanada Visor +2",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Trux Earring",
        body = "Emet Harness +1",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Moonbeam Ring",
        back = gear.enmity_jse_back,
        waist = "Rumination Sash",
        legs = "Carmine Cuisses +1",
        feet = "Erilaz Greaves +1"
    }

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Item sets.

    -- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
        body = "Runeist Coat +3",
        legs = "Futhark Trousers +3"
    })
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
        feet = "Runeist Bottes +3"
    })
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
        head = "Futhark Bandeau +3"
    })
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +3"
    })
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
        hands = "Runeist Mitons +3"
    })
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
        feet = "Futhark Boots +3"
    })
    -- sets.precast.JA['Gambit'] = {hands="Runeist Mitons +3"}
    -- sets.precast.JA['Rayke'] = {feet = "Furthark Boots +3"}
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +3"
    })
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
        hands = "Futhark Mitons +3"
    })
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity, {
        back = "Evasionist's Cape"
    })
    sets.precast.JA['One For All'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Weapon Bash'] = {
        ammo = "Pemphredo Tathlum",
        head = "Erilaz Galea +3",
        neck = "Moonlight Necklace",
        ear1 = "Crep. Earring",
        ear2 = "Erilaz Earring +2",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Luminary Sash",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT, {
        body = "Runeist Coat +3",
        legs = "Futhark Trousers +3"
    })
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT, {
        feet = "Runeist Bottes +3"
    })
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT, {
        head = "Futhark Bandeau +3"
    })
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT, {
        body = "Futhark Coat +3"
    })
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT, {
        hands = "Runeist Mitons +3"
    })
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT, {
        feet = "Futhark Boots +3"
    })
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT, {
        body = "Futhark Coat +3"
    })
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT, {
        hands = "Futhark Mitons +3"
    })
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
    sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
        ammo = "Seeth. Bomblet +1",
        head = "Agwu's Cap",
        neck = "Baetyl Pendant",
        ear1 = "Friomisi Earring",
        ear2 = "Crematio Earring",
        body = "Agwu's robe",
        hands = "Agwu's gages",
        ring1 = "Shiva Ring +1",
        ring2 = "Shiva Ring +1",
        back = "Evasionist's Cape",
        waist = "Orpheus's Sash",
        legs = "Agwu's slops",
        feet = "Agwu's pigaches"
    }

    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

    -- Gear for specific elemental nukes.
    sets.element.Dark = {
        head = "Pixie Hairpin +1",
        ring2 = "Archon Ring"
    }

    -- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {
        head = "Erilaz Galea +3",
        neck = "Incanter's Torque",
        ring1 = "Moonlight Ring",
        ring2 = "Stikini Ring +1",
        legs = "Rune. Trousers +3",
        back = "Altruistic Cape",
        waist = "Bishop's Sash"
    }
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
    sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        ammo = "Yamarang",
        head = "Carmine Mask +1",
        neck = "Unmoving Collar +1",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Handler's Earring +1",
        body = gear.herculean_waltz_body,
        hands = gear.herculean_waltz_hands,
        ring1 = "Defending Ring",
        ring2 = "Valseur's Ring",
        back = "Moonlight Cape",
        waist = "Chaac Belt",
        legs = "Dashing Subligar",
        feet = gear.herculean_waltz_feet
    }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {}

    sets.precast.JA['Violent Flourish'] = {}

    -- Fast cast sets for spells

    sets.precast.FC = {
        ammo = "Impatiens",
        head = "Rune. Bandeau +3",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquacious Earring",
        body = "Erilaz Surcoat +3",
        hands = "Agwu's Gages",
        ring1 = "Lebeche Ring",
        ring2 = "Kishar Ring",
        back = "Moonlight Cape",
        waist = "Tempus Fugit",
        legs = {
            name = "Herculean Trousers",
            augments = {'"Store TP"+4', '"Fast Cast"+7', 'Mag. Acc.+15 "Mag.Atk.Bns."+15'}
        },
        feet = "Carmine Greaves +1"
    }

    sets.precast.FC.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Rune. Bandeau +3",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Odnowa Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Moonbeam Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = "Siegel Sash",
        legs = "Futhark Trousers +3"
    })
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        neck = 'Magoraga beads',
        back = "Mujin Mantle"
    })
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    -- WEAPONSKILL Sets

    -- Default Weaponskill Set

    sets.precast.WS = {
        ammo = "Knobkierrie",
        head = "Nyame Helm",
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Beithir Ring",
        ring2 = "Regal Ring",
        back = {
            name = "Ogma's cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        waist = "Fotia Belt",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets"
    }

    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
    sets.precast.WS.HighAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})

    -- GREATSWORD WEAPONSKILLS

    -- Dimidiation Sets

    sets.precast.WS['Dimidiation'] = {
        ammo = "Knobkierrie",
        head = "Nyame Helm",
        neck = "Moonlight Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Trux Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Supershear Ring",
        ring2 = "Provocare Ring",
        waist = "Trance Belt",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        }
    }

    -- sets.precast.WS['Dimidiation'] = {ammo="Knobkierrie",
    -- head="Nyame Helm",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
    -- body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
    -- waist="Kentarch Belt +1",legs="Nyame flanchard",feet="Nyame sollerets",
    -- back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},}

    sets.precast.WS['Dimidiation'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
    sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    -- Resolution Sets

    sets.precast.WS['Resolution'] = {
        ammo = "Seeth. Bomblet +1",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'STR+12', 'DEX+12', 'Attack+20'}
        },
        neck = "Fotia Gorget",
        ear1 = "Moonshade Earring",
        ear2 = "Sherida Earring",
        body = "Adhemar jacket +1",
        ring1 = "Epona's Ring",
        ring2 = "Niqmaddu Ring",
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'STR+12', 'DEX+12', 'Attack+20'}
        },
        back = {
            name = "Ogma's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        },
        waist = "Fotia Belt",
        legs = "Samnuha Tights",
        feet = {
            name = "Herculean Boots",
            augments = {'"Triple Atk."+4', 'STR+4'}
        }
    }

    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    -- Fimbulvetr Sets

    sets.precast.WS['Fimbulvetr'] = {
        ammo = "Knobkierrie",
        head = "Nyame Helm",
        neck = "Moonlight Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Epaminondas's Ring",
        ring2 = "Ephramad's Ring",
        waist = "Kentarch Belt +1",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets",
        back = {
            name = "Ogma's cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    -- Shockwave Sets

    sets.precast.WS['Shockwave'] = {
        ammo = "Pemphredo Tathlum",
        head = "Erilaz Galea +3",
        neck = "Moonlight Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Crepuscular Earring",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        ring1 = "Crepuscular Ring",
        ring2 = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Eschan Stone",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }

    -- Groundstrike Sets

    sets.precast.WS['Ground Strike'] = {
        ammo = "Knobkierrie",
        head = "Nyame Helm",
        neck = "Rep. Plat. Medal",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Beithir Ring",
        ring2 = "Regal Ring",
        back = {
            name = "Ogma's cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        waist = "Kentarch Belt +1",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets"
    }

    sets.precast.WS['Ground Strike'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc, {})
    sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})

    -- GREAT AXE WEAPONSKILLS

    -- Armor Break Sets

    sets.precast.WS['Armor Break'] = {
        ammo = "Pemphredo Tathlum",
        head = "Erilaz Galea +3",
        neck = "Moonlight Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Crepuscular Earring",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        ring1 = "Crepuscular Ring",
        ring2 = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Eschan Stone",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }

    -- Steel Cyclone

    sets.precast.WS['Steel Cyclone'] = {
        ammo = "Knobkierrie",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Niqmaddu Ring",
        ring2 = "Regal Ring",
        back = {
            name = "Ogma's cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        },
        waist = "Sailfi Belt +1",
        legs = "Nyame flanchard",
        feet = "Nyame sollerets"
    }

    -- Fell Cleave

    sets.precast.WS['Fell Cleave'] = {
        ammo = "Knobkierrie",
        head = "Nyame helm",
        neck = "Caro Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        body = {
            name = "Herculean Vest",
            augments = {'"Dbl.Atk."+2', '"Store TP"+5', '"Treasure Hunter"+2', 'Accuracy+4 Attack+4'}
        },
        hands = "Nyame gauntlets",
        ring1 = "Pyrosoul Ring",
        ring2 = "Regal Ring",
        legs = {
            name = "Herculean Trousers",
            augments = {'INT+1', 'Pet: Mag. Acc.+19', '"Treasure Hunter"+2'}
        },
        waist = "Grunfeld Rope",
        feet = "Nyame sollerets",
        back = {
            name = "Ogma's cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'DEX+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        ammo = "Impatiens",
        head = "Carmine Mask +1",
        neck = "Voltsurge Torque",
        ear1 = "Enchntr. Earring +1",
        ear2 = "Loquacious Earring",
        body = "Dread Jupon",
        hands = "Agwu's Gages",
        ring1 = "Lebeche Ring",
        ring2 = "Kishar Ring",
        back = "Moonlight Cape",
        waist = "Flume Belt +1",
        legs = {
            name = "Herculean Trousers",
            augments = {'"Store TP"+4', '"Fast Cast"+7', 'Mag. Acc.+15 "Mag.Atk.Bns."+15'}
        },
        feet = "Carmine Greaves +1"
    }

    sets.midcast.FastRecast.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Fu. Bandeau +3",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Odnowa Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Moonbeam Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Flume Belt",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +3"
    }

    sets.midcast['Enhancing Magic'] = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Mimir Earring",
        body = "Futhark Coat +3",
        hands = "Regal Gauntlets",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        back = "Merciful Cape",
        waist = "Olympus Sash",
        legs = "Futhark Trousers +3",
        feet = "Nyame Sollerets"
    }

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Futhark Bandeau +3",
        body = {
            name = "Herculean Vest",
            augments = {'Sklchn.dmg.+1%', 'Pet: Phys. dmg. taken -2%', 'Phalanx +5', 'Mag. Acc.+11 "Mag.Atk.Bns."+11'}
        },
        hands = {
            name = "Herculean Gloves",
            augments = {'VIT+2', 'Weapon skill damage +3%', 'Phalanx +4', 'Accuracy+18 Attack+18',
                        'Mag. Acc.+15 "Mag.Atk.Bns."+15'}
        },
        legs = {
            name = "Herculean Trousers",
            augments = {'Enmity+5', '"Snapshot"+2', 'Phalanx +4', 'Mag. Acc.+4 "Mag.Atk.Bns."+4'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Pet: Mag. Acc.+23', 'Magic dmg. taken -1%', 'Phalanx +5'}
        }
    })

    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Rune. Bandeau +3",
        ear2 = "Erilaz Earring +2"
    })
    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Erilaz Galea +3"
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        neck = "Nodens gorget",
        ear2 = "Earthcry Earring",
        waist = "Siegel Sash"
    })
    sets.midcast.Flash = set_combine(sets.Enmity, {})
    sets.midcast.Foil = set_combine(sets.Enmity, {})
    -- sets.midcast.Stun = set_combine(sets.Enmity, {})
    sets.midcast.Stun = {
        ammo = "Pemphredo Tathlum",
        head = "Erilaz Galea +3",
        neck = "Erra Pendant",
        ear1 = "Mani Earring",
        ear2 = "Erilaz Earring +2",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Casso Sash",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }
    sets.midcast.Blank_Gaze = set_combine(sets.Enmity, {})
    sets.midcast.Jettatura = set_combine(sets.Enmity, {})
    sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
    sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cocoon = {
        ammo = "Staunch Tathlum +1",
        head = "Agwu's Cap",
        neck = "Moonlight Necklace",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation Earring",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        ring1 = "Defending Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Nyame sollerets"
    }

    sets.midcast.Cure = {
        ammo = "Staunch Tathlum +1",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto Earring",
        body = "Vrikodara Jupon",
        hands = "Nyame Gloves",
        ring1 = "Lebeche Ring",
        ring2 = "Kunaji Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'MND+20', 'Eva.+20 /Mag. Eva.+20', 'MND+10', '"Cure" potency +10%', 'Phys. dmg. taken-10%'}
        },
        waist = "Sroda Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.midcast['Utsusemi: Ichi'] = {
        ammo = "Homiliary",
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Shadow ring",
        ring2 = "Moonlight Ring",
        back = "Moonbeam Cape",
        waist = "Engraved Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame sollerets"
    }

    sets.midcast['Utsusemi: Ni'] = {
        ammo = "Homiliary",
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Shadow ring",
        ring2 = "Moonlight Ring",
        back = "Moonbeam Cape",
        waist = "Engraved Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame sollerets"
    }

    sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})

    sets.Self_Healing = {
        neck = "Phalaina Locket",
        hands = "Agwu's gages",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Cure_Received = {
        neck = "Phalaina Locket",
        hands = "Agwu's Gages",
        ring2 = "Kunaji Ring",
        waist = "Gishdubar Sash"
    }
    sets.Self_Refresh = {
        waist = "Gishdubar Sash"
    }

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })

    sets.midcast['Poisonga'] = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Moonlight Necklace",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation Earring",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        ring1 = "Defending Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Taeon Boots"
    }

    sets.midcast['Sheep Song'] = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Moonlight Necklace",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation Earring",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        ring1 = "Defending Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Taeon Boots"
    }

    sets.midcast['Soporific'] = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Moonlight Necklace",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation Earring",
        body = "Nyame Mail",
        hands = "Rawhide Gloves",
        ring1 = "Defending Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Spell interruption rate down-10%'}
        },
        waist = "Audumbla Sash",
        legs = "Carmine Cuisses +1",
        feet = "Taeon Boots"
    }

    sets.precast.WS['Shockwave'] = set_combine(sets.enmity, {
        body = {
            name = "Herculean Vest",
            augments = {'"Dbl.Atk."+2', '"Store TP"+5', '"Treasure Hunter"+2', 'Accuracy+4 Attack+4'}
        },
        legs = {
            name = "Herculean Trousers",
            augments = {'INT+1', 'Pet: Mag. Acc.+19', '"Treasure Hunter"+2'}
        }
    })
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.resting = {}

    sets.idle = {
        ammo = "Homiliary",
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Defending ring",
        ring2 = "Moonlight Ring",
        back = "Moonbeam Cape",
        waist = "Engraved belt",
        legs = "Nyame Flanchard",
        feet = "Erilaz Greaves +3"
    }

    sets.idle.BACKUP = {
        ammo = "Staunch Tathlum +1",
        head = "Turms Cap +1",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Ethereal Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Defending Ring",
        ring2 = "Moonlight Ring",
        back = "Shadow Mantle",
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +3"
    }

    sets.idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Fu. Bandeau +3",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation earring",
        body = "Futhark Coat +3",
        hands = "Turms Mittens +1",
        ring1 = "Defending ring",
        ring2 = "Moonlight Ring",
        back = "Ogma's cape",
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Turms Leggings +1"
    }
    sets.idle.Sphere = set_combine(sets.idle, {
        body = "Mekosu. Harness"
    })

    sets.idle.Tank = {
        ammo = "Staunch Tathlum +1",
        head = "Fu. Bandeau +3",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Ethereal Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Defending Ring",
        ring2 = "Moonbeam Ring",
        back = "Shadow Mantle",
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.idle.KiteTank = {
        ammo = "Staunch Tathlum +1",
        head = "Fu. Bandeau +3",
        neck = "Vim Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Ethereal Earring",
        body = "Futhark Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Flume Belt",
        legs = "Carmine Cuisses +1",
        feet = "Hippo. Socks +1"
    }

    sets.idle.Weak = {
        ammo = "Homiliary",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Defending ring",
        ring2 = "Moonlight Ring",
        back = "Moonbeam Cape",
        waist = "Engraved Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame sollerets"
    }

    sets.Kiting = {
        ring2 = "Shneddick Ring",
        feet = "Hippo. Socks +1"
    }

    sets.latent_refresh = {
        waist = "Fucho-no-obi"
    }
    sets.latent_refresh_grip = {
        sub = "Oneiros Grip"
    }
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {
        legs = "Dashing Subligar"
    }
    sets.MP = {
        ear2 = "Ethereal Earring",
        body = "Erilaz Surcoat +1",
        waist = "Flume Belt +1"
    }
    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

    -- f sets
    sets.weapons.Epeolatry = {
        main = "Epeolatry",
        sub = "Refined Grip +1"
    }
    sets.weapons.EpeolatryDD = {
        main = "Epeolatry",
        sub = "Utu Grip"
    }
    sets.weapons.Lionheart = {
        main = "Lionheart",
        sub = "Utu grip"
    }
    sets.weapons.Helheim = {
        main = "Helheim",
        sub = "Utu Grip"
    }
    sets.weapons.DualWeapons = {
        main = "Naegling",
        sub = "Reikiko"
    }
    sets.weapons.Lycurgos = {
        main = "Lycurgos",
        sub = "Utu Grip"
    }
    sets.weapons.Axe = {
        main = "Blurred Axe +1",
        sub = "Regis"
    }
    sets.weapons.Sword = {
        main = "Fermion Sword",
        sub = "Regis"
    }

    -- Defense Sets

    sets.defense.PDT = {
        ammo = "Homiliary",
        head = "Nyame Helm",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto earring",
        body = "Nyame Mail",
        hands = "Nyame gauntlets",
        ring1 = "Shadow ring",
        ring2 = "Moonlight Ring",
        back = "Moonbeam Cape",
        waist = "Engraved Belt",
        legs = "Nyame Flanchard",
        feet = "Nyame sollerets"
    }
    sets.defense.PDT_HP = {
        ammo = "Staunch Tathlum +1",
        head = "Fu. Bandeau +3",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Odnowa Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Flume Belt",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.MDT = {
        ammo = "Yamarang",
        head = "Erilaz Galea +3",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonlight Cape",
        waist = "Engraved Belt",
        legs = gear.herculean_dt_legs,
        feet = "Erilaz Greaves +1"
    }
    sets.defense.MDT_HP = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Odnowa Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Moonbeam Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Engraved Belt",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.BDT = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Moonlight Cape",
        waist = "Engraved Belt",
        legs = gear.herculean_dt_legs,
        feet = "Erilaz Greaves +1"
    }
    sets.defense.BDT_HP = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Loricate Torque +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Odnowa Earring",
        body = "Runeist Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Moonbeam Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Engraved Belt",
        legs = "Eri. Leg Guards +1",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.MEVA = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Purity Ring",
        ring2 = "Vengeful Ring",
        back = gear.enmity_jse_back,
        waist = "Engraved Belt",
        legs = "Rune. Trousers +3",
        feet = "Erilaz Greaves +1"
    }
    sets.defense.MEVA_HP = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Moonbeam Ring",
        ring2 = "Moonbeam Ring",
        back = "Moonlight Cape",
        waist = "Engraved Belt",
        legs = "Rune. Trousers +3",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.Death = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Purity Ring",
        ring2 = "Vengeful Ring",
        back = gear.enmity_jse_back,
        waist = "Engraved Belt",
        legs = "Rune. Trousers +3",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.DTCharm = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Unmoving Collar +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Defending Ring",
        ring2 = "Dark Ring",
        back = gear.enmity_jse_back,
        waist = "Engraved Belt",
        legs = "Rune. Trousers +3",
        feet = "Erilaz Greaves +1"
    }

    sets.defense.Charm = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Unmoving Collar +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Sanare Earring",
        body = "Runeist Coat +3",
        hands = "Erilaz Gauntlets +1",
        ring1 = "Purity Ring",
        ring2 = "Vengeful Ring",
        back = gear.enmity_jse_back,
        waist = "Engraved Belt",
        legs = "Rune. Trousers +3",
        feet = "Erilaz Greaves +1"
    }

    -- Swap to these on Moonshade using WS if at 3000 TP
    sets.MaxTP = {
        ear1 = "Brutal Earring"
    }
    sets.AccMaxTP = {
        ear1 = "Telos Earring"
    }

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    sets.engaged = {
        ammo = "Coiste Bodhar",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Moonlight Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', '"Store TP"+10', 'Parrying rate+5%'}
        },
        waist = "Engraved Belt",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }

    sets.engaged.Parry = {
        ammo = "Coiste Bodhar",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Ilabrat ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', '"Store TP"+10', 'Parrying rate+5%'}
        },
        waist = "Engraved Belt",
        legs = "Eri. Leg Guards +3",
        feet = "Turms Leggings +1"
    }

    sets.engaged.DDHybrid = {
        ammo = "Coiste Bodhar",
        head = "Nyame Helm",
        neck = "Futhark Torque +2",
        ear1 = "Telos Earring",
        ear2 = "Dedition Earring",
        body = "Ashera Harness",
        hands = "Nyame gauntlets",
        ring1 = "Ilabrat Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', '"Store TP"+10', 'Parrying rate+5%'}
        },
        waist = "Ioskeha Belt +1",
        legs = "Volte Tights",
        feet = "Nyame Sollerets"
    }

    sets.engaged.Helheim = {
        ammo = "Coiste Bodhar",
        head = "Nyame Helm",
        neck = "Anu Torque",
        ear1 = "Cessance Earring",
        ear2 = "Sherida Earring",
        body = "Ashera Harness",
        hands = "Nyame gauntlets",
        ring1 = "Ilabrat Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        },
        waist = "Ioskeha Belt +1",
        legs = "Nyame Sollerets",
        feet = "Erilaz Greaves +3"
    }

    sets.engaged.Empyrean = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        neck = "Warder's Charm +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Tuisto Earring",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        ring1 = "Shadow Ring",
        ring2 = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', '"Store TP"+10', 'Parrying rate+5%'}
        },
        waist = "Flume Belt +1",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3"
    }

    sets.engaged.TPBuild = {
        ammo = "Coiste Bodhar",
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        neck = "Anu Torque",
        ear1 = "Sherida Earring",
        ear2 = "Telos Earring",
        body = "Ashera Harness",
        hands = "Adhemar Wrist. +1",
        ring1 = "Ilabrat Ring",
        ring2 = "Niqmaddu Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', '"Store TP"+10', 'Parrying rate+5%'}
        },
        waist = "Ioskeha Belt +1",
        legs = "Samnuha Tights",
        feet = "Carmine Greaves +1"
    }

    sets.engaged.SomeAcc = {
        ammo = "Yamarang",
        head = "Dampening Tam",
        neck = "Combatant's Torque",
        ear1 = "Brutal Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Adhemar Wrist. +1",
        ring1 = "Niqmaddu Ring",
        ring2 = "Epona's Ring",
        back = gear.stp_jse_back,
        waist = "Windbuffet Belt +1",
        legs = "Samnuha Tights",
        feet = gear.herculean_ta_feet
    }
    sets.engaged.Acc = {
        ammo = "Falcon Eye",
        head = "Dampening Tam",
        neck = "Combatant's Torque",
        ear1 = "Cessance Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Adhemar Wrist. +1",
        ring1 = "Niqmaddu Ring",
        ring2 = "Epona's Ring",
        back = gear.stp_jse_back,
        waist = "Windbuffet Belt +1",
        legs = "Meg. Chausses +2",
        feet = gear.herculean_ta_feet
    }
    sets.engaged.HighAcc = {
        ammo = "Falcon Eye",
        head = "Aya. Zucchetto +2",
        neck = "Combatant's Torque",
        ear1 = "Telos Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Niqmaddu Ring",
        ring2 = "Ilabrat Ring",
        back = gear.stp_jse_back,
        waist = "Grunfeld Rope",
        legs = "Meg. Chausses +2",
        feet = gear.herculean_acc_feet
    }
    sets.engaged.FullAcc = {
        ammo = "Falcon Eye",
        head = "Carmine Mask +1",
        neck = "Combatant's Torque",
        ear1 = "Telos Earring",
        ear2 = "Mache Earring +1",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Ramuh Ring +1",
        ring2 = "Ramuh Ring +1",
        back = gear.stp_jse_back,
        waist = "Olseni Belt",
        legs = "Carmine Cuisses +1",
        feet = gear.herculean_acc_feet
    }
    sets.engaged.DTLite = {
        ammo = "Yamarang",
        head = "Aya. Zucchetto +2",
        neck = "Loricate Torque +1",
        ear1 = "Brutal Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Patricius Ring",
        back = "Moonlight Cape",
        waist = "Windbuffet Belt +1",
        legs = "Meg. Chausses +2",
        feet = "Ahosi Leggings"
    }
    sets.engaged.SomeAcc.DTLite = {
        ammo = "Falcon Eye",
        head = "Aya. Zucchetto +2",
        neck = "Loricate Torque +1",
        ear1 = "Cessance Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Patricius Ring",
        back = "Moonlight Cape",
        waist = "Windbuffet Belt +1",
        legs = "Meg. Chausses +2",
        feet = "Ahosi Leggings"
    }
    sets.engaged.Acc.DTLite = {
        ammo = "Falcon Eye",
        head = "Aya. Zucchetto +2",
        neck = "Loricate Torque +1",
        ear1 = "Telos Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Patricius Ring",
        back = "Moonlight Cape",
        waist = "Grunfeld Rope",
        legs = "Meg. Chausses +2",
        feet = "Ahosi Leggings"
    }
    sets.engaged.HighAcc.DTLite = {
        ammo = "Falcon Eye",
        head = "Aya. Zucchetto +2",
        neck = "Loricate Torque +1",
        ear1 = "Telos Earring",
        ear2 = "Sherida Earring",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Patricius Ring",
        back = "Moonlight Cape",
        waist = "Olseni Belt",
        legs = "Meg. Chausses +2",
        feet = "Ahosi Leggings"
    }
    sets.engaged.FullAcc.DTLite = {
        ammo = "Falcon Eye",
        head = "Aya. Zucchetto +2",
        neck = "Loricate Torque +1",
        ear1 = "Telos Earring",
        ear2 = "Mache Earring +1",
        body = "Ayanmo Corazza +2",
        hands = "Meg. Gloves +2",
        ring1 = "Defending Ring",
        ring2 = "Patricius Ring",
        back = "Moonlight Cape",
        waist = "Olseni Belt",
        legs = "Meg. Chausses +2",
        feet = "Ahosi Leggings"
    }
    sets.engaged.Tank = {
        ammo = "Staunch Tathlum +1",
        head = "Meghanada Visor +2",
        neck = "Loricate Torque +1",
        ear1 = "Genmei Earring",
        ear2 = "Ethereal Earring",
        body = "Futhark Coat +3",
        hands = gear.herculean_dt_hands,
        ring1 = "Defending Ring",
        ring2 = "Shadow Ring",
        back = "Shadow Mantle",
        waist = "Engraved Belt",
        legs = gear.herculean_dt_legs,
        feet = "Erilaz Greaves +3"
    }

    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
    sets.engaged.Acc.Tank = sets.engaged.Tank
    sets.engaged.HighAcc.Tank = sets.engaged.Tank
    sets.engaged.FullAcc.Tank = sets.engaged.Tank

    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    sets.buff.Doom = set_combine(sets.buff.Doom, {
        ring1 = "Blenmot's Ring +1",
        ring2 = "Blenmot's Ring +1",
        neck = "Nicander's Necklace"
    })
    sets.buff.Sleep = {
        head = "Frenzy Sallet"
    }
    sets.buff.Battuta = {
        feet = "Futhark Boots +3"
    }
    sets.buff.Embolden = {
        back = "Evasionist's Cape"
    }
    sets.buff.Elvorseal = {
        body = "Heidrek Harness",
        hands = "Heidrek Gloves",
        feet = "Heidrek Boots"
    }

    sets.Phalanx_Recieved = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Futhark Bandeau +3",
        body = {
            name = "Herculean Vest",
            augments = {'Sklchn.dmg.+1%', 'Pet: Phys. dmg. taken -2%', 'Phalanx +5', 'Mag. Acc.+11 "Mag.Atk.Bns."+11'}
        },
        hands = {
            name = "Herculean Gloves",
            augments = {'VIT+2', 'Weapon skill damage +3%', 'Phalanx +4', 'Accuracy+18 Attack+18',
                        'Mag. Acc.+15 "Mag.Atk.Bns."+15'}
        },
        legs = {
            name = "Herculean Trousers",
            augments = {'Enmity+5', '"Snapshot"+2', 'Phalanx +4', 'Mag. Acc.+4 "Mag.Atk.Bns."+4'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Pet: Mag. Acc.+23', 'Magic dmg. taken -1%', 'Phalanx +5'}
        }
    })
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 19)
    elseif player.sub_job == 'RDM' then
        set_macro_page(5, 19)
    elseif player.sub_job == 'SCH' then
        set_macro_page(2, 10)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 1)
    elseif player.sub_job == 'WAR' then
        set_macro_page(7, 19)
    elseif player.sub_job == 'SAM' then
        set_macro_page(8, 19)
    elseif player.sub_job == 'DRK' then
        set_macro_page(7, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 19)
    else
        set_macro_page(6, 5)
    end
end

-- Job Specific Trust Overwrite
function check_trust()
    if not moving then
        if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and
            (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
            local party = windower.ffxi.get_party()
            if party.p5 == nil then
                local spell_recasts = windower.ffxi.get_spell_recasts()

                if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
                    windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
                    windower.send_command('input /ma "Koru-Moru" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
                    windower.send_command('input /ma "Selh\'teus" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
                    windower.send_command('input /ma "Qultada" <me>')
                    tickdelay = os.clock() + 3
                    return true
                elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
                    windower.send_command('input /ma "Ulmia" <me>')
                    tickdelay = os.clock() + 3
                    return true
                else
                    return false
                end
            end
        end
    end
    return false
end
