-- Original: Motenten / Modified: Arislan
-- Haste/DW Detection Requires Gearinfo Addon
-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------
--  Modes:      [ F9 ]              Cycle Offense Modes
--              [ CTRL+F9 ]         Cycle Hybrid Modes
--              [ WIN+F9 ]          Cycle Weapon Skill Modes
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ CTRL+F11 ]        Cycle Casting Modes
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ CTRL+` ]          Toggle Treasure Hunter Mode
--              [ ALT+` ]           Toggle Magic Burst Mode
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+- ]          Yonin
--              [ CTRL+= ]          Innin
--              [ CTRL+Numpad/ ]    Berserk
--              [ CTRL+Numpad* ]    Warcry
--              [ CTRL+Numpad- ]    Aggressor
--
--  Spells:     [ WIN+, ]           Utsusemi: Ichi
--              [ WIN+. ]           Utsusemi: Ni
--              [ WIN+/ ]           Utsusemi: San
--              [ ALT+, ]           Monomi: Ichi
--              [ ALT+. ]           Tonko: Ni
--
--  WS:         [ CTRL+Numpad7 ]    Blade: Kamu
--              [ CTRL+Numpad8 ]    Blade: Shun
--              [ CTRL+Numpad4 ]    Blade: Ten
--              [ CTRL+Numpad6 ]    Blade: Hi
--              [ CTRL+Numpad1 ]    Blade: Yu
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
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false
    state.Buff.Sange = buffactive.Sange or false

    no_swap_gear = S {"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)", "Trizek Ring",
                      "Echad Ring", "Facility Ring", "Capacity Ring"}

    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S {35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S {201, 202, 203, 205, 207}

    lugra_ws = S {'Blade: Kamu', 'Blade: Shun', 'Blade: Ten'}

    lockstyleset = 140
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'LowAcc', 'MidAcc', 'HighAcc', 'STP', "Crit", "DW30MidHaste")
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    state.WeaponSet = M {
        ['description'] = 'Weapon Set',
        'Heishi',
        'Naegling',
        'AeolianEdge',
        'Tanking',
        'Nuking',
        'GreatKatana'
    }
    state.WeaponLock = M(false, 'Weapon Lock')
    state.MagicBurst = M(false, 'Magic Burst')
    -- state.CP = M(false, "Capacity Points Mode")

    options.ninja_tool_warning_limit = 10

    -- Additional local binds
    -- include('Global-Binds.lua') -- OK to remove this line
    -- include('Global-GEO-Binds.lua') -- OK to remove this line

    send_command('bind @t gs c cycle treasuremode')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind ^- input /ja "Yonin" <me>')
    send_command('bind ^= input /ja "Innin" <me>')
    send_command('bind ^, input /nin "Monomi: Ichi" <me>')
    send_command('bind ^. input /ma "Tonko: Ni" <me>')
    send_command('bind @, input /ma "Utsusemi: Ichi" <me>')
    send_command('bind @. input /ma "Utsusemi: Ni" <me>')
    send_command('bind @/ input /ma "Utsusemi: San" <me>')

    send_command('bind @w gs c toggle WeaponLock')
    -- send_command('bind @c gs c toggle CP')
    send_command('bind @e gs c cycleback WeaponSet')
    send_command('bind @r gs c cycle WeaponSet')

    send_command('bind ^numlock input /ja "Innin" <me>')
    send_command('bind !numlock input /ja "Yonin" <me>')

    if player.sub_job == 'WAR' then
        send_command('bind ^numpad/ input /ja "Berserk" <me>')
        send_command('bind !numpad/ input /ja "Defender" <me>')
        send_command('bind ^numpad* input /ja "Warcry" <me>')
        send_command('bind ^numpad- input /ja "Aggressor" <me>')
    end

    send_command('bind ^numpad7 input /ws "Blade: Metsu" <t>')
    send_command('bind ^numpad8 input /ws "Blade: Shun" <t>')
    send_command('bind ^numpad4 input /ws "Blade: Ten" <t>')
    send_command('bind ^numpad6 input /ws "Blade: Hi" <t>')
    send_command('bind ^numpad1 input /ws "Blade: Yu" <t>')
    send_command('bind ^numpad2 input /ws "Blade: Chi" <t>')

    -- Whether a warning has been given for low ninja tools
    state.warned = M(false)

    select_default_macro_book()
    set_lockstyle()

    state.Auto_Kite = M(false, 'Auto_Kite')
    Haste = 0
    DW_needed = 0
    DW = false
    moving = false
    update_combat_form()
    determine_haste_group()
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^-')
    send_command('unbind ^=')
    send_command('unbind @/')
    send_command('unbind @w')
    -- send_command('unbind @c')
    send_command('unbind @e')
    send_command('unbind @r')
    send_command('unbind @t')
    send_command('unbind ^numlock')
    send_command('unbind !numlock')
    send_command('unbind ^numpad/')
    send_command('unbind !numpad/')
    send_command('unbind ^numpad*')
    send_command('unbind ^numpad-')
    send_command('unbind ^numpad+')
    send_command('unbind !numpad+')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad4')
    send_command('unbind ^numpad6')
    send_command('unbind ^numpad1')
    send_command('unbind ^numpad2')

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
    -- Precast sets
    --------------------------------------

    -- Enmity set
    sets.Enmity = {
        ammo = "Date Shuriken",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = "Emet Harness +1",
        hands = "Kurys Gloves",
        legs = "Zoar Subligar +1",
        feet = {
            name = "Mochi. Kyahan +3",
            augments = {'Enh. Ninj. Mag. Acc/Cast Time Red.'}
        },
        neck = "Moonbeam Necklace",
        waist = "Trance Belt",
        left_ear = "Trux Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Pernicious Ring",
        right_ring = "Supershear Ring",
        back = "Reiki Cloak"
    }

    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['Warcry'] = sets.Enmity
    sets.precast.JA['Aggressor'] = sets.Enmity

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {
        legs = "Mochi. Hakama +3"
    }
    sets.precast.JA['Futae'] = {
        hands = "Hattori Tekko +1"
    }
    sets.precast.JA['Sange'] = {
        body = {
            name = "Mochi. Chainmail +3",
            augments = {'Enhances "Sange" effect'}
        }
    }
    sets.precast.JA['Innin'] = {
        head = "Mochi. Hatsuburi +3"
    }
    sets.precast.JA['Yonin'] = {
        head = "Mochi. Hatsuburi +3"
    }

    sets.precast.Waltz = {
        ammo = "Yamarang",
        body = "Passion Jacket",
        legs = "Dashing Subligar",
        ring1 = "Asklepian Ring",
        waist = "Gishdubar Sash"
    }

    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells

    sets.precast.FC = {
        head = {
            name = "Herculean Helm",
            augments = {'"Fast Cast"+5', 'Mag. Acc.+12', '"Mag.Atk.Bns."+11'}
        },
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        -- legs = "Mpaca's Hose",
        -- feet = "Danzo Sune-Ate",
        -- neck = {
        --     name = "Loricate Torque +1",
        --     augments = {'Path: A'}
        -- },
        -- waist = "Engraved Belt",
        -- left_ear = "Telos Earring",
        -- right_ear = "Cessance Earring",
        left_ring = "Kishar Ring",
        right_ring = "Prolix Ring"
        -- back = {
        --     name = "Andartia's Mantle",
        --     augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        -- }
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
        body = {
            name = "Mochi. Chainmail +3",
            augments = {'Enhances "Sange" effect'}
        },
        neck = "Magoraga Beads"
    })

    sets.precast.RA = {}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        -- ammo = "Seeth. Bomblet +1",
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
        ear1 = "Moonshade Earring",
        ear2 = "Ishvara Earring",
        ring1 = "Regal Ring",
        ring2 = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        },
        waist = "Fotia Belt"
    } -- default set

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
        ammo = "Voluspa Tathlum",
        hands = gear.Adhemar_A_hands,
        legs = gear.Herc_WS_legs,
        ear2 = "Telos Earring"
    })

    sets.precast.WS['Blade: Hi'] = {
        ammo = "Date Shuriken",
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
        neck = {
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Mache Earring +1",
        right_ear = "Lugra Earring +1",
        -- left_ring = "Gere Ring",
        left_ring = "Cornelia's Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS, {
        ammo = "Aurgelmir Orb +1",
        neck = "Ninja Nodowa +2",
        ear1 = "Odr Earring",
        ear2 = "Lugra Earring +1",
        waist = "Sailfi Belt +1",
        back = gear.NIN_WS3_Cape
    })

    sets.precast.WS['Blade: Metsu'].Acc = set_combine(sets.precast.WS['Blade: Metsu'], {})

    sets.precast.WS['Blade: Ten'] = {
        -- ammo = "Date Shuriken",
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        body = "Ken. Samue +1",
        hands = "Mummu Wrists +2",
        legs = {
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
        },
        feet = "Ken. Sune-Ate +1",
        neck = {
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Lugra Earring +1",
        left_ring = "Ilabrat Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS['Blade: Ten'], {
        ammo = "Voluspa Tathlum",
        ear2 = "Telos Earring"
    })

    sets.precast.WS['Blade: Shun'] = {
        -- ammo = {
        --     name = "Coiste Bodhar",
        --     augments = {'Path: A'}
        -- },
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        body = "Mpaca's Doublet",
        hands = {
            name = "Adhemar Wristbands",
            augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}
        },
        legs = "Mpaca's Hose",
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
        right_ear = "Lugra Earring +1",
        left_ring = "Ilabrat Ring",
        right_ring = "Regal Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    -- sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS['Blade: Shun'], {
    --     ammo="Voluspa Tathlum",
    --     legs="Ken. Hakama +1",
    --     })

    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ku'].Acc = set_combine(sets.precast.WS['Blade: Ku'], {})

    sets.precast.WS['Blade: Kamu'] = {
        -- ammo = "Crepuscular Pebble",
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        legs = "Mpaca's Hose"
    }

    sets.precast.WS['Blade: Yu'] = {
        ammo = "Seeth. Bomblet +1",
        head = "Hachiya Hatsu. +3",
        body = "Samnuha Coat",
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+14', 'Mag. Acc.+13', '"Mag.Atk.Bns."+13', '"Fast Cast"+2'}
        },
        legs = gear.Herc_WSD_legs,
        feet = gear.Herc_MAB_feet,
        neck = "Baetyl Pendant",
        ear1 = "Crematio Earring",
        ear2 = "Friomisi Earring",
        ring1 = "Dingir Ring",
        back = gear.NIN_MAB_Cape,
        waist = "Eschan Stone"
    }

    sets.precast.WS['Blade: Chi'] = {
        -- ammo = "Seething Bomblet +1",
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Fotia Gorget",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Blade: Teki'] = {
        -- ammo = "Seething Bomblet +1",
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Fotia Gorget",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Blade: To'] = {
        -- ammo = "Seething Bomblet +1",
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
            name = "Mochi. Hakama +3",
            augments = {'Enhances "Mijin Gakure" effect'}
        },
        feet = {
            name = "Nyame Sollerets",
            augments = {'Path: B'}
        },
        neck = "Fotia Gorget",
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Tachi: Jinpu'] = {
        -- ammo = "Seething Bomblet +1",
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
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Gere Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Aeolian Edge'] = {
        -- ammo = "Ghastly Tathlum +1",
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
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
        waist = "Orpheus's Sash",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Friomisi Earring",
        left_ring = "Dingir Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.precast.WS['Savage Blade'] = {
        -- ammo = "Seething Bomblet +1",
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
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
        feet = "Hattori Kyahan +3",
        -- neck = "Rep. Plat. Medal",
        neck = "Fotia Gorget",
        waist = "Sailfi Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Accuracy+4', 'TP Bonus +250'}
        },
        right_ear = "Lugra Earring +1",
        left_ring = "Regal Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.SpellInterrupt = {
        -- ammo="Staunch Tathlum +1", --11
        body = gear.Taeon_Phalanx_body, -- 10
        hands = "Rawhide Gloves", -- 15
        legs = gear.Taeon_Phalanx_legs, -- 10
        feet = gear.Taeon_Phalanx_feet, -- 10
        neck = "Moonbeam Necklace", -- 15
        ear1 = "Halasz Earring", -- 5
        ear2 = "Magnetic Earring", -- 8
        ring1 = "Evanescence Ring", -- 5
        back = gear.NIN_FC_Cape, -- 10
        waist = "Audumbla Sash" -- 10
    }

    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.SpellInterrupt, {
        body = {
            name = "Mochi. Chainmail +3",
            augments = {'Enhances "Sange" effect'}
        },
        feet = "Hattori Kyahan +3",
        neck = "Magoraga Beads"
        -- back = gear.NIN_FC_Cape
    })
    sets.midcast.Utsusemi = {
        -- ammo = "Date Shuriken",
        head = {
            name = "Nyame Helm",
            augments = {'Path: B'}
        },
        body = {
            name = "Mochi. Chainmail +3",
            augments = {'Enhances "Sange" effect'}
        },
        hands = {
            name = "Rawhide Gloves",
            augments = {'HP+50', 'Accuracy+15', 'Evasion+20'}
        },
        legs = {
            name = "Rawhide Trousers",
            augments = {'MP+50', '"Fast Cast"+5', '"Refresh"+1'}
        },
        feet = "Hattori Kyahan +3",
        neck = "Magoraga Beads",
        waist = "Flume Belt +1",
        left_ear = "Trux Earring",
        right_ear = "Cryptic Earring",
        left_ring = "Defending Ring",
        right_ring = "Pernicious Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    sets.midcast.ElementalNinjutsu = {
        -- ammo = {
        --     name = "Ghastly Tathlum +1",
        --     augments = {'Path: A'}
        -- },
        head = {
            name = "Mochi. Hatsuburi +3",
            augments = {'Enhances "Yonin" and "Innin" effect'}
        },
        body = "Gyve Doublet",
        hands = {
            name = "Nyame Gauntlets",
            augments = {'Path: B'}
        },
        legs = "Gyve Trousers",
        feet = {
            name = "Mochi. Kyahan +3",
            augments = {'Enh. Ninj. Mag. Acc/Cast Time Red.'}
        },
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Hermetic Earring",
        right_ear = "Friomisi Earring",
        left_ring = {
            name = "Metamor. Ring +1",
            augments = {'Path: A'}
        },
        right_ring = "Shiva Ring +1",
        back = {
            name = "Andartia's Mantle",
            augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', '"Mag.Atk.Bns."+10'}
        }
    }

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {
        ammo = "Pemphredo Tathlum",
        neck = "Sanctity Necklace",
        ring1 = {
            name = "Stikini Ring +1",
            bag = "wardrobe3"
        },
        ring2 = {
            name = "Stikini Ring +1",
            bag = "wardrobe4"
        },
        ear1 = "Enchntr. Earring +1"
    })

    sets.midcast.EnfeeblingNinjutsu = {
        ammo = "Yamarang",
        head = "Hachiya Hatsu. +3",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Null Belt",
        left_ear = "Crep. Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Null Shawl"
    }

    sets.midcast.EnhancingNinjutsu = {
        ammo = "Yamarang",
        head = "Hachiya Hatsu. +3",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Null Belt",
        left_ear = "Crep. Earring",
        right_ear = "Digni. Earring",
        left_ring = "Stikini Ring +1",
        right_ring = "Stikini Ring +1",
        back = "Null Shawl"
    }

    sets.midcast.Stun = sets.midcast.EnfeeblingNinjutsu

    sets.midcast.RA = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Iskur Gorget",
        ear1 = "Enervating Earring",
        ear2 = "Telos Earring",
        ring1 = "Dingir Ring",
        ring2 = "Hajduk Ring +1",
        back = gear.NIN_TP_Cape,
        waist = "Yemaya Belt"
    }

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    --    sets.resting = {}

    -- Idle sets
    sets.idle = {
        ammo = "Seki Shuriken",
        -- head = {
        --     name = "Nyame Helm",
        --     augments = {'Path: B'}
        -- },
        head = "Null Masque",
        body = {
            name = "Nyame Mail",
            augments = {'Path: B'}
        },
        -- body = "Hiza. Haramaki +2",
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
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Shneddick Ring",
        right_ring = "Defending Ring",
        -- back = {
        --     name = "Andartia's Mantle",
        --     augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        -- }
        back = "Moonbeam Cape"
    }

    sets.idle.DT = set_combine(sets.idle, {
        ammo = "Staunch Tathlum +1",
        -- head = {
        --     name = "Nyame Helm",
        --     augments = {'Path: B'}
        -- },
        head = "Null Masque",
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
        neck = "Warder's Charm +1",
        waist = "Plat. Mog. Belt",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Shneddick Ring",
        right_ring = "Regal Ring",
        back = "Moonbeam Cape"
    })

    sets.idle.Town = set_combine(sets.idle, {
        -- ammo = "Staunch Tathlum +1",
        -- head = {
        --     name = "Nyame Helm",
        --     augments = {'Path: B'}
        -- },
        head = "Null Masque",
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
        neck = "Null Loop",
        waist = "Null Belt",
        left_ear = "Eabani Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Shneddick Ring",
        right_ring = "Regal Ring",
        back = "Moonbeam Cape"
    })

    -- Defense sets
    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.defense.Evasion = {
        -- ammo = "Yamarang",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Bathy Choker +1",
        waist = "Trance Belt",
        left_ear = "Eabani Earring",
        right_ear = "Infused Earring",
        left_ring = "Defending Ring",
        right_ring = "Vengeful Ring",
        back = "Agema Cape"
    }

    sets.Kiting = {
        feet = "Danzo sune-ate"
    }

    sets.DayMovement = {
        feet = "Danzo sune-ate"
    }
    sets.NightMovement = {
        feet = "Hachi. Kyahan +1"
    }

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- * NIN Native DW Trait: 35% DW

    -- No Magic Haste (74% DW to cap)
    sets.engaged = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        -- legs = {
        --     name = "Samnuha Tights",
        --     augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        -- },
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = {
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        -- neck = "Null Loop",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Telos Earring",
        right_ear = "Dedition Earring",
        left_ring = "Epona's Ring",
        right_ring = "Gere Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
        -- back = "Null Shawl"
    }

    sets.engaged.LowAcc = set_combine(sets.engaged, {
        hands = gear.Adhemar_A_hands
    })

    sets.engaged.MidAcc = set_combine(sets.engaged.LowAcc, {
        ring2 = "Ilabrat Ring",
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        }
    })

    sets.engaged.HighAcc = set_combine(sets.engaged.MidAcc, {
        ring1 = "Regal Ring",
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        }
    })

    sets.engaged.STP = set_combine(sets.engaged, {
        ammo = "Seki Shuriken",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        -- hands = {
        --     name = "Adhemar Wristbands",
        --     augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}
        -- },
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = {
            name = "Ninja Nodowa +1",
            augments = {'Path: A'}
        },
        -- waist = "Windbuffet Belt +1",
        waist = {
            name = "Sailfi Belt +1",
            augments = {'Path: A'}
        },
        left_ear = "Telos Earring",
        right_ear = "Dedition Earring",
        left_ring = "Epona's Ring",
        right_ring = "Gere Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    })

    sets.engaged.Crit = set_combine(sets.engaged, {
        head = {
            name = "Blistering Sallet +1",
            augments = {'Path: A'}
        },
        -- head = {
        --     name = "Mpaca's Cap",
        --     augments = {'Path: A'}
        -- },
        -- body = "Mpaca's Doublet",
        body = "Ken. Samue +1",
        hands = "Mpaca's Gloves",
        legs = "Mpaca's Hose",
        feet = "Mpaca's Boots"
    })

    sets.engaged.DW30MidHaste = set_combine(sets.engaged, {
        ammo = "Seki Shuriken",
        head = "Malignance Chapeau",
        body = "Adhemar Jacket +1", -- 9
        hands = "Adhemar Wristbands +1", -- 6
        legs = "Samnuha Tights",
        feet = "Ken. Sune-Ate +1",
        neck = "Ninja Nodowa +1",
        ear1 = "Eabani Earring",
        ear2 = "Suppanomimi", -- 5
        ring1 = "Gere Ring",
        ring2 = "Epona's Ring",
        waist = "Reiki Yotai", -- 7
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    })

    -- 15% Magic Haste (67% DW to cap)
    sets.engaged.LowHaste = {
        ammo = "Seki Shuriken",
        head = "Ryuo Somen +1", -- 9
        body = {
            name = "Mochi. Chainmail +3",
            augments = {'Enhances "Sange" effect'}
        }, -- 9
        hands = gear.Adhemar_B_hands,
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1",
        neck = "Ninja Nodowa +2",
        ear1 = "Cessance Earring",
        ear2 = "Suppanomimi", -- 5
        ring1 = "Gere Ring",
        ring2 = "Epona's Ring",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        },
        waist = "Reiki Yotai" -- 7
    } -- 30%

    sets.engaged.LowAcc.LowHaste = set_combine(sets.engaged.LowHaste, {
        hands = gear.Adhemar_A_hands
    })

    sets.engaged.MidAcc.LowHaste = set_combine(sets.engaged.LowAcc.LowHaste, {
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = "Ilabrat Ring"
    })

    sets.engaged.HighAcc.LowHaste = set_combine(sets.engaged.LowAcc.LowHaste, {
        ring1 = "Regal Ring",
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        }
    })

    sets.engaged.STP.LowHaste = set_combine(sets.engaged.LowHaste, {
        legs = "Samnuha Tights",
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        }
    })

    -- 30% Magic Haste (56% DW to cap)
    sets.engaged.MidHaste = {
        ammo = "Seki Shuriken",
        head = "Malignance Chapeau",
        body = "Adhemar Jacket +1", -- 9
        hands = "Adhemar Wristbands +1", -- 6
        legs = "Samnuha Tights",
        feet = "Ken. Sune-Ate +1",
        neck = "Ninja Nodowa +1",
        ear1 = "Eabani Earring",
        ear2 = "Suppanomimi", -- 5
        ring1 = "Gere Ring",
        ring2 = "Epona's Ring",
        waist = "Reiki Yotai", -- 7
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    } -- 21%

    sets.engaged.LowAcc.MidHaste = set_combine(sets.engaged.MidHaste, {
        hands = gear.Adhemar_A_hands
    })

    sets.engaged.MidAcc.MidHaste = set_combine(sets.engaged.LowAcc.MidHaste, {
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = "Ilabrat Ring"
    })

    sets.engaged.HighAcc.MidHaste = set_combine(sets.engaged.MidHaste.MidAcc, {
        ring1 = "Regal Ring",
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        }
    })

    sets.engaged.STP.MidHaste = set_combine(sets.engaged.MidHaste, {
        legs = "Samnuha Tights",
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        }
    })

    -- 35% Magic Haste (51% DW to cap)
    sets.engaged.HighHaste = {
        ammo = "Seki Shuriken",
        head = "Ken. Jinpachi +1",
        body = "Ken. Samue +1",
        hands = gear.Adhemar_B_hands,
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1",
        neck = "Ninja Nodowa +2",
        ear1 = "Telos Earring", -- 4
        ear2 = "Suppanomimi", -- 5
        ring1 = "Defending Ring",
        ring2 = "Epona's Ring",
        back = gear.NIN_TP_Cape,
        waist = "Reiki Yotai" -- 7
    } -- 16%

    sets.engaged.LowAcc.HighHaste = set_combine(sets.engaged.HighHaste, {
        hands = gear.Adhemar_A_hands
    })

    sets.engaged.MidAcc.HighHaste = set_combine(sets.engaged.LowAcc.HighHaste, {
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = "Ilabrat Ring"
    })

    sets.engaged.HighAcc.HighHaste = set_combine(sets.engaged.MidAcc.HighHaste, {
        ring1 = "Regal Ring",
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        }
    })

    sets.engaged.STP.HighHaste = set_combine(sets.engaged.HighHaste, {
        legs = "Samnuha Tights",
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        },
        waist = "Kentarch Belt +1"
    })

    -- 45% Magic Haste (36% DW to cap)
    sets.engaged.MaxHaste = {
        ammo = "Seki Shuriken",
        head = "Malignance Chapeau",
        body = "Ken. Samue +1",
        hands = gear.Adhemar_B_hands,
        legs = "Ken. Hakama +1",
        feet = "Ken. Sune-Ate +1",
        neck = "Ninja Nodowa +2",
        ear1 = "Cessance Earring",
        ear2 = "Telos Earring",
        ring1 = "Defending Ring",
        ring2 = "Epona's Ring",
        back = gear.NIN_TP_Cape,
        waist = "Windbuffet Belt +1"
    } -- 0%

    sets.engaged.LowAcc.MaxHaste = set_combine(sets.engaged.MaxHaste, {
        hands = gear.Adhemar_A_hands,
        waist = "Kentarch Belt +1"
    })

    sets.engaged.MidAcc.MaxHaste = set_combine(sets.engaged.LowAcc.MaxHaste, {
        ear1 = "Cessance Earring",
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = "Ilabrat Ring"
    })

    sets.engaged.HighAcc.MaxHaste = set_combine(sets.engaged.MidAcc.MaxHaste, {
        ring1 = "Regal Ring",
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        },
        waist = "Olseni Belt"
    })

    sets.engaged.STP.MaxHaste = set_combine(sets.engaged.MaxHaste, {
        legs = "Samnuha Tights",
        ear1 = "Dedition Earring",
        ear2 = "Telos Earring",
        ring1 = {
            name = "Chirich Ring +1",
            bag = "wardrobe3"
        },
        ring2 = {
            name = "Chirich Ring +1",
            bag = "wardrobe4"
        },
        waist = "Kentarch Belt +1"
    })

    sets.engaged.Hybrid = {
        head = "Malignance Chapeau", -- 6/6
        legs = "Malignance Tights", -- 7/7
        feet = "Malignance Boots", -- 4/4
        ring2 = "Defending Ring", -- 10/10
        back = gear.NIN_WS1_Cape -- 10/0
    }

    sets.engaged.DT = set_combine(sets.engaged, {
        -- ammo = "Date Shuriken",
        head = {
            name = "Mpaca's Cap",
            augments = {'Path: A'}
        },
        -- body = "Mpaca's Doublet",
        -- hands = "Mpaca's Gloves",
        -- legs = "Mpaca's Hose",
        legs = "Malignance Tights",
        -- feet = "Mpaca's Boots",
        back = {
            name = "Andartia's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Store TP"+10', 'Damage taken-5%'}
        }
    })

    sets.engaged.LowAcc.DT = set_combine(sets.engaged.LowAcc, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT = set_combine(sets.engaged.MidAcc, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT = set_combine(sets.engaged.HighAcc, sets.engaged.Hybrid)
    sets.engaged.STP.DT = set_combine(sets.engaged.STP, sets.engaged.Hybrid)

    sets.engaged.DT.LowHaste = set_combine(sets.engaged.LowHaste, sets.engaged.Hybrid)
    sets.engaged.LowAcc.DT.LowHaste = set_combine(sets.engaged.LowAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT.LowHaste = set_combine(sets.engaged.MidAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT.LowHaste = set_combine(sets.engaged.HighAcc.LowHaste, sets.engaged.Hybrid)
    sets.engaged.STP.DT.LowHaste = set_combine(sets.engaged.STP.LowHaste, sets.engaged.Hybrid)

    sets.engaged.DT.MidHaste = set_combine(sets.engaged.MidHaste, sets.engaged.Hybrid)
    sets.engaged.LowAcc.DT.MidHaste = set_combine(sets.engaged.LowAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT.MidHaste = set_combine(sets.engaged.MidAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT.MidHaste = set_combine(sets.engaged.HighAcc.MidHaste, sets.engaged.Hybrid)
    sets.engaged.STP.DT.MidHaste = set_combine(sets.engaged.STP.MidHaste, sets.engaged.Hybrid)

    sets.engaged.DT.HighHaste = set_combine(sets.engaged.HighHaste, sets.engaged.Hybrid)
    sets.engaged.LowAcc.DT.HighHaste = set_combine(sets.engaged.LowAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT.HighHaste = set_combine(sets.engaged.MidAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT.HighHaste = set_combine(sets.engaged.HighAcc.HighHaste, sets.engaged.Hybrid)
    sets.engaged.STP.DT.HighHaste = set_combine(sets.engaged.HighHaste.STP, sets.engaged.Hybrid)

    sets.engaged.DT.MaxHaste = set_combine(sets.engaged.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.LowAcc.DT.MaxHaste = set_combine(sets.engaged.LowAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.MidAcc.DT.MaxHaste = set_combine(sets.engaged.MidAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.HighAcc.DT.MaxHaste = set_combine(sets.engaged.HighAcc.MaxHaste, sets.engaged.Hybrid)
    sets.engaged.STP.DT.MaxHaste = set_combine(sets.engaged.STP.MaxHaste, sets.engaged.Hybrid)

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
    sets.buff.Sange = {
        ammo = "Hachiya Shuriken"
    }

    sets.magic_burst = {
        feet = "Hachiya Kyahan +3",
        ring1 = "Locus Ring",
        ring2 = "Mujin Band" -- (5)
    }

    --    sets.buff.Migawari = {body="Iga Ningi +2"}

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

    -- sets.CP = {back="Mecisto. Mantle"}
    sets.TreasureHunter = {
        head = "Volte Cap",
        hands = gear.Herc_TH_hands,
        waist = "Chaac Belt"
    }
    -- sets.Reive = {neck="Ygnas's Resolve +1"}

    -- sets.Kikoku = {main="Kikoku", sub="Ternion Dagger +1"}

    sets.Heishi = {
        main = "Heishi Shorinken",
        sub = "Kunimitsu"
    }

    sets.Naegling = {
        main = "Naegling",
        sub = {
            name = "Hitaki",
            augments = {'TP Bonus +1000'}
        }
    }

    sets.AeolianEdge = {
        main = "Tauret",
        sub = {
            name = "Kunimitsu",
            augments = {'Path: A'}
        }
    }

    sets.Tanking = {
        main = {
            name = "Heishi Shorinken",
            augments = {'Path: A'}
        },
        sub = {
            name = "Tsuru",
            augments = {'Path: A'}
        }
    }

    sets.Nuking = {
        main = "Gokotai",
        sub = {
            name = "Kunimitsu",
            augments = {'Path: A'}
        }
    }

    sets.GreatKatana = {
        main = "Hachimonji",
        sub = "Alber Strap"
    }

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
    if spell.skill == "Ninjutsu" then
        do_ninja_tool_checks(spell, spellMap, eventArgs)
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
    if spell.type == 'WeaponSkill' then
        if lugra_ws:contains(spell.english) and (world.time >= (17 * 60) or world.time <= (7 * 60)) then
            equip(sets.Lugra)
        end
        if spell.english == 'Blade: Yu' and (world.weather_element == 'Water' or world.day_element == 'Water') then
            equip(sets.Obi)
        end
    end
end

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spellMap == 'ElementalNinjutsu' then
        if state.MagicBurst.value then
            equip(sets.magic_burst)
        end
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
        if state.Buff.Futae then
            equip(sets.precast.JA['Futae'])
        end
    end
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
    if player.status ~= 'Engaged' and state.WeaponLock.value == false then
        check_weaponset()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    --    if buffactive['Reive Mark'] then
    --        if gain then
    --            equip(sets.Reive)
    --            disable('neck')
    --        else
    --            enable('neck')
    --        end
    --    end

    if buff == "Migawari" and not gain then
        add_to_chat(61, "*** MIGAWARI DOWN ***")
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

    check_weaponset()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_handle_equipping_gear(playerStatus, eventArgs)
    check_gear()
    update_combat_form()
    determine_haste_group()
    check_moving()
end

function job_update(cmdParams, eventArgs)
    handle_equipping_gear(player.status)
    th_update(cmdParams, eventArgs)
end

function update_combat_form()
    if DW == true then
        state.CombatForm:set('DW')
    elseif DW == false then
        state.CombatForm:reset()
    end
end

function get_custom_wsmode(spell, action, spellMap)
    local wsmode
    if state.OffenseMode.value == 'MidAcc' or state.OffenseMode.value == 'HighAcc' then
        wsmode = 'Acc'
    end

    return wsmode
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    -- if state.CP.current == 'on' then
    --     equip(sets.CP)
    --     disable('back')
    -- else
    --     enable('back')
    -- end
    if state.Auto_Kite.value == true then
        if world.time >= (17 * 60) or world.time <= (7 * 60) then
            idleSet = set_combine(idleSet, sets.NightMovement)
        else
            idleSet = set_combine(idleSet, sets.DayMovement)
        end
    end

    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.Buff.Sange then
        meleeSet = set_combine(meleeSet, sets.buff.Sange)
    end

    check_weaponset()

    return meleeSet
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)

    local cf_msg = ''
    if state.CombatForm.has_value then
        cf_msg = ' (' .. state.CombatForm.value .. ')'
    end

    local m_msg = state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        m_msg = m_msg .. '/' .. state.HybridMode.value
    end

    local ws_msg = state.WeaponskillMode.value

    local c_msg = state.CastingMode.value

    local d_msg = 'None'
    if state.DefenseMode.value ~= 'None' then
        d_msg = state.DefenseMode.value .. state[state.DefenseMode.value .. 'DefenseMode'].value
    end

    local i_msg = state.IdleMode.value

    local msg = ''
    if state.TreasureMode.value == 'Tag' then
        msg = msg .. ' TH: Tag |'
    end
    if state.MagicBurst.value then
        msg = ' Burst: On |'
    end
    if state.Kiting.value then
        msg = msg .. ' Kiting: On |'
    end

    add_to_chat(002,
        '| ' .. string.char(31, 210) .. 'Melee' .. cf_msg .. ': ' .. string.char(31, 001) .. m_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 207) .. ' WS: ' .. string.char(31, 001) .. ws_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 060) .. ' Magic: ' .. string.char(31, 001) .. c_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 004) .. ' Defense: ' .. string.char(31, 001) .. d_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 008) .. ' Idle: ' .. string.char(31, 001) .. i_msg ..
            string.char(31, 002) .. ' |' .. string.char(31, 002) .. msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function check_moving()
    if state.DefenseMode.value == 'None' and state.Kiting.value == false then
        if state.Auto_Kite.value == false and moving then
            state.Auto_Kite:set(true)
        elseif state.Auto_Kite.value == true and moving == false then
            state.Auto_Kite:set(false)
        end
    end
end

function determine_haste_group()
    classes.CustomMeleeGroups:clear()
    if DW == true then
        if DW_needed <= 1 then
            classes.CustomMeleeGroups:append('MaxHaste')
        elseif DW_needed > 1 and DW_needed <= 16 then
            classes.CustomMeleeGroups:append('HighHaste')
        elseif DW_needed > 16 and DW_needed <= 21 then
            classes.CustomMeleeGroups:append('MidHaste')
        elseif DW_needed > 21 and DW_needed <= 34 then
            classes.CustomMeleeGroups:append('LowHaste')
        elseif DW_needed > 34 then
            classes.CustomMeleeGroups:append('')
        end
    end
end

function job_self_command(cmdParams, eventArgs)
    gearinfo(cmdParams, eventArgs)
end

function gearinfo(cmdParams, eventArgs)
    if cmdParams[1] == 'gearinfo' then
        if type(tonumber(cmdParams[2])) == 'number' then
            if tonumber(cmdParams[2]) ~= DW_needed then
                DW_needed = tonumber(cmdParams[2])
                DW = true
            end
        elseif type(cmdParams[2]) == 'string' then
            if cmdParams[2] == 'false' then
                DW_needed = 0
                DW = false
            end
        end
        if type(tonumber(cmdParams[3])) == 'number' then
            if tonumber(cmdParams[3]) ~= Haste then
                Haste = tonumber(cmdParams[3])
            end
        end
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
-- Determine whether we have sufficient tools for the spell being attempted.
function do_ninja_tool_checks(spell, spellMap, eventArgs)
    local ninja_tool_name
    local ninja_tool_min_count = 1

    -- Only checks for universal tools and shihei
    if spell.skill == "Ninjutsu" then
        if spellMap == 'Utsusemi' then
            ninja_tool_name = "Shihei"
        elseif spellMap == 'ElementalNinjutsu' then
            ninja_tool_name = "Inoshishinofuda"
        elseif spellMap == 'EnfeeblingNinjutsu' then
            ninja_tool_name = "Chonofuda"
        elseif spellMap == 'EnhancingNinjutsu' then
            ninja_tool_name = "Shikanofuda"
        else
            return
        end
    end

    local available_ninja_tools = player.inventory[ninja_tool_name] or player.wardrobe[ninja_tool_name]

    -- If no tools are available, end.
    if not available_ninja_tools then
        if spell.skill == "Ninjutsu" then
            return
        end
    end

    -- Low ninja tools warning.
    if spell.skill == "Ninjutsu" and state.warned.value == false and available_ninja_tools.count > 1 and
        available_ninja_tools.count <= options.ninja_tool_warning_limit then
        local msg = '*****  LOW TOOLS WARNING: ' .. ninja_tool_name .. ' *****'
        -- local border = string.repeat("*", #msg)
        local border = ""
        for i = 1, #msg do
            border = border .. "*"
        end

        add_to_chat(104, border)
        add_to_chat(104, msg)
        add_to_chat(104, border)

        state.warned:set()
    elseif available_ninja_tools.count > options.ninja_tool_warning_limit and state.warned then
        state.warned:reset()
    end
end

-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
    -- category == 4 or -- any magic action
    (category == 3 and param == 30) or -- Aeolian Edge
    (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
    then
        return true
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

function check_weaponset()
    equip(sets[state.WeaponSet.current])
    if player.sub_job ~= 'NIN' and player.sub_job ~= 'DNC' then
        equip(sets.DefaultShield)
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
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 37)
    elseif player.sub_job == 'THF' then
        set_macro_page(3, 37)
    else
        set_macro_page(1, 37)
    end
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end
