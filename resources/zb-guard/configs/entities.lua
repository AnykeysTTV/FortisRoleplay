RS.entitiesProtection = true -- Entity/AntiNuke Masterswitch

RS.entitiesOnlyPlayerSpawn = false -- (true > heavier > Detects more precisely blacklisted entities) (false > lighter > Detects only player spawn entities)


--NEW Entity Spawn Lock
-----------------------
--false > disabled
--"inactive" > Users can spawn entities normally
--"relaxed" > NPC and Traffic is allowed, Blocked Client Sided entity spawning
--"strict" > NPC and Traffic are blocked, Blocked Client Sided entity spawning
--WARNING! using this feature will block any kind of Client Sided spawning
--THIS will require spawning entities from the server side
--ADJUST your server resources before continuing.
-----------------------
RS.entities_spawnlock = false

--Objects/Models
RS.entities_objectsdetection = true -- Detect objects
RS.entities_objectsDetectionMode = 2 -- 0 Warning, 1 Kick, 2 Ban

--Vehicles
RS.entities_vehiclesdetection = true -- Detect Vehicles
RS.entities_vehiclesDetectionMode = 2 -- 0 Warning, 1 Kick, 2 Ban

--Peds
RS.entities_pedsdetection = true -- Detect Peds
RS.entities_pedsDetectionMode = 2 -- 0 Warning, 1 Kick, 2 Ban

RS.entities_blockall = false -- EVERYTHING will be detected except for Whitelisted things...

RS.entities_antinukeProtection = true
RS.entities_antinuke_peds = true
RS.entities_antinuke_vehicles = true
RS.entities_antinuke_objects = false -- UNDER TESTING (GOOD BUT NOT FOR EVERYONE!!)
RS.entities_antinuke_maxspawn = 6 -- After 10 Spawned PEDS/VEH/OBJ the player gets automatically warned
RS.entities_antinuke_resettime = 8000 -- After 5 seconds the AntiNuke timer gets reseted
RS.entities_antinuke_detectionMode = 1 -- 0 Warning, 1 Kick, 2 Ban

