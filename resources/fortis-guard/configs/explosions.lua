-- [[ Explosion Detection ]]

RS.explosionProtection = true -- Enable/Disable detection for Blacklisted Explosions based on the table below
RS.explosions_maxExplosions = 7 -- Ban the player after 7 explosions
RS.explosions_resetTime = 8000 -- Reset the timer after 8 seconds

RS.explosions_preventExplosions = true -- If enabled all explosions will be cancelled if possible

RS.explosions_BlacklistedExplosionsTable = {
    [1] = { name = "EXP_TAG_GRENADE", detect = true},
    [2] = { name = "EXP_TAG_GRENADELAUNCHER", detect = true},
    [3] = { name = "EXP_TAG_STICKYBOMB", detect = false},
    [4] = { name = "EXP_TAG_MOLOTOV", detect = true},
    [5] = { name = "EXP_TAG_ROCKET", detect = true},
    [6] = { name = "EXP_TAG_TANKSHELL", detect = true},
    [7] = { name = "EXP_TAG_HI_OCTANE", detect = false},
    [8] = { name = "EXP_TAG_CAR", detect = true},
    [9] = { name = "EXP_TAG_PLANE", detect = false},
    [10] = { name = "EXP_TAG_PETROL_PUMP", detect = false},
    [11] = { name = "EXP_TAG_BIKE", detect = false},
    [12] = { name = "EXP_TAG_DIR_STEAM", detect = false},
    [13] = { name = "EXP_TAG_DIR_FLAME", detect = false},
    [14] = { name = "EXP_TAG_DIR_WATER_HYDRANT", detect = false},
    [15] = { name = "EXP_TAG_DIR_GAS_CANISTER", detect = false},
    [16] = { name = "EXP_TAG_BOAT", detect = false},
    [17] = { name = "EXP_TAG_SHIP_DESTROY", detect = false},
    [18] = { name = "EXP_TAG_TRUCK", detect = false},
    [19] = { name = "EXP_TAG_BULLET", detect = false},
    [20] = { name = "EXP_TAG_SMOKEGRENADELAUNCHER", detect = false},
    [21] = { name = "EXP_TAG_SMOKEGRENADE", detect = false},
    [22] = { name = "EXP_TAG_BZGAS", detect = false},
    [23] = { name = "EXP_TAG_FLARE", detect = false},
    [24] = { name = "EXP_TAG_GAS_CANISTER", detect = false},
    [25] = { name = "EXP_TAG_EXTINGUISHER", detect = false},
    [26] = { name = "EXP_TAG_PROGRAMMABLEAR", detect = false},
    [27] = { name = "EXP_TAG_TRAIN", detect = true},
    [28] = { name = "EXP_TAG_BARREL", detect = false},
    [29] = { name = "EXP_TAG_PROPANE", detect = false},
    [30] = { name = "EXP_TAG_BLIMP", detect = true},
    [31] = { name = "EXP_TAG_DIR_FLAME_EXPLODE", detect = false},
    [32] = { name = "EXP_TAG_TANKER", detect = false},
    [33] = { name = "EXP_TAG_PLANE_ROCKET", detect = true},
    [34] = { name = "EXP_TAG_VEHICLE_BULLET", detect = false},
    [35] = { name = "EXP_TAG_GAS_TANK", detect = false},
    [36] = { name = "EXP_TAG_BIRD_CRAP", detect = false},
    [37] = { name = "EXP_TAG_RAILGUN", detect = true},
    [38] = { name = "EXP_TAG_BLIMP", detect = true},
    [39] = { name = "EXP_TAG_FIREWORK", detect = false},
    [40] = { name = "EXP_TAG_SNOWBALL", detect = false},
    [41] = { name = "EXP_TAG_PROXMINE", detect = true},
    [42] = { name = "EXP_TAG_VALKYRIE_CANNON", detect = true},
    [43] = { name = "EXP_TAG_AIR_DEFENSE", detect = true},
    [44] = { name = "EXP_TAG_PIPEBOMB", detect = true},
    [45] = { name = "EXP_TAG_VEHICLEMINE", detect = false},
    [46] = { name = "EXP_TAG_EXPLOSIVEAMMO", detect = true},
    [47] = { name = "EXP_TAG_APCSHELL", detect = false},
    [48] = { name = "EXP_TAG_BOMB_CLUSTER", detect = false},
    [49] = { name = "EXP_TAG_BOMB_GAS", detect = false},
    [50] = { name = "EXP_TAG_BOMB_INCENDIARY", detect = false},
    [51] = { name = "EXP_TAG_BOMB_STANDARD", detect = false},
    [52] = { name = "EXP_TAG_TORPEDO", detect = false},
    [53] = { name = "EXP_TAG_TORPEDO_UNDERWATER", detect = false},
    [54] = { name = "EXP_TAG_BOMBUSHKA_CANNON", detect = false},
    [55] = { name = "EXP_TAG_BOMB_CLUSTER_SECONDARY", detect = false},
    [56] = { name = "EXP_TAG_HUNTER_BARRAGE", detect = false},
    [57] = { name = "EXP_TAG_HUNTER_CANNON", detect = false},
    [58] = { name = "EXP_TAG_ROGUE_CANNON", detect = false},
    [59] = { name = "EXP_TAG_MINE_UNDERWATER", detect = false},
    [60] = { name = "EXP_TAG_ORBITAL_CANNON", detect = false},
    [61] = { name = "EXP_TAG_BOMB_STANDARD_WIDE", detect = false},
    [62] = { name = "EXP_TAG_EXPLOSIVEAMMO_SHOTGUN", detect = false},
    [63] = { name = "EXP_TAG_OPPRESSOR_CANNON", detect = false},
    [64] = { name = "EXP_TAG_MORTAR_KINETIC", detect = false},
    [65] = { name = "EXP_TAG_VEHICLEMINE_KINETIC", detect = false},
    [66] = { name = "EXP_TAG_VEHICLEMINE_EMP", detect = false},
    [67] = { name = "EXP_TAG_VEHICLEMINE_SPIKE", detect = false},
    [68] = { name = "EXP_TAG_VEHICLEMINE_SLICK", detect = false},
    [69] = { name = "EXP_TAG_VEHICLEMINE_TAR", detect = false},
    [70] = { name = "EXP_TAG_SCRIPT_DRONE", detect = false},
    [71] = { name = "EXP_TAG_RAYGUN", detect = true},
    [72] = { name = "EXP_TAG_BURIEDMINE", detect = true},
    [73] = { name = "EXP_TAG_SCRIPT_MISSILE", detect = true}
}
