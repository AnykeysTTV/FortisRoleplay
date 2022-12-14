RC = {}

-- Client Side Screenshot Settings
RC.client_enableScreenshots = false -- Enable screenshot features
RC.discord_screenshot_storage = "" -- Discord Webhook for screenshots storage (Consider changing this event atleast 1 time every 2 days to avoid Rate Limitation)
RC.client_blacklistedkeys = {"tab","insert","f2","delete","home","f12"} -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

-- Resource Checker NEW
RC.resourcechecker = false -- Detects on Stopping/Starting resources that are not from your server (You can restart/stop/start resources but remember to do `refresh` in your console first)

-- Anti Spectate (requires chocohax.spectate)
RC.antispectate = true -- Detects and Block spectacting functions on different menus
RC.blockFreeCam = true -- Block any kind of free cam (may be not compatible with all servers.)

-- Anti Player Blips (requires chocohax.blips)
RC.antiblips = true -- Detects users that are using Player Blips (may cause false positives for jobs like esx_police or esx_ambulance)

RC.autoAdminAuth = true -- Automatically checks for permissions (can impact on the server performance)
-- If FALSE you must execute `chocoauth` command in your F8 in-game console to permissions.

-- Admin Menu Key
RC.adminMenuOpenKey = "insert" --false -- insert is the default key for the admin menu (set to false to disable and use command instead) -- chocoOpenMenu

-- Admin Menu Noclip Key
RC.adminNoclipKey = "false" -- f2 is the default key for noclip (set to false to disable and use command instead) -- choconoclip

-- Client Side Weapons Settings
RC.client_checkWeapons = true -- Detects on holding a blacklisted Weapon (The check may be delayed by 5 seconds.)
RC.client_blockWeaponPickups = true -- Block Weapons Pickups (Highly recommended.)

 -- Cache Detection NEW 
RC.client_cacheDetection = true -- Detect if the player is using custom mod menus (may not be compatible with all servers)