RS.entities_whitelisted_objects = { -- You can add here any kind of objects/prop you want to whitelist and don't waste time on checks
    [`prop_mp_cone_01`] = { name = "prop_mp_cone_01" },
    [`prop_mp_barrier_02b`] = { name = "prop_mp_barrier_02b" },
    [`prop_barrier_work05`] = { name = "prop_barrier_work05" },
    [`prop_mp_arrow_barrier_01`] = { name = "prop_mp_arrow_barrier_01" },
	[`prop_roadcone02a`] = { name = "prop_roadcone02a" },
	[`prop_toolchest_01`] = { name = "prop_toolchest_01" },
	[`p_ld_stinger_s`] = { name = "p_ld_stinger_s" },
	[`hei_prop_cash_crate_half_full`] = { name = "hei_prop_cash_crate_half_full" },
	[`prop_studio_light_01`] = { name = "prop_studio_light_01" },
	[`prop_studio_light_02`] = { name = "prop_studio_light_02" },
	[`prop_studio_light_03`] = { name = "prop_studio_light_03" },
	[`prop_kino_light_03`] = { name = "prop_kino_light_03" },
	[`xm_prop_base_tripod_lampb`] = { name = "xm_prop_base_tripod_lampb" },
	[`prop_dolly_01`] = { name = "prop_dolly_01" },
	[`prop_dolly_02`] = { name = "prop_dolly_02" },
	[`prop_generator_01a`] = { name = "prop_generator_01a" },
	[`prop_scrim_02`] = { name = "prop_scrim_02" },
	[`prop_tv_cam_02`] = { name = "prop_tv_cam_02" },
	[`prop_tv_stand_01`] = { name = "prop_tv_stand_01" },
	[`w_sg_sawnoff`] = { name = "w_sg_sawnoff" },
	[`w_lr_firework`] = { name = "w_lr_firework" },
	[`w_sr_sniperrifle`] = { name = "w_sr_sniperrifle" },
	[`w_ar_carbinerifle`] = { name = "w_ar_carbinerifle" },
	[`w_ar_assaultrifle`] = { name = "w_ar_assaultrifle" },
	[`w_ar_specialcarbine`] = { name = "w_ar_specialcarbine" },
	[`w_ar_bullpuprifle`] = { name = "w_ar_bullpuprifle" },
	[`w_ar_advancedrifle`] = { name = "w_ar_advancedrifle" },
	[`w_sg_assaultshotgun`] = { name = "w_sg_assaultshotgun" },
	[`w_sg_bullpupshotgun`] = { name = "w_sg_bullpupshotgun" },
	[`w_sg_pumpshotgun`] = { name = "w_sg_pumpshotgun" },
	[`w_ar_musket`] = { name = "w_ar_musket" },
	[`w_sr_heavysniper`] = { name = "w_sr_heavysniper" },
	[`w_sb_microsmg`] = { name = "w_sb_microsmg" },
	[`w_sb_pdw`] = { name = "w_sb_pdw" },
	[`w_sb_assaultsmg`] = { name = "w_sb_assaultsmg" },
	[`w_sb_smg`] = { name = "w_sb_smg" },
	[`w_sb_gusenberg`] = { name = "w_sb_gusenberg" },
	[`w_sb_combatpdw`] = { name = "w_sb_combatpdw" },
	[`prop_cs_hand_radio`] = { name = "prop_cs_hand_radio" },
	[`prop_cs_burger_01`] = { name = "prop_cs_burger_01" },
	[`prop_amb_phone`] = { name = "prop_amb_phone" },
	[`prop_ecola_can`] = { name = "prop_ecola_can" },
	[`p_amb_coffeecup_01`] = { name = "p_amb_coffeecup_01" },
	[`prop_plastic_cup_02`] = { name = "prop_plastic_cup_02" },
	[`prop_amb_donut`] = { name = "prop_amb_donut" },
	[`prop_drink_whisky`] = { name = "prop_drink_whisky" },
	[`prop_drink_redwine`] = { name = "prop_drink_redwine" },
	[`prop_amb_beer_bottle`] = { name = "prop_amb_beer_bottle" },
	[`prop_sandwich_01`] = { name = "prop_sandwich_01" },
	[`ba_prop_battle_glowstick_01`] = { name = "ba_prop_battle_glowstick_01" },
	[`ba_prop_battle_hobby_horse`] = { name = "ba_prop_battle_hobby_horse" },
	[`p_amb_brolly_01`] = { name = "p_amb_brolly_01" },
	[`prop_notepad_01`] = { name = "prop_notepad_01" },
	[`prop_pencil_01`] = { name = "prop_pencil_01" },
	[`hei_prop_heist_box`] = { name = "hei_prop_heist_box" },
	[`prop_single_rose`] = { name = "prop_single_rose" },
	[`prop_cs_ciggy_01`] = { name = "prop_cs_ciggy_01" },
	[`hei_heist_sh_bong_01`] = { name = "hei_heist_sh_bong_01" },
	[`prop_ld_suitcase_01`] = { name = "prop_ld_suitcase_01" },
	[`prop_security_case_01`] = { name = "prop_security_case_01" },
	[`prop_police_id_board`] = { name = "prop_police_id_board" },
	[`prop_champ_flute`] = { name = "prop_champ_flute" },
	[`prop_drink_champ`] = { name = "prop_drink_champ" },
	[`prop_cigar_01`] = { name = "prop_cigar_01" },
	[`prop_cigar_02`] = { name = "prop_cigar_02" },
	[`prop_acc_guitar_01`] = { name = "prop_acc_guitar_01" },
	[`prop_el_guitar_01`] = { name = "prop_el_guitar_01" },
	[`prop_el_guitar_03`] = { name = "prop_el_guitar_03" },
	[`prop_novel_01`] = { name = "prop_novel_01" },
	[`prop_snow_flower_02`] = { name = "prop_snow_flower_02" },
	[`v_ilev_mr_rasberryclean`] = { name = "v_ilev_mr_rasberryclean" },
	[`p_michael_backpack_s`] = { name = "p_michael_backpack_s" },
	[`p_amb_clipboard_01`] = { name = "p_amb_clipboard_01" },
	[`prop_tourist_map_01`] = { name = "prop_tourist_map_01" },
	[`prop_beggers_sign_03`] = { name = "prop_beggers_sign_03" },
	[`prop_anim_cash_pile_01`] = { name = "prop_anim_cash_pile_01" },
	[`prop_pap_camera_01`] = { name = "prop_pap_camera_01" },
	[`ba_prop_battle_champ_open`] = { name = "ba_prop_battle_champ_open" },
	[`p_cs_joint_02`] = { name = "p_cs_joint_02" },
	[`prop_amb_ciggy_01`] = { name = "prop_amb_ciggy_01" },
	[`prop_cs_tablet`] = { name = "prop_cs_tablet" },
	[`prop_npc_phone_02`] = { name = "prop_npc_phone_02" },
	[`prop_ld_case_01`] = { name = "prop_ld_case_01" },
	[`prop_sponge_01`] = { name = "prop_sponge_01" },
	[`prop_ld_flow_bottle`] = { name = "prop_ld_flow_bottle" },
	[`ng_proc_sodacan_01b`] = { name = "ng_proc_sodacan_01b" },
	[`prop_v_cam_01`] = { name = "prop_v_cam_01" },
	[`prop_v_bmike_01`] = { name = "prop_v_bmike_01" },
	[`p_ing_microphonel_01`] = { name = "p_ing_microphonel_01" },
	[`w_me_nightstick`] = { name = "w_me_nightstick" },
	[`w_me_knife_01`] = { name = "w_me_knife_01" },
	[`w_me_hammer`] = { name = "w_me_hammer" },
	[`w_me_gclub`] = { name = "w_me_gclub" },
	[`w_me_bat`] = { name = "w_me_bat" },
	[`w_me_crowbar`] = { name = "w_me_crowbar" },
	[`p_cs_cuffs_02_s`] = { name = "p_cs_cuffs_02_s" },
	[`prop_choc_ego`] = { name = "prop_choc_ego" },
	[`prop_bodyarmour_03`] = { name = "prop_bodyarmour_03" },
	[`prop_food_bs_burger2`] = { name = "prop_food_bs_burger2" },
	[`prop_ld_snack_01`] = { name = "prop_ld_snack_01" },
	[`p_parachute1_mp_s`] = { name = "p_parachute1_mp_s" },
	[`gtaw_ladder_m`] = { name = "gtaw_ladder_m" },
	[`gtaw_ladder_l`] = { name = "gtaw_ladder_l" },
	[`gtaw_ladder_s`] = { name = "gtaw_ladder_s" },
	[`pd_tape`] = { name = "pd_tape" },
	[`prop_juicestand`] = { name = "prop_juicestand" },
	[`prop_air_conelight`] = { name = "prop_air_conelight" },
	[`prop_barrier_work06a`] = { name = "prop_barrier_work06a" },
	[`prop_mp_cone_04`] = { name = "prop_mp_cone_04" },
	[`prop_mp_cone_02`] = { name = "prop_mp_cone_02" },
	[`p_ld_heist_bag_01`] = { name = "p_ld_heist_bag_01" },
	[`prop_cs_shopping_bag`] = { name = "prop_cs_shopping_bag" },
	[`p_car_keys_01`] = { name = "p_car_keys_01" },
	[`w_sg_heavyshotgun`] = { name = "w_sg_heavyshotgun" },
	[1760825203] = { name = "xm_prop_x17_tem_control_01" }
}

