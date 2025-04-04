-- Original: Motenten / Modified: Arislan
-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------
--  Modes:      [ F9 ]              Cycle Offense Modes
--              [ CTRL+F9 ]         Cycle Hybrid Modes
--              [ WIN+F9 ]          Cycle Weapon Skill Modes
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ WIN+H ]           Toggle Charm Defense Mods
--              [ WIN+D ]           Toggle Death Defense Mods
--              [ WIN+K ]           Toggle Knockback Defense Mods
--              [ WIN+A ]           AttackMode: Capped/Uncapped WS Modifier
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+` ]          Use current Rune
--              [ CTRL+- ]          Rune element cycle forward.
--              [ CTRL+= ]          Rune element cycle backward.
--              [ CTRL+` ]          Use current Rune
--
--              [ CTRL+Numpad/ ]    Berserk/Meditate/Souleater
--              [ CTRL+Numpad* ]    Warcry/Sekkanoki/Arcane Circle
--              [ CTRL+Numpad- ]    Aggressor/Third Eye/Weapon Bash
--
--  Spells:     [ WIN+, ]           Utsusemi: Ichi
--              [ WIN+. ]           Utsusemi: Ni
--
--  Weapons:    [ CTRL+G ]          Cycles between available greatswords
--              [ CTRL+W ]          Toggle Weapon Lock
--
--  WS:         [ CTRL+Numpad7 ]    Resolution
--              [ CTRL+Numpad8 ]    Upheaval
--              [ CTRL+Numpad9 ]    Dimidiation
--              [ CTRL+Numpad5 ]    Ground Strike
--              [ CTRL+Numpad6 ]    Full Break
--              [ CTRL+Numpad1 ]    Herculean Slash
--              [ CTRL+Numpad2 ]    Shockwave
--              [ CTRL+Numpad3 ]    Armor Break
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)
-------------------------------------------------------------------------------------------------------------------
--  Custom Commands (preface with /console to use these in macros)
-------------------------------------------------------------------------------------------------------------------
--  gs c rune                       Uses current rune
--  gs c cycle Runes                Cycles forward through rune elements
--  gs c cycleback Runes            Cycles backward through rune elements
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
    res = require 'resources'
end

