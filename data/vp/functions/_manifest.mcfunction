# This file serves as a manifest of all scoreboards and functions created at runtime.
# The language server uses this to prevent false "undeclared" warnings for dynamically created items.

# Runtime scoreboards (created by reload_config.mcfunction or at runtime)
# These should be added to reload_config.mcfunction scoreboard objectives

# Standard scoreboards from reload_config
scoreboard objectives add vp dummy
scoreboard objectives add permissions dummy
scoreboard objectives add perms dummy
scoreboard objectives add permsA dummy
scoreboard objectives add rank dummy
scoreboard objectives add vp_cmd dummy
scoreboard objectives add vp_arg1 dummy
scoreboard objectives add vp_arg2 dummy
scoreboard objectives add vp_loop dummy
scoreboard objectives add vp_len dummy
scoreboard objectives add vp_op dummy
scoreboard objectives add vp_match dummy
scoreboard objectives add vp_tmp dummy
scoreboard objectives add vp_found dummy
scoreboard objectives add vp_found_index dummy
scoreboard objectives add vp_callback dummy
scoreboard objectives add vp_rebuild_loop dummy
scoreboard objectives add vp_perm_remove_loop dummy
scoreboard objectives add vp_perm_check_loop dummy
scoreboard objectives add vp_AllowExecute dummy
scoreboard objectives add vp_AllowExecuteForOthers dummy
scoreboard objectives add vp_AllowSelectors dummy
scoreboard objectives add vp_AllowFunctionCall dummy
scoreboard objectives add vp_AllowTriggerUse dummy
scoreboard objectives add vp_ChatRank dummy
scoreboard objectives add vp_TabRank dummy
scoreboard objectives add vp_PlayerRank dummy
scoreboard objectives add vp_DebugMode dummy
scoreboard objectives add vp_MaintenanceMode dummy
scoreboard objectives add vp.flag_result dummy
scoreboard objectives add vp.player_id dummy
scoreboard objectives add vp.is_op dummy