RS.entities_blacklisted_objects = { -- You can blacklist any prop don't want on the server, and if it's spawned by a player it triggers a detection
    [`prop_fnclink_05crnr1`] = { name = "prop_fnclink_05crnr1" },
    [`xs_prop_hamburgher_wl`] = { name = "xs_prop_hamburgher_wl" },
    [`xs_prop_plastic_bottle_wl`] = { name = "xs_prop_plastic_bottle_wl" },
    [`prop_windmill_01`] = { name = "prop_windmill_01" },
    [`p_spinning_anus_s`] = { name = "p_spinning_anus_s" },
    [`stt_prop_ramp_adj_flip_m`] = { name = "stt_prop_ramp_adj_flip_m" },
    [`stt_prop_ramp_adj_flip_mb`] = { name = "stt_prop_ramp_adj_flip_mb" },
    [`stt_prop_ramp_adj_flip_s`] = { name = "stt_prop_ramp_adj_flip_s" },
    [`stt_prop_ramp_adj_flip_sb`] = { name = "stt_prop_ramp_adj_flip_sb" },
    [`stt_prop_ramp_adj_hloop`] = { name = "stt_prop_ramp_adj_hloop" },
    [`stt_prop_ramp_adj_loop`] = { name = "stt_prop_ramp_adj_loop" },
    [`stt_prop_ramp_jump_l`] = { name = "stt_prop_ramp_jump_l" },
    [`stt_prop_ramp_jump_m`] = { name = "stt_prop_ramp_jump_m" },
    [`stt_prop_ramp_jump_s`] = { name = "stt_prop_ramp_jump_s" },
    [`stt_prop_ramp_jump_xl`] = { name = "stt_prop_ramp_jump_xl" },
    [`stt_prop_ramp_jump_xs`] = { name = "stt_prop_ramp_jump_xs" },
    [`stt_prop_ramp_jump_xxl`] = { name = "stt_prop_ramp_jump_xxl" },
    [`stt_prop_ramp_multi_loop_rb`] = { name = "stt_prop_ramp_multi_loop_rb" },
    [`stt_prop_ramp_spiral_l`] = { name = "stt_prop_ramp_spiral_l" },
    [`stt_prop_ramp_spiral_l_l`] = { name = "stt_prop_ramp_spiral_l_l" },
    [`stt_prop_ramp_spiral_l_m`] = { name = "stt_prop_ramp_spiral_l_m" },
    [`stt_prop_ramp_spiral_l_s`] = { name = "stt_prop_ramp_spiral_l_s" },
    [`stt_prop_ramp_spiral_l_xxl`] = { name = "stt_prop_ramp_spiral_l_xxl" },
    [`stt_prop_ramp_spiral_m`] = { name = "stt_prop_ramp_spiral_m" },
    [`stt_prop_ramp_spiral_s`] = { name = "stt_prop_ramp_spiral_s" },
    [`stt_prop_ramp_spiral_xxl`] = { name = "stt_prop_ramp_spiral_xxl" },
    [`stt_prop_stunt_track_dwuturn`] = { name = "stt_prop_stunt_track_dwuturn" },
    [`stt_prop_stunt_track_dwslope30`] = { name = "stt_prop_stunt_track_dwslope30" },
    [`stt_prop_stunt_track_start`] = { name = "stt_prop_stunt_track_start" },
    [`stt_prop_stunt_track_hill2`] = { name = "stt_prop_stunt_track_hill2" },
    [`stt_prop_stunt_bblock_huge_01`] = { name = "stt_prop_stunt_bblock_huge_01" },
    [`stt_prop_stunt_bblock_huge_02`] = { name = "stt_prop_stunt_bblock_huge_02" },
    [`stt_prop_stunt_bblock_huge_03`] = { name = "stt_prop_stunt_bblock_huge_03" },
    [`stt_prop_stunt_bblock_huge_04`] = { name = "stt_prop_stunt_bblock_huge_04" },
    [`stt_prop_stunt_bblock_huge_05`] = { name = "stt_prop_stunt_bblock_huge_05" },
    [`stt_prop_stunt_bblock_hump_01`] = { name = "stt_prop_stunt_bblock_hump_01" },
    [`stt_prop_stunt_bblock_hump_02`] = { name = "stt_prop_stunt_bblock_hump_02" },
    [`stt_prop_stunt_bblock_lrg1`] = { name = "stt_prop_stunt_bblock_lrg1" },
    [`stt_prop_stunt_bblock_lrg2`] = { name = "stt_prop_stunt_bblock_lrg2" },
    [`stt_prop_stunt_bblock_lrg3`] = { name = "stt_prop_stunt_bblock_lrg3" },
    [`stt_prop_stunt_bblock_mdm1`] = { name = "stt_prop_stunt_bblock_mdm1" },
    [`stt_prop_stunt_bblock_mdm2`] = { name = "stt_prop_stunt_bblock_mdm2" },
    [`stt_prop_stunt_bblock_mdm3`] = { name = "stt_prop_stunt_bblock_mdm3" },
    [`stt_prop_stunt_bblock_qp`] = { name = "stt_prop_stunt_bblock_qp" },
    [`stt_prop_stunt_bblock_qp2`] = { name = "stt_prop_stunt_bblock_qp2" },
    [`stt_prop_stunt_bblock_qp3`] = { name = "stt_prop_stunt_bblock_qp3" },
    [`prop_beach_fire`] = { name = "prop_beach_fire" },
    [`prop_gas_pump_1a`] = { name = "prop_gas_pump_1a" },
    [`prop_gas_pump_1b`] = { name = "prop_gas_pump_1b" },
    [`prop_gas_pump_1c`] = { name = "prop_gas_pump_1c" },
    [`prop_gas_pump_1d`] = { name = "prop_gas_pump_1d" },
    [`prop_gas_pump_old2`] = { name = "prop_gas_pump_old2" },
    [`prop_gas_pump_old3`] = { name = "prop_gas_pump_old3" },
    [`prop_vintage_pump`] = { name = "prop_vintage_pump" },
    [`apa_mp_h_acc_box_trinket_01`] = { name = "apa_mp_h_acc_box_trinket_01" },
    [`prop_roundbailer02`] = { name = "prop_roundbailer02" },
    [`prop_roundbailer01`] = { name = "prop_roundbailer01" },
    [`prop_container_05a`] = { name = "prop_container_05a" },
    [`stt_prop_stunt_bowling_ball`] = { name = "stt_prop_stunt_bowling_ball" },
    [`apa_mp_h_acc_rugwoolm_03`] = { name = "apa_mp_h_acc_rugwoolm_03" },
    [`prop_container_ld2`] = { name = "prop_container_ld2" },
    [`p_ld_stinger_s`] = { name = "p_ld_stinger_s" },
    [`hei_prop_carrier_cargo_02a`] = { name = "hei_prop_carrier_cargo_02a" },
    [`p_cablecar_s`] = { name = "p_cablecar_s" },
    [`p_ferris_car_01`] = { name = "p_ferris_car_01" },
    [`prop_cj_big_boat`] = { name = "prop_cj_big_boat" },
    [`prop_rock_4_big2`] = { name = "prop_rock_4_big2" },
    [`prop_steps_big_01`] = { name = "prop_steps_big_01" },
    [`v_ilev_lest_bigscreen`] = { name = "v_ilev_lest_bigscreen" },
    [`prop_carcreeper`] = { name = "prop_carcreeper" },
    [`apa_mp_h_bed_double_09`] = { name = "apa_mp_h_bed_double_09" },
    [`apa_mp_h_bed_wide_05`] = { name = "apa_mp_h_bed_wide_05" },
    [`prop_cattlecrush`] = { name = "prop_cattlecrush" },
    [`prop_cs_documents_01`] = { name = "prop_cs_documents_01" },
    [`prop_ferris_car_01_lod1`] = { name = "prop_ferris_car_01_lod1" },
    [`prop_construcionlamp_01`] = { name = "prop_construcionlamp_01" },
    [`prop_fncconstruc_01d`] = { name = "prop_fncconstruc_01d" },
    [`prop_fncconstruc_02a`] = { name = "prop_fncconstruc_02a" },
    [`p_dock_crane_cabl_s`] = { name = "p_dock_crane_cabl_s" },
    [`prop_dock_crane_01`] = { name = "prop_dock_crane_01" },
    [`prop_dock_crane_02_cab`] = { name = "prop_dock_crane_02_cab" },
    [`prop_dock_float_1`] = { name = "prop_dock_float_1" },
    [`prop_dock_crane_lift`] = { name = "prop_dock_crane_lift" },
    [`apa_mp_h_bed_double_08`] = { name = "apa_mp_h_bed_double_08" },
    [`csx_seabed_bldr4_`] = { name = "csx_seabed_bldr4_" },
    [`imp_prop_impexp_sofabed_01a`] = { name = "imp_prop_impexp_sofabed_01a" },
    [`apa_mp_h_yacht_bed_01`] = { name = "apa_mp_h_yacht_bed_01" },
    [`xs_propintxmas_tree_2018`] = { name = "xs_propintxmas_tree_2018" },
    [`xm_prop_x17_xmas_tree_int`] = { name = "xm_prop_x17_xmas_tree_int" },
    [-685641702] = { name = "unknown" },
    [-1230672010] = { name = "unknown" },
    [-1404869155] = { name = "FIB Building" },
    [-759902142] = { name = "prop_fnclink_03a" },
    [`hw1_lod_08_09_16_17_18`] = { name = "hw1_lod_08_09_16_17_18" },
    [`cs4_lod_01_slod3`] = { name = "cs4_lod_01_slod3" },
    [`dt1_21_slod`] = { name = "dt1_21_slod" },
    [`dt1_11_dt1_tower_lod`] = { name = "dt1_11_dt1_tower_lod" },
    [`id2_lod_00_ab_slod2`] = { name = "id2_lod_00_ab_slod2" },
    [`dt1_lod_03_04_05_11`] = { name = "dt1_lod_03_04_05_11" },
    [`kt1_lod_slod4`] = { name = "kt1_lod_slod4" },
    [`ch2_lod3_slod3`] = { name = "ch2_lod3_slod3" },
    [`vb_lod_slod4`] = { name = "vb_lod_slod4" },
    [`prop_ld_toilet_01`] = { name = "prop_ld_toilet_01" }
}