RC.client_BWeapons = {
    -- Melee
     -- [2460120199] = {name = "weapon_dagger"}, -- Antique Cavalry Dagger
     -- [2508868239] = {name = "weapon_bat"}, -- Baseball Bat
     -- [4192643659] = {name = "weapon_bottle"}, -- Broken Bottle
     -- [2227010557] = {name = "weapon_crowbar"}, -- Crowbar
     -- [2343591895] = {name = "weapon_flashlight"}, -- Flashlight
     -- [1141786504] = {name = "weapon_golfclub"}, -- Golf Club
    -- [1317494643] = {name = "weapon_hammer"}, -- Hammer
     -- [4191993645] = {name = "weapon_hatchet"}, -- Hatchet
     -- [3638508604] = {name = "weapon_knuckle"}, -- Brass Knuckles
    -- [2578778090] = {name = "weapon_knife"}, -- Knife
    -- [3713923289] = {name = "weapon_machete"}, -- Machete
     -- [3756226112] = {name = "weapon_switchblade"}, -- Switchblade
     -- [1737195953] = {name = "weapon_nightstick"}, -- Nightstick
     -- [419712736] = {name = "weapon_wrench"}, -- Pipe Wrench
     -- [3441901897] = {name = "weapon_battleaxe"}, -- Battle Axe
     -- [2484171525] = {name = "weapon_poolcue"}, -- Pool Cue
     -- [940833800] = {name = "weapon_stone_hatchet"}, -- Stone Hatchet

     -- Handguns
     --[453432689] = {name = "weapon_pistol"}, -- Pistol
     -- [3219281620] = {name = "weapon_pistol_mk2"}, -- Pistol Mk II
     -- [1593441988] = {name = "weapon_combatpistol"}, -- Combat Pistol
     -- [584646201] = {name = "weapon_appistol"}, -- AP Pistol
     -- [911657153] = {name = "weapon_stungun"}, -- Stun Gun
     -- [2578377531] = {name = "weapon_pistol50"}, -- Pistol .50
     -- [3218215474] = {name = "weapon_snspistol"}, -- SNS Pistol
     -- [2285322324] = {name = "weapon_snspistol_mk2"}, -- SNS Pistol Mk II
     -- [3523564046] = {name = "weapon_heavypistol"}, -- Heavy Pistol
     -- [137902532] = {name = "weapon_vintagepistol"}, --  Vintage Pistol
     -- [1198879012] = {name = "weapon_flaregun"}, -- Flare Gun
     -- [3696079510] = {name = "weapon_marksmanpistol"}, -- Marksman Pistol
     -- [3249783761] = {name = "weapon_revolver"}, -- Heavy Revolver
     -- [3415619887] = {name = "weapon_revolver_mk2"}, -- Heavy Revolver Mk II
     -- [2548703416] = {name = "weapon_doubleaction"}, -- Double Action Revolver
     -- [2939590305] = {name = "weapon_raypistol"}, -- Up-n-Atomizer
     -- [727643628] = {name = "weapon_ceramicpistol"}, -- Ceramic Pistol
     -- [2441047180] = {name = "weapon_navyrevolver"}, -- Navy Revolver

     -- Submachine Guns
     -- [324215364] = {name = "weapon_microsmg"}, -- Micro SMG
     -- [736523883] = {name = "weapon_smg"}, -- SMG
     -- [2024373456] = {name = "weapon_smg_mk2"}, -- SMG Mk II
     -- [4024951519] = {name = "weapon_assaultsmg"}, -- Assault SMG
     -- [171789620] = {name = "weapon_combatpdw"}, -- Combat PDW
     -- [3675956304] = {name = "weapon_machinepistol"}, -- Machine Pistol
     -- [3173288789] = {name = "weapon_minismg"}, --  Mini SMG
     [1198256469] = {name = "weapon_raycarbine"}, -- Unholy Hellbringer

     -- Shotguns
     -- [487013001] = {name = "weapon_pumpshotgun"}, -- Pump Shotgun
     -- [1432025498] = {name = "weapon_pumpshotgun_mk2"}, -- Pump Shotgun Mk II
     -- [2017895192] = {name = "weapon_sawnoffshotgun"}, -- Sawed-Off Shotgun
     -- [3800352039] = {name = "weapon_assaultshotgun"}, -- Assault Shotgun
     -- [2640438543] = {name = "weapon_bullpupshotgun"}, -- Bullpup Shotgun
     -- [2828843422] = {name = "weapon_musket"}, -- Musket
     -- [984333226] = {name = "weapon_heavyshotgun"}, -- Heavy Shotgun
     -- [4019527611] = {name = "weapon_dbshotgun"}, -- Double Barrel Shotgun
     -- [317205821] = {name = "weapon_autoshotgun"}, -- Sweeper Shotgun

     -- -- Assault Rifles
     -- [3220176749] = {name = "weapon_assaultrifle"}, -- Assault Rifle
     -- [961495388] = {name = "weapon_assaultrifle_mk2"}, -- Assault Rifle Mk II
     -- [2210333304] = {name = "weapon_carbinerifle"}, -- Carbine Rifle
     -- [4208062921] = {name = "weapon_carbinerifle_mk2"}, -- Carbine Rifle Mk II
     -- [2937143193] = {name = "weapon_advancedrifle"}, -- Advanced Rifle
     -- [3231910285] = {name = "weapon_specialcarbine"}, -- Special Carbine
     -- [2526821735] = {name = "weapon_specialcarbine_mk2"}, -- Special Carbine Mk II
     -- [2132975508] = {name = "weapon_bullpuprifle"}, -- Bullpup Rifle
     -- [2228681469] = {name = "weapon_bullpuprifle_mk2"}, -- Bullpup Rifle Mk II
     -- [1649403952] = {name = "weapon_compactrifle"}, -- Compact Rifle

     -- -- Light Machine Guns
     -- [2634544996] = {name = "weapon_mg"}, -- MG
     -- [2144741730] = {name = "weapon_combatmg"}, -- Combat MG
     -- [3686625920] = {name = "weapon_combatmg_mk2"}, -- Combat MG Mk II
     -- [1627465347] = {name = "weapon_gusenberg"}, -- Gusenberg Sweeper

     -- -- Sniper Rifles
     -- [100416529] = {name = "weapon_sniperrifle"}, -- Sniper Rifle
     -- [205991906] = {name = "weapon_heavysniper"}, -- Heavy Sniper
     -- [177293209] = {name = "weapon_heavysniper_mk2"}, -- Heavy Sniper Mk II
     -- [3342088282] = {name = "weapon_marksmanrifle"}, -- Marksman Rifle
     -- [1785463520] = {name = "weapon_marksmanrifle_mk2"}, -- Marksman Rifle Mk II

     -- Heavy Weapons
     [2982836145] = {name = "weapon_rpg"}, -- RPG
     [1752584910] = {name = "weapon_rpg_2"}, -- RPG 2
     [2726580491] = {name = "weapon_grenadelauncher"}, -- Grenade Launcher
     [1305664598] = {name = "weapon_grenadelauncher_smoke"}, -- Smoke Grenade Launcher
     [1119849093] = {name = "weapon_minigun"}, -- Minigun
     [2138347493] = {name = "weapon_firework"}, -- Firework Launcher
     [1834241177] = {name = "weapon_railgun"}, -- Railgun
     [1672152130] = {name = "weapon_hominglauncher"}, -- Homing Launcher
     [125959754] = {name = "weapon_compactlauncher"}, -- Compact Grenade Launcher
     [3056410471] = {name = "weapon_rayminigun"}, -- Widowmaker

     -- Throwables
     -- [2481070269] = {name = "weapon_grenade"}, -- Grenade
     [2694266206] = {name = "weapon_bzgas"}, -- BZGas
     [615608432] = {name = "weapon_molotov"}, -- Molotov
     [741814745] = {name = "weapon_stickybomb"}, -- Sticky poop
     [2874559379] = {name = "weapon_proxmine"}, -- Proximity Mine
     -- [126349499] = {name = "weapon_snowball"}, -- Snow CBT
     [3125143736] = {name = "weapon_pipebomb"}, -- Pipe Bomb
     -- [600439132] = {name = "weapon_ball"}, -- Ball (Baseball ball)
     [4256991824] = {name = "weapon_smokegrenade"}, -- Smoke Grenade
     -- [1233104067] = {name = "weapon_flare"}, -- WOOSH flare

     -- --Miscellaneous
     -- [883325847] = {name = "weapon_petrolcan"}, -- Jerry Can
     -- [4222310262] = {name = "gadget_parachute"}, -- Parachute
     -- [101631238] = {name = "weapon_fireextinguisher"}, -- Fire Extinguisher
     -- [3126027122] = {name = "weapon_hazardcan"}, -- Hazardous Jerry Can

}