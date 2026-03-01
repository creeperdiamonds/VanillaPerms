# vp:edit_player
# Entry point for modifying a specific player's data.

# Arguments (must be set in storage vp:temp before calling):
#   - arg (string): The name of the player to edit.
#   - action (string): e.g., "permission_add", "flag_set"
#   - action_values (any): The values for the action.

# --- 1. Validate Arguments ---
execute unless data storage vp:temp arg run tellraw @s [{"text":"[ERROR] Error: No player name provided in 'arg'.","color":"red"}]
execute unless data storage vp:temp arg run return 0
execute unless data storage vp:temp action run tellraw @s [{"text":"[ERROR] Error: No action provided in 'action'.","color":"red"}]
execute unless data storage vp:temp action run return 0
execute unless data storage vp:temp {action:"permission_clear"} run execute unless data storage vp:temp {action:"flag_clear"} run execute unless data storage vp:temp action_values run tellraw @s [{"text":"[ERROR] Error: No values provided in 'action_values'.","color":"red"}]
execute unless data storage vp:temp {action:"permission_clear"} run execute unless data storage vp:temp {action:"flag_clear"} run execute unless data storage vp:temp action_values run return 0

# --- 2. Find Player by Name ---
# We need the player to be online to get their UUID.
# We iterate through all online players to find a name match.
scoreboard players set @s vp_found 0
execute as @a run function vp:edit_player_find_by_name_loop

# If the loop completes and we haven't found the player, send an error.
# The success message is now handled by the loop itself.
execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Player '"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"' not found online."}]

# --- 3. Cleanup ---
data remove storage vp:temp arg
data remove storage vp:temp action
data remove storage vp:temp action_values