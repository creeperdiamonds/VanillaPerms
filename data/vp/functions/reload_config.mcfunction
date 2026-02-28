# reload_config.mcfunction
# Reset datapack internal state.  Called by `/trigger vp set 5` or on
# initial load.  This creates required scoreboard objectives, clears
# player/group arrays and reapplies defaults from config.json.

# --- ensure scoreboard objectives exist ---
scoreboard objectives add vp dummy 2>nul
scoreboard objectives add permissions dummy 2>nul
scoreboard objectives add perms dummy 2>nul
scoreboard objectives add permsA dummy 2>nul
scoreboard objectives add rank dummy 2>nul
scoreboard objectives add vp_cmd dummy 2>nul
scoreboard objectives add vp_arg1 dummy 2>nul
scoreboard objectives add vp_arg2 dummy 2>nul
scoreboard objectives add vp_loop dummy 2>nul
scoreboard objectives add vp_len dummy 2>nul
scoreboard objectives add vp_op dummy 2>nul
scoreboard objectives add vp_flag_AllowFlight dummy 2>nul
scoreboard objectives add vp_flag_InstantBreak dummy 2>nul
scoreboard objectives add vp_flag_IsInvulnerable dummy 2>nul
scoreboard objectives add vp_flag_NoHunger dummy 2>nul
scoreboard objectives add vp_flag_KeepInventory dummy 2>nul
scoreboard objectives add vp_flag_NoFallDamage dummy 2>nul
scoreboard objectives add vp_flag_AllowExecuteForOthers dummy 2>nul
scoreboard objectives add vp_flag_ChatRank dummy 2>nul
scoreboard objectives add vp_flag_TabRank dummy 2>nul
scoreboard objectives add vp_flag_HideChat dummy 2>nul
scoreboard objectives add vp_flag_HideTab dummy 2>nul
scoreboard objectives add vp_flag_HidePlayer dummy 2>nul
scoreboard objectives add vp_flag_LogCommandUse dummy 2>nul
scoreboard objectives add vp_flag_MaxCommandTargets dummy 2>nul

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
tellraw @s ["",{"text":"[VP] ","color":"green"},{"text":"Configuration reloaded."}]

