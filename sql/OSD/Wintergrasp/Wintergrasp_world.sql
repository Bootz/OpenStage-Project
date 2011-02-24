
SET NAMES 'utf8';

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781,782,783);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('756', 'Battle begins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва началась'),
('757', '%s has successfully defended the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s успешно защитил(а) крепость!'),
('758', '%s has taken over the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s захватил(а) крепость'),
('759', 'The %s siege workshop has been damaged by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('760', 'The %s siege workshop has been destroyed by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('761', 'The %s tower has been damaged!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s башня повреждена'),
('762', 'The %s tower has been destroyed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s башня уничтожена!'),
('763', 'Wintergrasp fortress is under attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('764', 'Wintergrasp is now under the control of the %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('765', 'Wintergrasp timer set to %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('766', 'Wintergrasp battle started.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('767', 'Wintergrasp battle finished.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('769', 'Wintergrasp outdoorPvP is disabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('770', 'Wintergrasp outdoorPvP is enabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('771', 'You have reached Rank 1: Corporal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы достигли Ранга 1: Капрал'),
('772', 'You have reached Rank 2: First Lieutenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы достигли Ранга 2: Лейтенант'),
('780', 'Before the Battle of  Wintergrasp left 30 minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'До битвы на  Озере Ледяных Оков осталось 30 минут!'),
('781', 'Before the Battle of  Wintergrasp left 10 minutes! Portal from Dalaran will work in 5 minutes.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'До битвы на  Озере Ледяных Оков осталось 10 минут! Портал с Даларана начнет роботу через 5 минут.'),
('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва за Озеро Ледяных Оков Остановлена. Не хватает защитников. Крепость переходит атакующей  стороне.'),
('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Битва за Озеро Ледяных Оков Остановлена. Не хватает нападающих. Крепость остается защитникам.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('wg', '3', 'Syntax: .wg $subcommand.'),
('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.'),
('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.'),
('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.'),
('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).'),
('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.'),
('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

/* WG scriptname */
DELETE FROM `outdoorpvp_template` WHERE TypeId=7;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES 
('7', 'outdoorpvp_wg', 'Wintergrasp');

UPDATE `creature_template` SET `ScriptName` = 'npc_demolisher_engineerer' WHERE `entry` IN (30400,30499);

/* Teleport WG SPELLs*/
DELETE FROM `spell_target_position` WHERE id IN ('59096', '58632', '58633');
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
('59096', '571', '5325.06', '2843.36', '409.285', '3.20278'),
('58632', '571', '5097.79', '2180.29', '365.61', '2.41'),
('58633', '571', '5026.80', '3676.69', '362.58', '3.94');

/* Defender's Portal Activate Proper Spell */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=54640;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/* Temp removed gameobject collision stopping you getting to the relic
* 194323 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 194162 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/* Titan Relic remove - uncomment if this is needed*/
-- DELETE FROM `gameobject` WHERE `id`=192829;

/* Towers */
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 6553632 WHERE `entry` IN (190356,190357,190358);

/*Spirit healer FIX */
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry IN (31841,31842);

/* Creature template */
UPDATE creature_template SET faction_A = '1802', faction_H = '1802' WHERE entry IN (30499,28312,28319);
UPDATE creature_template SET faction_A = '1801', faction_H = '1801' WHERE entry IN (30400,32629,32627);
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry   IN (31841,31842);

/* spell target for build vehicles */
DELETE FROM `conditions` WHERE ConditionValue2=27852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 49899, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56575, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56661, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56663, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56665, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56667, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56669, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 61408, 0, 18, 1, 27852, 0, 0, '', NULL);

/* Workshop */
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (192028,192029,192030,192031,192032,192033);


/* Dampening Spells */

DELETE FROM spell_area WHERE spell IN (74411);
INSERT INTO spell_area VALUES 
-- Eye of The Storm (map 566)
(74411,3820,0,0,0,0,0,2,1), -- Eye of the storm (general)
(74411,3869,0,0,0,0,0,2,1), -- Mage Tower
(74411,3870,0,0,0,0,0,2,1), -- BE Tower
(74411,3871,0,0,0,0,0,2,1), -- Draenei Ruins
(74411,3872,0,0,0,0,0,2,1), -- Fel Reaver Ruins

-- Arathi Basin (map 529)
(74411,3358,0,0,0,0,0,2,1), -- Arathi Basin (general)
(74411,3317,0,0,0,0,0,2,1), -- Trollbane Hall
(74411,3418,0,0,0,0,0,2,1), -- Defilers Den
(74411,3420,0,0,0,0,0,2,1), -- Farm
(74411,3421,0,0,0,0,0,2,1), -- Blacksmith
(74411,3422,0,0,0,0,0,2,1), -- Lumber Mill
(74411,3424,0,0,0,0,0,2,1), -- Stables
(74411,3423,0,0,0,0,0,2,1), -- Gold Mine

-- Warsong Gulch (map 489)
(74411,3277,0,0,0,0,0,2,1), -- Warsong Gulch (general)
(74411,3320,0,0,0,0,0,2,1), -- Warsong Luber Mill
(74411,3321,0,0,0,0,0,2,1), -- Silverwing Hold
(74411,4571,0,0,0,0,0,2,1), -- Silverwing Flag Room
(74411,4572,0,0,0,0,0,2,1), -- Warsong Flag Room

-- Alterac Valley (map 30)
(74411,2597,0,0,0,0,0,2,1), -- Alterac Valley (general)
(74411,2957,0,0,0,0,0,2,1), -- Irondeep Mine
(74411,2958,0,0,0,0,0,2,1), -- Stonehearth Outpost
(74411,2959,0,0,0,0,0,2,1), -- Dun Baldar
(74411,2960,0,0,0,0,0,2,1), -- Icewing Pass
(74411,2961,0,0,0,0,0,2,1), -- Frostwolf Willage
(74411,2962,0,0,0,0,0,2,1), -- Tower Point
(74411,2963,0,0,0,0,0,2,1), -- Coldtooth Mine
(74411,2964,0,0,0,0,0,2,1), -- Winterax Hold
(74411,2977,0,0,0,0,0,2,1), -- Iceblood Garrison
(74411,2978,0,0,0,0,0,2,1), -- Frostwolf Keep
(74411,3017,0,0,0,0,0,2,1), -- Frost Dagger Pass
(74411,3057,0,0,0,0,0,2,1), -- Field of Strife
(74411,3058,0,0,0,0,0,2,1), -- Icewing Cavern
(74411,3297,0,0,0,0,0,2,1), -- Frostwolf Graveyard
(74411,3298,0,0,0,0,0,2,1), -- Frostwolf Pass
(74411,3299,0,0,0,0,0,2,1), -- Dun Baldar Pass
(74411,3300,0,0,0,0,0,2,1), -- Iceblood Graveyard
(74411,3301,0,0,0,0,0,2,1), -- Snowfall Graveyard
(74411,3302,0,0,0,0,0,2,1), -- Stonehearth Graveyard
(74411,3303,0,0,0,0,0,2,1), -- Stormpike Graveyard
(74411,3304,0,0,0,0,0,2,1), -- Icewing Bunker
(74411,3305,0,0,0,0,0,2,1), -- Stonhearth Bunker
(74411,3306,0,0,0,0,0,2,1), -- Wildpaw Ridge
(74411,3318,0,0,0,0,0,2,1), -- Rock of Durotan
(74411,3337,0,0,0,0,0,2,1), -- Wildpaw Cavern
(74411,3338,0,0,0,0,0,2,1), -- The Vieled Cleft
(74411,4407,0,0,0,0,0,2,1), -- Hall of the Frostwolf
(74411,4408,0,0,0,0,0,2,1), -- Hall of the Stormpike

-- Stand of the Ancients (map 607)
(74411,4384,0,0,0,0,0,2,1), -- Strand of the Ancients (general)
(74411,4604,0,0,0,0,0,2,1), -- Gate of the Red Sun
(74411,4605,0,0,0,0,0,2,1), -- Gate of the Blue Sapphire
(74411,4606,0,0,0,0,0,2,1), -- Gate of the Green Emerald
(74411,4607,0,0,0,0,0,2,1), -- Gate of the Purple Amethyst
(74411,4608,0,0,0,0,0,2,1), -- Gate of the Yellow Moon
(74411,4609,0,0,0,0,0,2,1), -- Courtyard of the Ancients
(74411,4610,0,0,0,0,0,2,1), -- Landing Beach

-- Isle of Conquest (map 628)
(74411,4710,0,0,0,0,0,2,1), -- Isle of Conquest (general)
(74411,4741,0,0,0,0,0,2,1), -- Isle of Conquest - No Man's Land
(74411,4747,0,0,0,0,0,2,1), -- Workshop
(74411,4748,0,0,0,0,0,2,1), -- Quarry
(74411,4749,0,0,0,0,0,2,1), -- Docks
(74411,4750,0,0,0,0,0,2,1), -- Hangar
(74411,4751,0,0,0,0,0,2,1), -- Refinery
(74411,4752,0,0,0,0,0,2,1), -- Horde Keep
(74411,4753,0,0,0,0,0,2,1); -- Alliance Keep

DELETE FROM spell_area WHERE spell IN (74410);
INSERT INTO spell_area VALUES 
(74410,4406,0,0,0,0,0,2,1), -- Ring of Valor (map 618)
(74410,3968,0,0,0,0,0,2,1), -- Ruins of Loraeron (map 572)
(74410,3638,0,0,0,0,0,2,1), -- Ring of Trials (map 572)
(74410,3698,0,0,0,0,0,2,1), -- Nagrand Arena (map 559)
(74410,3702,0,0,0,0,0,2,1), -- BEM Arena (map 562)
(74410,4378,0,0,0,0,0,2,1); -- Dalaran Arena (map 617)

DELETE FROM `spell_area` WHERE `spell` IN (72293,73001);
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES
(72293,4812,0,0,0,0,0,2,0), -- Mark of the Fallen Champion
(73001,4892,0,0,0,0,0,2,0); -- Shadow Prison

/*WG Spell area Data */
/*For wg antifly */
DELETE FROM `spell_area` WHERE spell IN (58730, 57940, 58045);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(58730, 4197, 0, 0, 0, 0, 0, 2, 1),
(58730, 4584, 0, 0, 0, 0, 0, 2, 1),
(58730, 4581, 0, 0, 0, 0, 0, 2, 1),
(58730, 4585, 0, 0, 0, 0, 0, 2, 1),
(58730, 4612, 0, 0, 0, 0, 0, 2, 1),
(58730, 4582, 0, 0, 0, 0, 0, 2, 1),
(58730, 4611, 0, 0, 0, 0, 0, 2, 1),
(58730, 4578, 0, 0, 0, 0, 0, 2, 1),
(58730, 4576, 0, 0, 0, 0, 0, 2, 1),
(58730, 4538, 0, 0, 0, 0, 0, 2, 1),
(57940, 65, 0, 0, 0, 0, 0, 2, 1),
(57940, 66, 0, 0, 0, 0, 0, 2, 1),
(57940, 67, 0, 0, 0, 0, 0, 2, 1),
(57940, 206, 0, 0, 0, 0, 0, 2, 1),
(57940, 210, 0, 0, 0, 0, 0, 2, 1),
(57940, 394, 0, 0, 0, 0, 0, 2, 1),
(57940, 395, 0, 0, 0, 0, 0, 2, 1),
(57940, 1196, 0, 0, 0, 0, 0, 2, 1),
(57940, 2817, 0, 0, 0, 0, 0, 2, 1),
(57940, 3456, 0, 0, 0, 0, 0, 2, 1),
(57940, 3477, 0, 0, 0, 0, 0, 2, 1),
(57940, 3537, 0, 0, 0, 0, 0, 2, 1),
(57940, 3711, 0, 0, 0, 0, 0, 2, 1),
(57940, 4100, 0, 0, 0, 0, 0, 2, 1),
(57940, 4196, 0, 0, 0, 0, 0, 2, 1),
(57940, 4228, 0, 0, 0, 0, 0, 2, 1),
(57940, 4264, 0, 0, 0, 0, 0, 2, 1),
(57940, 4265, 0, 0, 0, 0, 0, 2, 1),
(57940, 4272, 0, 0, 0, 0, 0, 2, 1),
(57940, 4273, 0, 0, 0, 0, 0, 2, 1),
(57940, 4395, 0, 0, 0, 0, 0, 2, 1),
(57940, 4415, 0, 0, 0, 0, 0, 2, 1),
(57940, 4416, 0, 0, 0, 0, 0, 2, 1),
(57940, 4493, 0, 0, 0, 0, 0, 2, 1),
(57940, 4494, 0, 0, 0, 0, 0, 2, 1),
(57940, 4603, 0, 0, 0, 0, 0, 2, 1),
(58045, 4197, 0, 0, 0, 0, 0, 2, 1);

/* Portal Dalaran->WG */
DELETE FROM `gameobject` WHERE `id`=193772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
('', 193772, 571, 1, 65535, 5924.11, 573.387, 661.087, 4.43208, 0, 0, 0.798953, -0.601393, 300, 0, 1),
('', 193772, 571, 1, 65535, 5686.57, 772.921, 647.754, 5.62225, 0, 0, 0.324484, -0.945891, 600, 0, 1),
('', 193772, 571, 1, 65535, 5930.82, 548.961, 640.632, 1.88506, 0, 0, 0.809047, 0.587744, 300, 0, 1);


/* Wintergrasp Battle-Mage */
DELETE FROM `creature` WHERE `id`=32170;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
('', 32170, 571, 1, 65535, 27801, 0, 5925.34, 573.71, 661.087, 4.06662, 300, 0, 0, 504000, 440700, 0, 0, 0, 0, 0),
('', 32170, 571, 1, 64, 0, 918, 5932.96, 549.906, 641.595, 2.09189, 300, 0, 0, 504000, 440700, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ScriptName`='npc_wg_ally_battle_mage' WHERE `entry`=32169;
UPDATE `creature_template` SET `ScriptName`='npc_wg_horde_battle_mage' WHERE `entry`=32170;
DELETE FROM `spell_target_position` WHERE id IN (58633, 58632, 59096);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES 
(58632, 571, 5095.104980, 2170.985840, 365.603210, 2.367906),
(58633, 571, 5025.775879, 3673.123779, 362.671295, 4.197887),
(59096, 571, 5324.776367, 2841.025391, 406.280334, 3.143867);