RS.entities_whitelisted_vehicles = { -- You can add here any kind of vehicle you want to whitelist and don't waste time on checks
    [`blista`] = {name = "Blista"},
    [`adder`] = {name = "Adder"}
}
   
RS.entities_blacklisted_vehicles = {
    [`cargoplane`] = {name = "Cargo Plane"},
    [`dump`] = {name = "Dump"},
    [`avenger`] = {name = "Avenger"},
    [`avenger2`] = {name = "Avenger2"},
    [`luxor`] = {name = "Luxor"},
    [`khanjali`] = {name = "Khanjali"},
    [`rhino`] = {name = "Rhino"},
    [`insurgent`] = {name = "Insurgent"},
    [`insurgent3`] = {name = "Insurgent3"},
    [`oppressor`] = {name = "Oprresor"},
    [`oppressor2`] = {name = "Oprresor2"},
    [`maverick`] = {name = "Maverick"},
    [`blimp2`] = {name = "blimp2"},
    [`blimp`] = {name = "blimp"},
    [`blimp3`] = {name = "blimp3"},
    -- [`freight`] = {name = "Freight"},
    -- [`freightcar`] = {name = "FreightCar"},
    [`limo2`] = {name = "Limo2"},
    [`freightcont1`] = {name = "FreightCont1"},
    [`freightcont2`] = {name = "FreightCont2"},
    [`freightgrain`] = {name = "FreightGrain"},
    [`cerberus3`] = {name = "Cerberus3"},
    [`cerberus2`] = {name = "Cerberus2"},
    [`cerberus`] = {name = "Cerberus"},
    [`buzzard`] = {name = "Buzzard"},
    [`phantom2`] = {name = "Phantom2"},
    [`issi6`] = {name = "Issi6"},
    [`issi4`] = {name = "Issi4"}, 
    [`issi5`] = {name = "Issi5"},
    [`savage`] = {name = "Savage"},
    [`hunter`] = {name = "Hunter"},
    [`akula`] = {name = "Akula"},
    [`annihilator`] = {name = "Annihilator"},
    [`cutter`] = {name = "Cutter"},
    [`bulldozer`] = {name = "Bulldozer"},
    [`barracks`] = {name = "Barracks"},
    [`barracks2`] = {name = "Barracks2"},
    [`barracks3`] = {name = "Barracks3"},
    [`barrage`] = {name = "Barrage"},
    [`chernobog`] = {name = "Chernobog"},
    [`crusader`] = {name = "Crusader"},
    [`halftrack`] = {name = "HalfTrack"},
    [`minitank`] = {name = "MiniTank"},
    [`scarab`] = {name = "Scarab"},
    [`scarab2`] = {name = "Scarab2"},
    [`scarab3`] = {name = "Scarab3"},
    [`thruster`] = {name = "Thruster"},
    [`trailersmall2`] = {name = "Trailersmall2"},
    [`brutus3`] = {name = "Brutus3"},
    [`freecrawler`] = {name = "Freecrawler"},
    [`monster`] = {name = "Monster"},
    [`monster3`] = {name = "Monster3"},
    [`monster4`] = {name = "Monster4"},
    [`monster5`] = {name = "Monster5"},
    [`technical`] = {name = "Technical"},
    [`technical3`] = {name = "Technical3"},
    [`technical2`] = {name = "Technical2"},
    [`nightshark`] = {name = "Nightshark"},
    [`zhaba`] = {name = "Zhaba"},
    [`formula`] = {name = "Formula"},
    [`formula2`] = {name = "Formula2"},
    [`scramjet`] = {name = "Scramjet"},
    [`zr380`] = {name = "Zr380"},
    [`zr3802`] = {name = "Zr3802"},
    [`zr3803`] = {name = "Zr3803"},
    [`raptor`] = {name = "Raptor"},
    [`volatol`] = {name = "Volatol"},
    [`voltic2`] = {name = "Voltic2"},
    [`tula`] = {name = "Tula"},
    [`strikeforce`] = {name = "Strikeforce"},
    [`lazer`] = {name = "Lazer"},
    [`valkyrie2`] = {name = "Valkyrie2"},
    [`valkyrie`] = {name = "Valkyrie"},
    [`jet`] = {name = "Jet"},
    [`hydra`] = {name = "Hydra"},
    [`bombushka`] = {name = "Bombushka"},
    [`bruiser3`] = {name = "Bruiser3"},
    [`bruiser2`] = {name = "Bruiser2"},
    [`bruiser`] = {name = "Bruiser"},
    [`caracara`] = {name = "Caracara"},
    [`openwheel1`] = {name = "Openwheel1"},
    [`paragon2`] = {name = "Paragon2"},
    [`formula`] = {name = "Formula"},
    [`formula2`] = {name = "Formula2"},
    [`slamvan4`] = {name = "Slamvan4"},
    [`slamvan5`] = {name = "Slamvan5"},
    [`slamvan6`] = {name = "Slamvan6"},
    [`ruiner2`] = {name = "Ruiner2"},
    [`dukes2`] = {name = "Dukes2"},
    [`dominator4`] = {name = "Dominator4"},
    [`dominator5`] = {name = "Dominator5"},
    [`dominator6`] = {name = "Dominator6"},
    [`handler`] = {name = "Handler"},
    [`vindicator`] = {name = "Vindicator"},
    [`wastelander`] = {name = "Wastelander"},
    [`ardent`] = {name = "Ardent"},
    [`vigilante`] = {name = "Vigilante"},
    [`cargobob`] = {name = "Cargobob"},
}

