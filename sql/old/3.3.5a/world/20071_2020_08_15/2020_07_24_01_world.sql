--
-- Drop previous functions/views if any
DROP FUNCTION IF EXISTS `fn_smart_scripts_event_type`;
DROP FUNCTION IF EXISTS `fn_smart_scripts_action_type`;
DROP FUNCTION IF EXISTS `fn_smart_scripts_target_type`;
DROP VIEW IF EXISTS `vw_smart_scripts_with_labels`;

-- Create the view
CREATE SQL SECURITY INVOKER VIEW `vw_smart_scripts_with_labels` AS
(SELECT `entryorguid`,
    `source_type`,
    `id`,
    `link`,
    (
        CASE
            WHEN `event_type` = 0 THEN 'SMART_EVENT_UPDATE_IC'
            WHEN `event_type` = 1 THEN 'SMART_EVENT_UPDATE_OOC'
            WHEN `event_type` = 2 THEN 'SMART_EVENT_HEALTH_PCT'
            WHEN `event_type` = 3 THEN 'SMART_EVENT_MANA_PCT'
            WHEN `event_type` = 4 THEN 'SMART_EVENT_AGGRO'
            WHEN `event_type` = 5 THEN 'SMART_EVENT_KILL'
            WHEN `event_type` = 6 THEN 'SMART_EVENT_DEATH'
            WHEN `event_type` = 7 THEN 'SMART_EVENT_EVADE'
            WHEN `event_type` = 8 THEN 'SMART_EVENT_SPELLHIT'
            WHEN `event_type` = 9 THEN 'SMART_EVENT_RANGE'
            WHEN `event_type` = 10 THEN 'SMART_EVENT_OOC_LOS'
            WHEN `event_type` = 11 THEN 'SMART_EVENT_RESPAWN'
            WHEN `event_type` = 12 THEN 'SMART_EVENT_TARGET_HEALTH_PCT'
            WHEN `event_type` = 13 THEN 'SMART_EVENT_VICTIM_CASTING'
            WHEN `event_type` = 14 THEN 'SMART_EVENT_FRIENDLY_HEALTH'
            WHEN `event_type` = 15 THEN 'SMART_EVENT_FRIENDLY_IS_CC'
            WHEN `event_type` = 16 THEN 'SMART_EVENT_FRIENDLY_MISSING_BUFF'
            WHEN `event_type` = 17 THEN 'SMART_EVENT_SUMMONED_UNIT'
            WHEN `event_type` = 18 THEN 'SMART_EVENT_TARGET_MANA_PCT'
            WHEN `event_type` = 19 THEN 'SMART_EVENT_ACCEPTED_QUEST'
            WHEN `event_type` = 20 THEN 'SMART_EVENT_REWARD_QUEST'
            WHEN `event_type` = 21 THEN 'SMART_EVENT_REACHED_HOME'
            WHEN `event_type` = 22 THEN 'SMART_EVENT_RECEIVE_EMOTE'
            WHEN `event_type` = 23 THEN 'SMART_EVENT_HAS_AURA'
            WHEN `event_type` = 24 THEN 'SMART_EVENT_TARGET_BUFFED'
            WHEN `event_type` = 25 THEN 'SMART_EVENT_RESET'
            WHEN `event_type` = 26 THEN 'SMART_EVENT_IC_LOS'
            WHEN `event_type` = 27 THEN 'SMART_EVENT_PASSENGER_BOARDED'
            WHEN `event_type` = 28 THEN 'SMART_EVENT_PASSENGER_REMOVED'
            WHEN `event_type` = 29 THEN 'SMART_EVENT_CHARMED'
            WHEN `event_type` = 30 THEN 'SMART_EVENT_CHARMED_TARGET'
            WHEN `event_type` = 31 THEN 'SMART_EVENT_SPELLHIT_TARGET'
            WHEN `event_type` = 32 THEN 'SMART_EVENT_DAMAGED'
            WHEN `event_type` = 33 THEN 'SMART_EVENT_DAMAGED_TARGET'
            WHEN `event_type` = 34 THEN 'SMART_EVENT_MOVEMENTINFORM'
            WHEN `event_type` = 35 THEN 'SMART_EVENT_SUMMON_DESPAWNED'
            WHEN `event_type` = 36 THEN 'SMART_EVENT_CORPSE_REMOVED'
            WHEN `event_type` = 37 THEN 'SMART_EVENT_AI_INIT'
            WHEN `event_type` = 38 THEN 'SMART_EVENT_DATA_SET'
            WHEN `event_type` = 39 THEN 'SMART_EVENT_WAYPOINT_START'
            WHEN `event_type` = 40 THEN 'SMART_EVENT_WAYPOINT_REACHED'
            WHEN `event_type` = 41 THEN 'SMART_EVENT_TRANSPORT_ADDPLAYER'
            WHEN `event_type` = 42 THEN 'SMART_EVENT_TRANSPORT_ADDCREATURE'
            WHEN `event_type` = 43 THEN 'SMART_EVENT_TRANSPORT_REMOVE_PLAYER'
            WHEN `event_type` = 44 THEN 'SMART_EVENT_TRANSPORT_RELOCATE'
            WHEN `event_type` = 45 THEN 'SMART_EVENT_INSTANCE_PLAYER_ENTER'
            WHEN `event_type` = 46 THEN 'SMART_EVENT_AREATRIGGER_ONTRIGGER'
            WHEN `event_type` = 47 THEN 'SMART_EVENT_QUEST_ACCEPTED'
            WHEN `event_type` = 48 THEN 'SMART_EVENT_QUEST_OBJ_COPLETETION'
            WHEN `event_type` = 49 THEN 'SMART_EVENT_QUEST_COMPLETION'
            WHEN `event_type` = 50 THEN 'SMART_EVENT_QUEST_REWARDED'
            WHEN `event_type` = 51 THEN 'SMART_EVENT_QUEST_FAIL'
            WHEN `event_type` = 52 THEN 'SMART_EVENT_TEXT_OVER'
            WHEN `event_type` = 53 THEN 'SMART_EVENT_RECEIVE_HEAL'
            WHEN `event_type` = 54 THEN 'SMART_EVENT_JUST_SUMMONED'
            WHEN `event_type` = 55 THEN 'SMART_EVENT_WAYPOINT_PAUSED'
            WHEN `event_type` = 56 THEN 'SMART_EVENT_WAYPOINT_RESUMED'
            WHEN `event_type` = 57 THEN 'SMART_EVENT_WAYPOINT_STOPPED'
            WHEN `event_type` = 58 THEN 'SMART_EVENT_WAYPOINT_ENDED'
            WHEN `event_type` = 59 THEN 'SMART_EVENT_TIMED_EVENT_TRIGGERED'
            WHEN `event_type` = 60 THEN 'SMART_EVENT_UPDATE'
            WHEN `event_type` = 61 THEN 'SMART_EVENT_LINK'
            WHEN `event_type` = 62 THEN 'SMART_EVENT_GOSSIP_SELECT'
            WHEN `event_type` = 63 THEN 'SMART_EVENT_JUST_CREATED'
            WHEN `event_type` = 64 THEN 'SMART_EVENT_GOSSIP_HELLO'
            WHEN `event_type` = 65 THEN 'SMART_EVENT_FOLLOW_COMPLETED'
            WHEN `event_type` = 66 THEN 'SMART_EVENT_EVENT_PHASE_CHANGE'
            WHEN `event_type` = 67 THEN 'SMART_EVENT_IS_BEHIND_TARGET'
            WHEN `event_type` = 68 THEN 'SMART_EVENT_GAME_EVENT_START'
            WHEN `event_type` = 69 THEN 'SMART_EVENT_GAME_EVENT_END'
            WHEN `event_type` = 70 THEN 'SMART_EVENT_GO_LOOT_STATE_CHANGED'
            WHEN `event_type` = 71 THEN 'SMART_EVENT_GO_EVENT_INFORM'
            WHEN `event_type` = 72 THEN 'SMART_EVENT_ACTION_DONE'
            WHEN `event_type` = 73 THEN 'SMART_EVENT_ON_SPELLCLICK'
            WHEN `event_type` = 74 THEN 'SMART_EVENT_FRIENDLY_HEALTH_PCT'
            WHEN `event_type` = 75 THEN 'SMART_EVENT_DISTANCE_CREATURE'
            WHEN `event_type` = 76 THEN 'SMART_EVENT_DISTANCE_GAMEOBJECT'
            WHEN `event_type` = 77 THEN 'SMART_EVENT_COUNTER_SET'
            WHEN `event_type` = 78 THEN 'SMART_EVENT_SCENE_START'
            WHEN `event_type` = 79 THEN 'SMART_EVENT_SCENE_TRIGGER'
            WHEN `event_type` = 80 THEN 'SMART_EVENT_SCENE_CANCEL'
            WHEN `event_type` = 81 THEN 'SMART_EVENT_SCENE_COMPLETE'
            WHEN `event_type` = 82 THEN 'SMART_EVENT_SUMMONED_UNIT_DIES'
            ELSE `event_type`
        END
    ) AS `event_type`,
    `event_phase_mask`,
    `event_chance`,
    `event_flags`,
    `event_param1`,
    `event_param2`,
    `event_param3`,
    `event_param4`,
    `event_param5`,
    (
        CASE
            WHEN `action_type` = 0 THEN 'SMART_ACTION_NONE'
            WHEN `action_type` = 1 THEN 'SMART_ACTION_TALK'
            WHEN `action_type` = 2 THEN 'SMART_ACTION_SET_FACTION'
            WHEN `action_type` = 3 THEN 'SMART_ACTION_MORPH_TO_ENTRY_OR_MODEL'
            WHEN `action_type` = 4 THEN 'SMART_ACTION_SOUND'
            WHEN `action_type` = 5 THEN 'SMART_ACTION_PLAY_EMOTE'
            WHEN `action_type` = 6 THEN 'SMART_ACTION_FAIL_QUEST'
            WHEN `action_type` = 7 THEN 'SMART_ACTION_OFFER_QUEST'
            WHEN `action_type` = 8 THEN 'SMART_ACTION_SET_REACT_STATE'
            WHEN `action_type` = 9 THEN 'SMART_ACTION_ACTIVATE_GOBJECT'
            WHEN `action_type` = 10 THEN 'SMART_ACTION_RANDOM_EMOTE'
            WHEN `action_type` = 11 THEN 'SMART_ACTION_CAST'
            WHEN `action_type` = 12 THEN 'SMART_ACTION_SUMMON_CREATURE'
            WHEN `action_type` = 13 THEN 'SMART_ACTION_THREAT_SINGLE_PCT'
            WHEN `action_type` = 14 THEN 'SMART_ACTION_THREAT_ALL_PCT'
            WHEN `action_type` = 15 THEN 'SMART_ACTION_CALL_AREAEXPLOREDOREVENTHAPPENS'
            WHEN `action_type` = 16 THEN 'SMART_ACTION_RESERVED_16'
            WHEN `action_type` = 17 THEN 'SMART_ACTION_SET_EMOTE_STATE'
            WHEN `action_type` = 18 THEN 'SMART_ACTION_SET_UNIT_FLAG'
            WHEN `action_type` = 19 THEN 'SMART_ACTION_REMOVE_UNIT_FLAG'
            WHEN `action_type` = 20 THEN 'SMART_ACTION_AUTO_ATTACK'
            WHEN `action_type` = 21 THEN 'SMART_ACTION_ALLOW_COMBAT_MOVEMENT'
            WHEN `action_type` = 22 THEN 'SMART_ACTION_SET_EVENT_PHASE'
            WHEN `action_type` = 23 THEN 'SMART_ACTION_INC_EVENT_PHASE'
            WHEN `action_type` = 24 THEN 'SMART_ACTION_EVADE'
            WHEN `action_type` = 25 THEN 'SMART_ACTION_FLEE_FOR_ASSIST'
            WHEN `action_type` = 26 THEN 'SMART_ACTION_CALL_GROUPEVENTHAPPENS'
            WHEN `action_type` = 27 THEN 'SMART_ACTION_COMBAT_STOP'
            WHEN `action_type` = 28 THEN 'SMART_ACTION_REMOVEAURASFROMSPELL'
            WHEN `action_type` = 29 THEN 'SMART_ACTION_FOLLOW'
            WHEN `action_type` = 30 THEN 'SMART_ACTION_RANDOM_PHASE'
            WHEN `action_type` = 31 THEN 'SMART_ACTION_RANDOM_PHASE_RANGE'
            WHEN `action_type` = 32 THEN 'SMART_ACTION_RESET_GOBJECT'
            WHEN `action_type` = 33 THEN 'SMART_ACTION_CALL_KILLEDMONSTER'
            WHEN `action_type` = 34 THEN 'SMART_ACTION_SET_INST_DATA'
            WHEN `action_type` = 35 THEN 'SMART_ACTION_SET_INST_DATA64'
            WHEN `action_type` = 36 THEN 'SMART_ACTION_UPDATE_TEMPLATE'
            WHEN `action_type` = 37 THEN 'SMART_ACTION_DIE'
            WHEN `action_type` = 38 THEN 'SMART_ACTION_SET_IN_COMBAT_WITH_ZONE'
            WHEN `action_type` = 39 THEN 'SMART_ACTION_CALL_FOR_HELP'
            WHEN `action_type` = 40 THEN 'SMART_ACTION_SET_SHEATH'
            WHEN `action_type` = 41 THEN 'SMART_ACTION_FORCE_DESPAWN'
            WHEN `action_type` = 42 THEN 'SMART_ACTION_SET_INVINCIBILITY_HP_LEVEL'
            WHEN `action_type` = 43 THEN 'SMART_ACTION_MOUNT_TO_ENTRY_OR_MODEL'
            WHEN `action_type` = 44 THEN 'SMART_ACTION_SET_INGAME_PHASE_MASK'
            WHEN `action_type` = 45 THEN 'SMART_ACTION_SET_DATA'
            WHEN `action_type` = 46 THEN 'SMART_ACTION_ATTACK_STOP'
            WHEN `action_type` = 47 THEN 'SMART_ACTION_SET_VISIBILITY'
            WHEN `action_type` = 48 THEN 'SMART_ACTION_SET_ACTIVE'
            WHEN `action_type` = 49 THEN 'SMART_ACTION_ATTACK_START'
            WHEN `action_type` = 50 THEN 'SMART_ACTION_SUMMON_GO'
            WHEN `action_type` = 51 THEN 'SMART_ACTION_KILL_UNIT'
            WHEN `action_type` = 52 THEN 'SMART_ACTION_ACTIVATE_TAXI'
            WHEN `action_type` = 53 THEN 'SMART_ACTION_WP_START'
            WHEN `action_type` = 54 THEN 'SMART_ACTION_WP_PAUSE'
            WHEN `action_type` = 55 THEN 'SMART_ACTION_WP_STOP'
            WHEN `action_type` = 56 THEN 'SMART_ACTION_ADD_ITEM'
            WHEN `action_type` = 57 THEN 'SMART_ACTION_REMOVE_ITEM'
            WHEN `action_type` = 58 THEN 'SMART_ACTION_INSTALL_AI_TEMPLATE'
            WHEN `action_type` = 59 THEN 'SMART_ACTION_SET_RUN'
            WHEN `action_type` = 60 THEN 'SMART_ACTION_SET_DISABLE_GRAVITY'
            WHEN `action_type` = 61 THEN 'SMART_ACTION_SET_SWIM'
            WHEN `action_type` = 62 THEN 'SMART_ACTION_TELEPORT'
            WHEN `action_type` = 63 THEN 'SMART_ACTION_SET_COUNTER'
            WHEN `action_type` = 64 THEN 'SMART_ACTION_STORE_TARGET_LIST'
            WHEN `action_type` = 65 THEN 'SMART_ACTION_WP_RESUME'
            WHEN `action_type` = 66 THEN 'SMART_ACTION_SET_ORIENTATION'
            WHEN `action_type` = 67 THEN 'SMART_ACTION_CREATE_TIMED_EVENT'
            WHEN `action_type` = 68 THEN 'SMART_ACTION_PLAYMOVIE'
            WHEN `action_type` = 69 THEN 'SMART_ACTION_MOVE_TO_POS'
            WHEN `action_type` = 70 THEN 'SMART_ACTION_ENABLE_TEMP_GOBJ'
            WHEN `action_type` = 71 THEN 'SMART_ACTION_EQUIP'
            WHEN `action_type` = 72 THEN 'SMART_ACTION_CLOSE_GOSSIP'
            WHEN `action_type` = 73 THEN 'SMART_ACTION_TRIGGER_TIMED_EVENT'
            WHEN `action_type` = 74 THEN 'SMART_ACTION_REMOVE_TIMED_EVENT'
            WHEN `action_type` = 75 THEN 'SMART_ACTION_ADD_AURA'
            WHEN `action_type` = 76 THEN 'SMART_ACTION_OVERRIDE_SCRIPT_BASE_OBJECT'
            WHEN `action_type` = 77 THEN 'SMART_ACTION_RESET_SCRIPT_BASE_OBJECT'
            WHEN `action_type` = 78 THEN 'SMART_ACTION_CALL_SCRIPT_RESET'
            WHEN `action_type` = 79 THEN 'SMART_ACTION_SET_RANGED_MOVEMENT'
            WHEN `action_type` = 80 THEN 'SMART_ACTION_CALL_TIMED_ACTIONLIST'
            WHEN `action_type` = 81 THEN 'SMART_ACTION_SET_NPC_FLAG'
            WHEN `action_type` = 82 THEN 'SMART_ACTION_ADD_NPC_FLAG'
            WHEN `action_type` = 83 THEN 'SMART_ACTION_REMOVE_NPC_FLAG'
            WHEN `action_type` = 84 THEN 'SMART_ACTION_SIMPLE_TALK'
            WHEN `action_type` = 85 THEN 'SMART_ACTION_SELF_CAST'
            WHEN `action_type` = 86 THEN 'SMART_ACTION_CROSS_CAST'
            WHEN `action_type` = 87 THEN 'SMART_ACTION_CALL_RANDOM_TIMED_ACTIONLIST'
            WHEN `action_type` = 88 THEN 'SMART_ACTION_CALL_RANDOM_RANGE_TIMED_ACTIONLIST'
            WHEN `action_type` = 89 THEN 'SMART_ACTION_RANDOM_MOVE'
            WHEN `action_type` = 90 THEN 'SMART_ACTION_SET_UNIT_FIELD_BYTES_1'
            WHEN `action_type` = 91 THEN 'SMART_ACTION_REMOVE_UNIT_FIELD_BYTES_1'
            WHEN `action_type` = 92 THEN 'SMART_ACTION_INTERRUPT_SPELL'
            WHEN `action_type` = 93 THEN 'SMART_ACTION_SEND_GO_CUSTOM_ANIM'
            WHEN `action_type` = 94 THEN 'SMART_ACTION_SET_DYNAMIC_FLAG'
            WHEN `action_type` = 95 THEN 'SMART_ACTION_ADD_DYNAMIC_FLAG'
            WHEN `action_type` = 96 THEN 'SMART_ACTION_REMOVE_DYNAMIC_FLAG'
            WHEN `action_type` = 97 THEN 'SMART_ACTION_JUMP_TO_POS'
            WHEN `action_type` = 98 THEN 'SMART_ACTION_SEND_GOSSIP_MENU'
            WHEN `action_type` = 99 THEN 'SMART_ACTION_GO_SET_LOOT_STATE'
            WHEN `action_type` = 100 THEN 'SMART_ACTION_SEND_TARGET_TO_TARGET'
            WHEN `action_type` = 101 THEN 'SMART_ACTION_SET_HOME_POS'
            WHEN `action_type` = 102 THEN 'SMART_ACTION_SET_HEALTH_REGEN'
            WHEN `action_type` = 103 THEN 'SMART_ACTION_SET_ROOT'
            WHEN `action_type` = 104 THEN 'SMART_ACTION_SET_GO_FLAG'
            WHEN `action_type` = 105 THEN 'SMART_ACTION_ADD_GO_FLAG'
            WHEN `action_type` = 106 THEN 'SMART_ACTION_REMOVE_GO_FLAG'
            WHEN `action_type` = 107 THEN 'SMART_ACTION_SUMMON_CREATURE_GROUP'
            WHEN `action_type` = 108 THEN 'SMART_ACTION_SET_POWER'
            WHEN `action_type` = 109 THEN 'SMART_ACTION_ADD_POWER'
            WHEN `action_type` = 110 THEN 'SMART_ACTION_REMOVE_POWER'
            WHEN `action_type` = 111 THEN 'SMART_ACTION_GAME_EVENT_STOP'
            WHEN `action_type` = 112 THEN 'SMART_ACTION_GAME_EVENT_START'
            WHEN `action_type` = 113 THEN 'SMART_ACTION_START_CLOSEST_WAYPOINT'
            WHEN `action_type` = 114 THEN 'SMART_ACTION_MOVE_OFFSET'
            WHEN `action_type` = 115 THEN 'SMART_ACTION_RANDOM_SOUND'
            WHEN `action_type` = 116 THEN 'SMART_ACTION_SET_CORPSE_DELAY'
            WHEN `action_type` = 117 THEN 'SMART_ACTION_DISABLE_EVADE'
            WHEN `action_type` = 118 THEN 'SMART_ACTION_GO_SET_GO_STATE'
            WHEN `action_type` = 119 THEN 'SMART_ACTION_SET_CAN_FLY'
            WHEN `action_type` = 120 THEN 'SMART_ACTION_REMOVE_AURAS_BY_TYPE'
            WHEN `action_type` = 121 THEN 'SMART_ACTION_SET_SIGHT_DIST'
            WHEN `action_type` = 122 THEN 'SMART_ACTION_FLEE'
            WHEN `action_type` = 123 THEN 'SMART_ACTION_ADD_THREAT'
            WHEN `action_type` = 124 THEN 'SMART_ACTION_LOAD_EQUIPMENT'
            WHEN `action_type` = 125 THEN 'SMART_ACTION_TRIGGER_RANDOM_TIMED_EVENT'
            WHEN `action_type` = 126 THEN 'SMART_ACTION_REMOVE_ALL_GAMEOBJECTS'
            WHEN `action_type` = 127 THEN 'SMART_ACTION_PAUSE_MOVEMENT'
            WHEN `action_type` = 128 THEN 'SMART_ACTION_PLAY_ANIMKIT'
            WHEN `action_type` = 129 THEN 'SMART_ACTION_SCENE_PLAY'
            WHEN `action_type` = 130 THEN 'SMART_ACTION_SCENE_CANCEL'
            WHEN `action_type` = 131 THEN 'SMART_ACTION_SPAWN_SPAWNGROUP'
            WHEN `action_type` = 132 THEN 'SMART_ACTION_DESPAWN_SPAWNGROUP'
            WHEN `action_type` = 133 THEN 'SMART_ACTION_RESPAWN_BY_SPAWNID'
            WHEN `action_type` = 134 THEN 'SMART_ACTION_INVOKER_CAST'
            WHEN `action_type` = 135 THEN 'SMART_ACTION_PLAY_CINEMATIC'
            WHEN `action_type` = 136 THEN 'SMART_ACTION_SET_MOVEMENT_SPEED'
            WHEN `action_type` = 137 THEN 'SMART_ACTION_PLAY_SPELL_VISUAL_KIT'
            WHEN `action_type` = 138 THEN 'SMART_ACTION_OVERRIDE_LIGHT'
            WHEN `action_type` = 139 THEN 'SMART_ACTION_OVERRIDE_WEATHER'
            ELSE `action_type`
        END
    )AS `action_type`,
    `action_param1`,
    `action_param2`,
    `action_param3`,
    `action_param4`,
    `action_param5`,
    `action_param6`,
    (
        CASE
            WHEN `target_type` = 0 THEN 'SMART_TARGET_NONE'
            WHEN `target_type` = 1 THEN 'SMART_TARGET_SELF'
            WHEN `target_type` = 2 THEN 'SMART_TARGET_VICTIM'
            WHEN `target_type` = 3 THEN 'SMART_TARGET_HOSTILE_SECOND_AGGRO'
            WHEN `target_type` = 4 THEN 'SMART_TARGET_HOSTILE_LAST_AGGRO'
            WHEN `target_type` = 5 THEN 'SMART_TARGET_HOSTILE_RANDOM'
            WHEN `target_type` = 6 THEN 'SMART_TARGET_HOSTILE_RANDOM_NOT_TOP'
            WHEN `target_type` = 7 THEN 'SMART_TARGET_ACTION_INVOKER'
            WHEN `target_type` = 8 THEN 'SMART_TARGET_POSITION'
            WHEN `target_type` = 9 THEN 'SMART_TARGET_CREATURE_RANGE'
            WHEN `target_type` = 10 THEN 'SMART_TARGET_CREATURE_GUID'
            WHEN `target_type` = 11 THEN 'SMART_TARGET_CREATURE_DISTANCE'
            WHEN `target_type` = 12 THEN 'SMART_TARGET_STORED'
            WHEN `target_type` = 13 THEN 'SMART_TARGET_GAMEOBJECT_RANGE'
            WHEN `target_type` = 14 THEN 'SMART_TARGET_GAMEOBJECT_GUID'
            WHEN `target_type` = 15 THEN 'SMART_TARGET_GAMEOBJECT_DISTANCE'
            WHEN `target_type` = 16 THEN 'SMART_TARGET_INVOKER_PARTY'
            WHEN `target_type` = 17 THEN 'SMART_TARGET_PLAYER_RANGE'
            WHEN `target_type` = 18 THEN 'SMART_TARGET_PLAYER_DISTANCE'
            WHEN `target_type` = 19 THEN 'SMART_TARGET_CLOSEST_CREATURE'
            WHEN `target_type` = 20 THEN 'SMART_TARGET_CLOSEST_GAMEOBJECT'
            WHEN `target_type` = 21 THEN 'SMART_TARGET_CLOSEST_PLAYER'
            WHEN `target_type` = 22 THEN 'SMART_TARGET_ACTION_INVOKER_VEHICLE'
            WHEN `target_type` = 23 THEN 'SMART_TARGET_OWNER_OR_SUMMONER'
            WHEN `target_type` = 24 THEN 'SMART_TARGET_THREAT_LIST'
            WHEN `target_type` = 25 THEN 'SMART_TARGET_CLOSEST_ENEMY'
            WHEN `target_type` = 26 THEN 'SMART_TARGET_CLOSEST_FRIENDLY'
            WHEN `target_type` = 27 THEN 'SMART_TARGET_LOOT_RECIPIENTS'
            WHEN `target_type` = 28 THEN 'SMART_TARGET_FARTHEST'
            WHEN `target_type` = 29 THEN 'SMART_TARGET_VEHICLE_PASSENGER'
            WHEN `target_type` = 30 THEN 'SMART_TARGET_CLOSEST_UNSPAWNED_GAMEOBJECT'
            ELSE target_type
        END
    )
    AS `target_type`,
    `target_param1`,
    `target_param2`,
    `target_param3`,
    `target_param4`,
    `target_x`,
    `target_y`,
    `target_z`,
    `target_o`,
    `comment`
 FROM smart_scripts);
