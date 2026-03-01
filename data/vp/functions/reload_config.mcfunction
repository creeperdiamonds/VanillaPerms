# reload_config.mcfunction
# Reset datapack internal state.  Called by `/trigger vp set 5` or on
# initial load.  This creates required scoreboard objectives, clears
# player/group arrays and reapplies defaults from config.json.

# --- ensure scoreboard objectives exist ---
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
scoreboard objectives add vp_flag_AllowFlight dummy
scoreboard objectives add vp_flag_InstantBreak dummy
scoreboard objectives add vp_flag_IsInvulnerable dummy
scoreboard objectives add vp_flag_NoHunger dummy
scoreboard objectives add vp_flag_KeepInventory dummy
scoreboard objectives add vp_flag_NoFallDamage dummy
scoreboard objectives add vp_flag_AllowExecuteForOthers dummy
scoreboard objectives add vp_flag_ChatRank dummy
scoreboard objectives add vp_flag_TabRank dummy
scoreboard objectives add vp_flag_HideChat dummy
scoreboard objectives add vp_flag_HideTab dummy
scoreboard objectives add vp_flag_HidePlayer dummy
scoreboard objectives add vp_flag_LogCommandUse dummy
scoreboard objectives add vp_flag_MaxCommandTargets dummy
scoreboard objectives add vp_match dummy
scoreboard objectives add vp_tmp dummy
scoreboard objectives add vp_found dummy
scoreboard objectives add vp_found_index dummy
scoreboard objectives add vp_callback dummy
scoreboard objectives add vp_rebuild_loop dummy
scoreboard objectives add vp_has_permission dummy
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

# clear groups and players; start fresh arrays
data remove storage vp:groups groups
data merge storage vp:groups {groups:[]}

data remove storage vp:players players
data merge storage vp:players {players:[]}

# wipe temporary argument storage
data modify storage vp:temp arg set value ""

# ensure config storage exists (loaded from config.json automatically by
# datapack system, but we can double‑check or apply any patch logic here)
# (nothing to do; config.json is authoritatively edited by the pack)

# reassign operators based on current vp_op scoreboard values
function vp:op_check

# Recalculate flags for all online players to apply the new configuration.
execute as @a run function vp:player_recalculate_flags

# feedback to executor
tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Configuration reloaded."}]