RS.entities_whitelisted_peds = {
    [`mp_f_freemode_01`] = {name = "Female MP PED"},
    [`mp_m_freemode_01`] = {name = "Male MP PED"}, 
}
   
RS.entities_blacklisted_peds = {
    [`a_m_y_mexthug_01`] = {name = "MexThug"},
    [`a_c_boar`] = {name = "Boar"}, 
    [`a_c_sharkhammer`] = {name = "Sharkhammer"}, 
    [`a_c_chimp`] = {name = "Chimp"}, 
    [`a_c_chop`] = {name = "Chop"}, 
    [`a_c_hen`] = {name = "Hen"}, 
    [`a_c_humpback`] = {name = "Humpback"}, 
    [`a_c_killerwhale`] = {name = "Killerwhale"},
    [`a_c_rhesus`] = {name = "Rhesus"}, 
    [`a_c_sharktiger`] = {name = "SharkTiger"}, 
    [`u_m_y_zombie_01`] = {name = "Zombie"},
    [`a_m_m_acult_01`] = {name = "Acult01"},
    [`u_m_y_juggernaut_01`] = {name = "Juggernaut"},
    [`s_f_y_bartender_01`] = {name = "s_f_y_bartender_01"}, 
    [`a_m_y_beachvesp_01`] = {name = "a_m_y_beachvesp_01"}, 
    [`a_m_y_beach_03`] = {name = "a_m_y_beach_03"}, 
    [`a_m_y_beach_02`] = {name = "a_m_y_beach_02"}, 
    [`a_m_m_beach_02`] = {name = "a_m_m_beach_02"}, 
    [`a_m_y_beach_01`] = {name = "a_m_y_beach_01"}, 
    [`s_m_y_baywatch_01`] = {name = "s_m_y_baywatch_01"}, 
    [`mp_f_boatstaff_01`] = {name = "mp_f_boatstaff_01"}, 
    [`s_m_m_bouncer_01`] = {name = "s_m_m_bouncer_01"}, 
    [`s_m_y_armymech_01`] = {name = "s_m_y_armymech_01"}, 
    [`s_m_y_autopsy_01`] = {name = "s_m_y_autopsy_01"}, 
    [`s_m_y_blackops_01`] = {name = "s_m_y_blackops_01"}, 
    [`s_m_y_blackops_02`] = {name = "s_m_y_blackops_02"}
}