-- Setup vars that are user-independent.
function job_setup()

    rune_enchantments = S {'Ignis', 'Gelus', 'Flabra', 'Tellus', 'Sulpor', 'Unda', 'Lux', 'Tenebrae'}

    -- /BLU Spell Maps
    blue_magic_maps = {}

    blue_magic_maps.Enmity = S {'Blank Gaze', 'Geist Wall', 'Jettatura', 'Soporific', 'Poison Breath', 'Blitzstrahl',
                                'Sheep Song', 'Chaotic Eye'}
    blue_magic_maps.Cure = S {'Wild Carrot'}
    blue_magic_maps.Buffs = S {'Cocoon', 'Refueling'}

    no_swap_gear = S {"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)", "Trizek Ring",
                      "Echad Ring", "Facility Ring", "Capacity Ring"}

    rayke_duration = 35
    gambit_duration = 96

    lockstyleset = 197
    -- lockstyleset = 19

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc', 'STP', 'Hybrid')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'DT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh', 'Regen')
    state.PhysicalDefenseMode:options('PDT', 'HP', 'Parry', 'ParryDT')
    state.MagicalDefenseMode:options('MDT')

    state.Knockback = M(false, 'Knockback')

    state.WeaponSet = M {
        ['description'] = 'Weapon Set',
        'Epeolatry',
        'Lionheart',
        'Lycurgos'
    }
    state.AttackMode = M {
        ['description'] = 'Attack',
        'Uncapped',
        'Capped'
    }
    -- state.CP = M(false, "Capacity Points Mode")
    state.WeaponLock = M(false, 'Weapon Lock')

    state.Runes = M {
        ['description'] = 'Runes',
        'Ignis',
        'Gelus',
        'Flabra',
        'Tellus',
        'Sulpor',
        'Unda',
        'Lux',
        'Tenebrae'
    }

    -- Additional local binds
    -- include('Global-Binds.lua') -- OK to remove this line
    -- include('Global-GEO-Binds.lua') -- OK to remove this line

    send_command('bind ^` input //gs c rune')
    send_command('bind !` input /ja "Vivacious Pulse" <me>')
    send_command('bind ^insert gs c cycleback Runes')
    send_command('bind ^delete gs c cycle Runes')
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    send_command('bind @a gs c cycle AttackMode')
    -- send_command('bind @c gs c toggle CP')
    send_command('bind @e gs c cycleback WeaponSet')
    send_command('bind @r gs c cycle WeaponSet')
    send_command('bind @w gs c toggle WeaponLock')
    send_command('bind @k gs c toggle Knockback')
    send_command('bind !q input /ma "Temper" <me>')

    if player.sub_job == 'BLU' then
        send_command('bind !w input /ma "Cocoon" <me>')
    elseif player.sub_job == 'WAR' then
        send_command('bind !w input /ja "Defender" <me>')
    elseif player.sub_job == 'DRK' then
        send_command('bind !w input /ja "Last Resort" <me>')
    elseif player.sub_job == 'SAM' then
        send_command('bind !w input /ja "Hasso" <me>')
    end

    send_command('bind !o input /ma "Regen IV" <stpc>')
    send_command('bind !p input /ma "Shock Spikes" <me>')

    send_command('bind @w gs c toggle WeaponLock')

    if player.sub_job == 'WAR' then
        send_command('bind ^numpad/ input /ja "Berserk" <me>')
        send_command('bind ^numpad* input /ja "Warcry" <me>')
        send_command('bind ^numpad- input /ja "Aggressor" <me>')
    elseif player.sub_job == 'DRK' then
        send_command('bind ^numpad/ input /ja "Souleater" <me>')
        send_command('bind ^numpad* input /ja "Arcane Circle" <me>')
        send_command('bind ^numpad- input /ja "Weapon Bash" <me>')
    elseif player.sub_job == 'SAM' then
        send_command('bind ^numpad/ input /ja "Meditate" <me>')
        send_command('bind ^numpad* input /ja "Sekkanoki" <me>')
        send_command('bind ^numpad- input /ja "Third Eye" <me>')
    end

    send_command('bind ^numpad7 input /ws "Resolution" <t>')
    send_command('bind ^numpad8 input /ws "Upheaval" <t>')
    send_command('bind ^numpad9 input /ws "Dimidiation" <t>')
    send_command('bind ^numpad5 input /ws "Ground Strike" <t>;input /p Ground Strike')
    send_command('bind ^numpad6 input /ws "Full Break" <t>')
    send_command('bind ^numpad1 input /ws "Herculean Slash" <t>')
    send_command('bind ^numpad2 input /ws "Shockwave" <t>')
    send_command('bind ^numpad3 input /ws "Armor Break" <t>')

    select_default_macro_book()
    set_lockstyle()

    state.Auto_Kite = M(false, 'Auto_Kite')
    moving = false
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^f11')
    send_command('unbind ^insert')
    send_command('unbind ^delete')
    send_command('unbind @a')
    -- send_command('unbind @c')
    send_command('unbind @d')
    send_command('unbind !q')
    send_command('unbind @w')
    send_command('unbind @e')
    send_command('unbind @r')
    send_command('unbind !o')
    send_command('unbind !p')
    send_command('unbind ^,')
    send_command('unbind @w')
    send_command('unbind ^numpad/')
    send_command('unbind ^numpad*')
    send_command('unbind ^numpad-')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad9')
    send_command('unbind ^numpad5')
    send_command('unbind ^numpad1')
    send_command('unbind @numpad*')

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

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Precast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Enmity = {
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        -- neck = {
        --     name = "Unmoving Collar +1",
        --     augments = {'Path: A'}
        -- },
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        -- left_ear = "Cryptic Earring",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Supershear Ring",
        right_ring = "Moonlight Ring",
        -- back = "Moonbeam Cape"
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'HP+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.precast.JA['Vallation'] = set_combine(sets.Enmity, {
        body = "Runeist's Coat +3",
        legs = "Futhark Trousers +2",
        back = gear.RUN_HPD_Cape
    })

    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']

    sets.precast.JA['Pflug'] = set_combine(sets.Enmity, {
        feet = "Runeist's Bottes +1"
    })
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity, {
        head = "Fu. Bandeau +3"
    })
    sets.precast.JA['Liement'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +3"
    })

    sets.precast.JA['Lunge'] = {
        ammo = "Seething Bomblet +1",
        head = "Agwu's Cap",
        body = "Agwu's Robe",
        hands = "Agwu's Gages",
        legs = "Agwu's Slops",
        feet = "Agwu's Pigaches",
        neck = "Baetyl Pendant",
        ear1 = "Crematio Earring",
        ear2 = "Friomisi Earring",
        ring1 = "Shiva Ring +1",
        ring2 = "Shiva Ring +1",
        back = "Argocham. Mantle",
        waist = "Eschan Stone"
    }

    sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity, {
        hands = "Runeist's Mitons +2"
    })
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity, {
        feet = "Futhark Boots +1"
    })
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
        body = "Futhark Coat +3"
    })
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity, {
        hands = "Futhark Mitons +1"
    })

    sets.precast.JA['Vivacious Pulse'] = {
        ammo = "Sapience Orb",
        head = "Erilaz Galea +3",
        -- body = {
        --     name = "Runeist's Coat +3",
        --     priority = 5
        -- },
        legs = "Rune. Trousers +1",
        -- feet = {
        --     name = "Turms Leggings +1",
        --     priority = 2
        -- },
        neck = "Incanter's Torque",
        -- ear1 = {
        --     name = "Tuisto Earring",
        --     priority = 4
        -- },
        ear2 = "Saxnot Earring",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        back = "Altruistic Cape",
        waist = "Bishop's Sash"
    }

    sets.precast.JA['Vivacious Pulse'].Status = {
        head = "Erilaz Galea +3",
        -- body="Erilaz Surcoat +3",
        -- hands="Turms Mittens +1",
        legs = "Rune. Trousers +1",
        -- feet="Erilaz Greaves +3",
        neck = "Incanter's Torque",
        -- waist="Engraved Belt",
        -- left_ear="Tuisto Earring",
        -- right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1"
        -- back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
    }

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo = "Sapience Orb",
        head = "Runeist's Bandeau +2",
        body = "Erilaz Surcoat +3",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = "Aya. Cosciales +2",
        feet = {
            name = "Carmine Greaves",
            augments = {'MP+60', 'INT+10', 'MND+10'}
        },
        neck = "Orunmila's Torque", -- voltsurge torque for 4% fast cast
        waist = "Plat. Mog. Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Loquac. Earring",
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = { -- add Sird to this cape
            name = "Ogma's Cape",
            augments = {'HP+60', 'HP+20', '"Fast Cast"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.precast.FC.HP = set_combine(sets.precast.FC, {
        ammo = "Sapience Orb",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Regal Gauntlets",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Oneiros Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Ilabrat Ring",
        right_ring = "Moonlight Ring",
        back = "Moonbeam Cape"
    })

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        hands = "Regal Gauntlets",
        neck = "Sacro Gorget",
        legs = "Futhark Trousers +2",
        waist = "Olympus Sash"
    })

    ------------------------------------------------------------------------------------------------
    ------------------------------------- Weapon Skill Sets ----------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.precast.WS = {
        ammo = "Knobkierrie",
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
        ear1 = "Sherida Earring",
        ear2 = "Moonshade Earring",
        ring1 = "Regal Ring",
        ring2 = "Niqmaddu Ring",
        back = gear.RUN_WS1_Cape,
        waist = "Fotia Belt"
    }

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        ammo = "Voluspa Tathlum",
        body = gear.Adhemar_B_body,
        legs = "Meg. Chausses +2",
        ear2 = "Telos Earring"
    })

    sets.precast.WS.Uncapped = set_combine(sets.precast.WS, {
        ammo = "Aurgelmir Orb +1"
    })

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
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
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Epona's Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%'}
        }
    })

    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {
        ammo = "Voluspa Tathlum",
        head = "Blistering Sallet +1",
        hands = gear.Adhemar_A_hands,
        legs = "Meg. Chausses +2",
        ear2 = "Telos Earring"
    })

    sets.precast.WS['Resolution'].Uncapped = set_combine(sets.precast.WS['Resolution'], {
        body = gear.Adhemar_B_body,
        legs = "Meg. Chausses +2",
        feet = gear.Herc_TA_feet,
        ring1 = "Regal Ring"
    })

    sets.precast.WS['Resolution'].Safe = set_combine(sets.precast.WS['Resolution'], {
        head = "Blistering Sallet +1",
        body = gear.Adhemar_B_body,
        feet = gear.Herc_TA_feet
    })

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS, {
        sub = "Utu Grip",
        ammo = "Knobkierrie",
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
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        -- right_ear = "Sherida Earring",
        right_ear = "Odr Earring",
        left_ring = "Cornelia's Ring",
        right_ring = "Niqmaddu Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Weapon skill damage +10%'}
        }
    })

    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'], {
        ammo = "Voluspa Tathlum",
        body = gear.Adhemar_B_body,
        legs = "Samnuha Tights",
        ear2 = "Mache Earring +1"
    })

    sets.precast.WS['Dimidiation'].Uncapped = set_combine(sets.precast.WS['Dimidiation'], {
        neck = "Caro Necklace",
        waist = "Grunfeld Rope"
    })

    sets.precast.WS['Dimidiation'].Safe = set_combine(sets.precast.WS['Dimidiation'], {
        legs = "Lustr. Subligar +1",
        feet = gear.Herc_TA_feet
    })

    sets.precast.WS['Herculean Slash'] = sets.precast.JA['Lunge']

    sets.precast.WS['Shockwave'] = {
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
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Hermetic Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', '"Dbl.Atk."+10'}
        }
    }

    sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {
        feet = "Lustra. Leggings +1",
        ear2 = "Ishvara Earring",
        back = gear.RUN_WS1_Cape,
        waist = "Sailfi Belt +1"
    })

    sets.precast.WS['Fell Cleave'].Acc = set_combine(sets.precast.WS.Acc, {
        ear2 = "Ishvara Earring",
        back = gear.RUN_WS1_Cape,
        waist = "Sailfi Belt +1"
    })

    sets.precast.WS['Fell Cleave'].Safe = set_combine(sets.precast.WS, {
        feet = "Futhark Boots +3"
    })

    sets.precast.WS['Steel Cyclone'] = sets.precast.WS['Fell Cleave']
    sets.precast.WS['Steel Cyclone'].Acc = sets.precast.WS['Fell Cleave'].Acc
    sets.precast.WS['Steel Cyclone'].Safe = sets.precast.WS['Fell Cleave'].Safe

    sets.precast.WS['Upheaval'] = sets.precast.WS['Resolution']
    sets.precast.WS['Upheaval'].Acc = sets.precast.WS['Resolution'].Acc
    sets.precast.WS['Upheaval'].Safe = sets.precast.WS['Resolution'].Safe

    sets.precast.WS['Shield Break'] = sets.precast.WS['Shockwave']
    sets.precast.WS['Armor Break'] = sets.precast.WS['Shockwave']
    sets.precast.WS['Weapon Break'] = sets.precast.WS['Shockwave']
    sets.precast.WS['Full Break'] = sets.precast.WS['Shockwave']

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Midcast Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galae +3",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Regal Gauntlets",
        legs = {
            name = "Carmine Cuisses +1",
            augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6'}
        },
        feet = "Erilaz Greaves +3",
        neck = "Moonbeam Necklace",
        waist = "Audumbla Sash",
        left_ear = "Halasz Earring",
        right_ear = "Tuisto Earring", -- magnetic earring would go here
        left_ring = "Evanescence Ring",
        right_ring = "Moonlight Ring",
        back = "Moonbeam Cape" -- need to change to JSE ambu cape with Sird
    } -- +10% from merit points

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

    sets.midcast.Cure = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Erilaz Gauntlets +3",
        legs = "Erilaz Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = "Sacro Gorget", -- 10
        ear1 = "Tuisto Earring", -- 4
        ear2 = "Mendi. Earring", -- 5
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring", -- 5
        waist = "Sroda Belt",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.SpellInterrupt, {
        head = "Erilaz Galea +3",
        hands = "Regal Gauntlets",
        neck = "Sacro Gorget",
        legs = "Futhark Trousers +2"
    })

    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'], {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Fu. Bandeau +3",
            augments = {'Enhances "Battuta" effect'}
        },
        body = {
            name = "Herculean Vest",
            augments = {'MND+2', 'CHR+6', 'Phalanx +1', 'Accuracy+11 Attack+11'}
        },
        hands = "Runeist Mitons +2",
        legs = {
            name = "Herculean Trousers",
            augments = {'"Snapshot"+5', 'Pet: DEX+9', 'Phalanx +2', 'Accuracy+6 Attack+6',
                        'Mag. Acc.+3 "Mag.Atk.Bns."+3'}
        },
        feet = {
            name = "Herculean Boots",
            augments = {'Magic dmg. taken -3%', 'Attack+12', 'Phalanx +4', 'Mag. Acc.+17 "Mag.Atk.Bns."+17'}
        },
        neck = "Incanter's Torque",
        -- waist = "Olympus Sash",
        waist = "Plat. Mog. Belt",
        left_ear = "Mimir Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {
        -- main="Nibiru Faussar", --1
        -- sub="Refined Grip +1",
    })

    sets.midcast.Temper = {
        -- main="Pukulatmuj +1",
        head = "Carmine Mask +1",
        body = "Manasa Chasuble",
        hands = "Runeist's Mitons +3",
        legs = "Carmine Cuisses +1",
        -- feet = "Carmine Greaves +1",
        neck = "Incanter's Torque",
        ear1 = "Mimir Earring",
        ear2 = "Andoaa Earring",
        ring1 = "Stikini Ring +1",
        ring2 = "Stikini Ring +1",
        back = "Merciful Cape",
        waist = "Olympus Sash"
    }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Rune. Bandeau +1",
        hands = "Regal Gauntlets",
        legs = "Futhark Trousers +2",
        neck = "Sacro Gorget",
        right_ear = {
            name = "Erilaz Earring +1",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+12', 'Mag. Acc.+12', 'Damage taken-4%'}
        }
    })
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head = "Erilaz Galea +3",
        waist = "Gishdubar Sash"
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        waist = "Siegel Sash"
        -- legs = "Doyen Pants"
    })
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ring2 = "Sheltered Ring"
    })
    sets.midcast.Shell = sets.midcast.Protect

    sets.midcast['Divine Magic'] = sets.Enmity

    sets.midcast['Enfeebling Magic'] = {
        -- main = "Lycurgos",
        -- sub = "Khonsu",
        -- ammo = "Pemphredo Tathlum",
        -- head = "Blistering Sallet +1",
        -- body = "Ayanmo Corazza +2",
        -- hands = "Aya. Manopolas +2",
        -- legs = "Aya. Cosciales +2",
        -- feet = "Aya. Gambieras +2",
        -- neck = "Erra Pendant",
        -- ear1 = "Digni. Earring",
        -- ear2 = "Vor Earring",
        -- ring1 = "Metamor. Ring +1",
        -- ring2 = "Weather. Ring +1",
        -- back = "Evasionist's Cape",
        -- waist = "Acuity Belt +1"
        ammo = "Sapience Orb",
        head = "Halitus Helm",
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Supershear Ring",
        right_ring = "Moonlight Ring",
        back = "Moonbeam Cape"
    }

    sets.midcast.Flash = sets.Enmity
    sets.midcast.Foil = sets.Enmity
    sets.midcast.Stun = sets.Enmity
    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

    sets.midcast['Blue Magic'] = {}
    sets.midcast['Blue Magic'].Enmity = sets.Enmity
    sets.midcast['Blue Magic'].Cure = sets.midcast.Cure
    sets.midcast['Blue Magic'].Buff = {}

    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Idle Sets --------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        ammo = "Staunch Tathlum +1",
        -- head = "Nyame Helm",
        head = "Erilaz Galea +3",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        legs = "Erilaz Leg Guards +3",
        feet = "Erilaz Greaves +3",
        -- neck = "Warder's Charm +1",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        -- left_ring = {
        --     name = "Gelatinous Ring +1",
        --     augments = {'Path: A'}
        -- },
        left_ring = "Shneddick Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Null Masque",
        body = "Erilaz Surcoat +3",
        hands = "Turms Mittens +1",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Engraved Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        -- left_ring = {
        --     name = "Gelatinous Ring +1",
        --     augments = {'Path: A'}
        -- },
        left = "Shneddick Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.idle.Refresh = set_combine(sets.idle, {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Runeist Coat +3",
        hands = "Regal Gauntlets",
        legs = {
            name = "Rawhide Trousers",
            augments = {'MP+50', '"Fast Cast"+5', '"Refresh"+1'}
        },
        feet = "Erilaz Greaves +3",
        neck = "Warder's Charm +1",
        waist = "Engraved Belt",
        left_ear = "Eabani Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    })

    sets.idle.Regen = set_combine(sets.idle, {
        ammo = "Staunch Tathlum +1",
        head = "Turms Cap",
        body = {
            name = "Futhark Coat +3",
            augments = {'Enhances "Elemental Sforzo" effect'}
        },
        hands = "Regal Gauntlets",
        legs = {
            name = "Carmine Cuisses +1",
            augments = {'Accuracy+20', 'Attack+12', '"Dual Wield"+6'}
        },
        feet = "Turms Leggings +1",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.idle.Town = set_combine(sets.idle, {
        ammo = "Staunch Tathlum +1",
        head = "Erilaz Galea +3",
        body = "Erilaz Surcoat +3",
        hands = "Erilaz Gauntlets +3",
        legs = "Erilaz Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Shneddick Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.Kiting = {
        left_ring = "Shneddick Ring"
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Defense Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.defense.Knockback = {
        back = "Repulse Mantle"
    }

    sets.defense.PDT = {
        sub = {
            name = "Refined Grip +1",
            augments = {'Path: A'}
        },
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Erilaz Surcoat +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Enmity+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.defense.MDT = {
        sub = {
            name = "Refined Grip +1",
            augments = {'Path: A'}
        },
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Runeist Coat +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        neck = "Warder's Charm +1",
        waist = "Engraved Belt",
        left_ear = "Eabani Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    }

    sets.defense.HP = {
        ammo = "Staunch Tathlum +1",
        head = {
            "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        hands = "Regal Gauntlets",
        legs = {
            name = "Nyame Flanchard",
            augments = {'Path: B'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = {
            name = "Unmoving Collar +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Ilabrat Ring",
        right_ring = "Moonlight Ring",
        back = "Moonbeam Cape"
    }

    sets.defense.Parry = {
        hands = "Turms Mittens +1",
        legs = "Eri. Leg Guards +3",
        feet = "Turms Leggings +1",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    }

    sets.defense.ParryDT = {
        sub = {
            name = "Refined Grip +1",
            augments = {'Path: A'}
        },
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Erilaz Surcoat +3",
        hands = "Turms Mittens +1",
        legs = "Eri. Leg Guards +3",
        feet = "Turms Leggings +1",
        neck = {
            name = "Loricate Torque +1",
            augments = {'Path: A'}
        },
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Defending Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Engaged Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.engaged = {
        ammo = "Staunch Tathlum +1",
        -- head = "Erilaz Galea +3",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Erilaz Surcoat +3",
        -- hands = "Erilaz Gauntlets +3",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        -- hands = "Turms Mittens +1",
        legs = "Eri. Leg Guards +3",
        feet = "Erilaz Greaves +3",
        -- neck = "Warder's Charm +1",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Engraved Belt",
        -- wait = "Flume Belt +1",
        left_ear = "Tuisto Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = {
            name = "Gelatinous Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'HP+60', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', 'Enmity+10', 'Parrying rate+5%'}
        }
    }

    sets.engaged.LowAcc = set_combine(sets.engaged, {
        -- head = "Dampening Tam",
        -- hands = gear.Adhemar_A_hands,
        -- neck = "Combatant's Torque",
        -- waist = "Ioskeha Belt +1"
    })

    sets.engaged.MidAcc = set_combine(sets.engaged.LowAcc, {
        ammo = "Yamarang",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        ring1 = "Regal Ring"
    })

    sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
        -- ammo = "C. Palug Stone",
        -- head = "Carmine Mask +1",
        -- body = "Carm. Sc. Mail +1",
        -- hands = "Gazu Bracelet +1",
        -- legs = "Carmine Cuisses +1",
        -- ear1 = "Odr Earring",
        -- ear2 = "Mache Earring +1",
        -- waist = "Olseni Belt"
    })

    sets.engaged.STP = set_combine(sets.engaged, {
        sub = "Utu Grip",
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
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Anu Torque",
        waist = "Ioskeha Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Sherida Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    })

    sets.engaged.Aftermath = {
        -- head = "Aya. Zucchetto +2",
        -- body = "Ashera Harness",
        -- neck = "Anu Torque",
        -- ear1 = "Sherida Earring",
        -- ear2 = "Dedition Earring",
        -- ring1 = {
        --     name = "Chirich Ring +1",
        --     bag = "wardrobe3"
        -- },
        -- ring2 = {
        --     name = "Chirich Ring +1",
        --     bag = "wardrobe4"
        -- },
        -- waist = "Kentarch Belt +1"
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Hybrid Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.Hybrid = {
        sub = "Utu Grip",
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Ayanmo Corazza +2",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Nyame Flanchard",
        feet = "Erilaz Greaves +3",
        neck = {
            name = "Futhark Torque +2",
            augments = {'Path: A'}
        },
        waist = "Ioskeha Belt +1",
        left_ear = "Sherida Earring",
        right_ear = {
            name = "Odnowa Earring +1",
            augments = {'Path: A'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Moonlight Ring",
        back = {
            name = "Ogma's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.engaged.DT = set_combine(sets.engaged, sets.Hybrid)
    sets.engaged.LowAcc.DT = set_combine(sets.engaged.LowAcc, sets.Hybrid)
    sets.engaged.MidAcc.DT = set_combine(sets.engaged.MidAcc, sets.Hybrid)
    sets.engaged.HighAcc.DT = set_combine(sets.engaged.HighAcc, sets.Hybrid)
    sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.Hybrid)

    sets.engaged.Aftermath.DT = {
        head = "Aya. Zucchetto +2",
        body = "Ashera Harness",
        hands = gear.Adhemar_A_hands,
        legs = "Meg. Chausses +2",
        neck = "Futhark Torque +2",
        ear1 = "Sherida Earring",
        ear2 = "Dedition Earring",
        ring1 = "Moonlight Ring",
        ring2 = "Defending Ring",
        back = gear.RUN_TP_Cape,
        waist = "Sailfi Belt +1"
    }

    ------------------------------------------------------------------------------------------------
    ---------------------------------------- Special Sets ------------------------------------------
    ------------------------------------------------------------------------------------------------

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

    sets.Embolden = set_combine(sets.midcast.EnhancingDuration, {
        back = {
            name = "Evasionist's Cape",
            augments = {'Enmity+3', '"Embolden"+15'}
        }
    })
    sets.Obi = {
        waist = "Hachirin-no-Obi"
    }
    -- sets.CP = {back="Mecisto. Mantle"}
    -- sets.Reive = {neck="Ygnas's Resolve +1"}

    sets.Epeolatry = {
        main = "Epeolatry",
        sub = {
            name = "Refined Grip +1",
            augments = {'Path: A'}
        }
    }
    sets.Lionheart = {
        main = "Lionheart",
        sub = "Utu Grip"
    }
    sets.Lycurgos = {
        main = "Lycurgos"
    }

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
    equip(sets[state.WeaponSet.current])

    if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
        add_to_chat(167, 'Action stopped due to status.')
        eventArgs.cancel = true
        return
    end
    if rune_enchantments:contains(spell.english) then
        eventArgs.handled = true
    end
    if state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.current == 'HP' then
        currentSpell = spell.english
        eventArgs.handled = true
        if spell.action_type == 'Magic' then
            equip(sets.precast.FC.HP)
        end
    end
    if spell.english == 'Lunge' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            send_command('input /jobability "Swipe" <t>')
            --            add_to_chat(122, '***Lunge Aborted: Timer on Cooldown -- Downgrading to Swipe.***')
            eventArgs.cancel = true
            return
        end
    end
    if spell.english == 'Valiance' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if abil_recasts[spell.recast_id] > 0 then
            send_command('input /jobability "Vallation" <me>')
            eventArgs.cancel = true
            return
        elseif spell.english == 'Valiance' and buffactive['vallation'] then
            cast_delay(0.2)
            send_command('cancel Vallation') -- command requires 'cancel' add-on to work
        end
    end
    if spellMap == 'Utsusemi' then
        if buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)'] then
            cancel_spell()
            add_to_chat(123, '**!! ' .. spell.english .. ' Canceled: [3+ IMAGES] !!**')
            eventArgs.handled = true
            return
        elseif buffactive['Copy Image'] or buffactive['Copy Image (2)'] then
            send_command('cancel 66; cancel 444; cancel Copy Image; cancel Copy Image (2)')
        end
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Vivacious Pulse' then
        if buffactive['poison'] or buffactive['paralysis'] or buffactive['blindness'] or buffactive['silence'] or
            buffactive['curse'] or buffactive['bane'] or buffactive['doom'] or buffactive['disease'] or
            buffactive['plague'] then
            equip(sets.precast.JA['Vivacious Pulse'].Status)
        end
    end
end

--[[function job_midcast(spell, action, spellMap, eventArgs)
    if state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.current == 'HP' and spell.english ~= "Phalanx" then
        eventArgs.handled = true
        if spell.action_type == 'Magic' then
            if spell.english == 'Flash' or spell.english == 'Foil' or spell.english == 'Stun'
                or blue_magic_maps.Enmity:contains(spell.english) then
                equip(sets.Enmity)
            elseif spell.skill == 'Enhancing Magic' then
                equip(sets.midcast.EnhancingDuration)
            end
        end
    end
end--]]

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.english == 'Lunge' or spell.english == 'Swipe' then
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end
    --[[if spell.skill == 'Enhancing Magic' and classes.NoSkillSpells:contains(spell.english) then
        equip(sets.midcast.EnhancingDuration)
        if spellMap == 'Refresh' then
            equip(sets.midcast.Refresh)
        end
    end--]]
    if spell.english == 'Phalanx' and buffactive['Embolden'] then
        equip(sets.midcast.PhalanxDuration)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    equip(sets[state.WeaponSet.current])

    if spell.name == 'Rayke' and not spell.interrupted then
        send_command('@timers c "Rayke [' .. spell.target.name .. ']" ' .. rayke_duration .. ' down spells/00136.png')
        send_command('wait ' .. rayke_duration .. ';input /echo [Rayke just wore off!];')
    elseif spell.name == 'Gambit' and not spell.interrupted then
        send_command('@timers c "Gambit [' .. spell.target.name .. ']" ' .. gambit_duration .. ' down spells/00136.png')
        send_command('wait ' .. gambit_duration .. ';input /echo [Gambit just wore off!];')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.Charm.current)
    classes.CustomDefenseGroups:append(state.Knockback.current)
    classes.CustomDefenseGroups:append(state.Death.current)

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.Charm.current)
    classes.CustomMeleeGroups:append(state.Knockback.current)
    classes.CustomMeleeGroups:append(state.Death.current)
end

function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    --    if buffactive['Reive Mark'] then
    --        if gain then
    --            equip(sets.Reive)
    --            disable('neck')
    --        else
    --            enable('neck')
    --        end
    --    end

    if buff == "terror" then
        if gain then
            equip(sets.defense.PDT)
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

    if buff == 'Embolden' then
        if gain then
            equip(sets.Embolden)
            disable('head', 'legs', 'back')
        else
            enable('head', 'legs', 'back')
            status_change(player.status)
        end
    end

    if buff:startswith('Aftermath') then
        state.Buff.Aftermath = gain
        customize_melee_set()
        handle_equipping_gear(player.status)
    end

    if buff == 'Battuta' and not gain then
        status_change(player.status)
    end

end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main', 'sub')
    else
        enable('main', 'sub')
    end

    equip(sets[state.WeaponSet.current])

end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    check_moving()
end

function job_update(cmdParams, eventArgs)
    equip(sets[state.WeaponSet.current])
    handle_equipping_gear(player.status)
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Knockback.value == true then
        idleSet = set_combine(idleSet, sets.defense.Knockback)
    end
    -- if state.CP.current == 'on' then
    --    equip(sets.CP)
    --    disable('back')
    -- else
    --    enable('back')
    -- end
    if state.Auto_Kite.value == true then
        idleSet = set_combine(idleSet, sets.Kiting)
    end

    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if buffactive['Aftermath: Lv.3'] and player.equipment.main == "Epeolatry" and state.DefenseMode.value == 'None' then
        if state.HybridMode.value == "DT" then
            meleeSet = set_combine(meleeSet, sets.engaged.Aftermath.DT)
        else
            meleeSet = set_combine(meleeSet, sets.engaged.Aftermath)
        end
    end
    if state.Knockback.value == true then
        meleeSet = set_combine(meleeSet, sets.defense.Knockback)
    end

    return meleeSet
end

function customize_defense_set(defenseSet)
    if buffactive['Battuta'] then
        defenseSet = set_combine(defenseSet, sets.defense.Parry)
    end
    if state.Knockback.value == true then
        defenseSet = set_combine(defenseSet, sets.defense.Knockback)
    end

    return defenseSet
end

-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local r_msg = state.Runes.current
    local r_color = ''
    if state.Runes.current == 'Ignis' then
        r_color = 167
    elseif state.Runes.current == 'Gelus' then
        r_color = 210
    elseif state.Runes.current == 'Flabra' then
        r_color = 204
    elseif state.Runes.current == 'Tellus' then
        r_color = 050
    elseif state.Runes.current == 'Sulpor' then
        r_color = 215
    elseif state.Runes.current == 'Unda' then
        r_color = 207
    elseif state.Runes.current == 'Lux' then
        r_color = 001
    elseif state.Runes.current == 'Tenebrae' then
        r_color = 160
    end

    local cf_msg = ''
    if state.CombatForm.has_value then
        cf_msg = ' (' .. state.CombatForm.value .. ')'
    end

    local m_msg = state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        m_msg = m_msg .. '/' .. state.HybridMode.value
    end

    local am_msg = '(' .. string.sub(state.AttackMode.value, 1, 1) .. ')'

    local ws_msg = state.WeaponskillMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.Knockback.value == true then
        msg = msg .. ' Knockback Resist |'
    end
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(r_color,
        string.char(129, 121) .. '  ' .. string.upper(r_msg) .. '  ' .. string.char(129, 122) .. string.char(31, 210) ..
            ' Melee' .. cf_msg .. ': ' .. string.char(31, 001) .. m_msg .. string.char(31, 002) .. ' |' ..
            string.char(31, 207) .. ' WS' .. am_msg .. ': ' .. string.char(31, 001) .. ws_msg .. string.char(31, 002) ..
            ' |' .. string.char(31, 060) .. string.char(31, 004) .. ' Defense: ' .. string.char(31, 001) .. d_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 008) .. ' Idle: ' .. string.char(31, 001) .. i_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 002) .. msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category, spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, action, spellMap)
    if spell.type == 'WeaponSkill' then
        if state.AttackMode.value == 'Uncapped' and state.DefenseMode.value == 'None' and state.HybridMode.value ==
            'Normal' then
            return "Uncapped"
        elseif state.DefenseMode.value ~= 'None' or state.HybridMode.value == 'DT' then
            return "Safe"
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'rune' then
        send_command('@input /ja ' .. state.Runes.value .. ' <me>')
    end
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

-- Function added to automatically equip ParryDT set once Battuta is used
function job_buff_change(buff, gain)
    if buff == 'Battuta' then
        if gain then
            equip(sets.defense.ParryDT)
        else
            handle_equipping_gear(player.status)
        end
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book: (set, book)
    if player.sub_job == 'BLU' then
        set_macro_page(1, 22)
    elseif player.sub_job == 'DRK' then
        set_macro_page(1, 22)
    elseif player.sub_job == 'WHM' then
        set_macro_page(1, 22)
    else
        set_macro_page(1, 22)
    end
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
