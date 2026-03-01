# edit_group.mcfunction
# Entry point for modifying a group.
# See comments within for argument details.

# Arguments (must be set in storage vp:temp before calling):
#   - arg (string): The name of the group to edit.
#   - action (string): e.g., "permission_add", "permission_remove", "flag_set", "rank_set"
#   - action_values (string): The values for the action.

# Check for required arguments
execute unless data storage vp:temp arg run tellraw @s [{"text":"[ERROR] Error: No group name provided in 'arg'.","color":"red"}]
execute unless data storage vp:temp arg run return 0
execute unless data storage vp:temp action run tellraw @s [{"text":"[ERROR] Error: No action provided in 'action'.","color":"red"}]
execute unless data storage vp:temp action run return 0
execute unless data storage vp:temp {action:"permission_clear"} run execute unless data storage vp:temp {action:"flag_clear"} run execute unless data storage vp:temp action_values run tellraw @s [{"text":"[ERROR] Error: No values provided in 'action_values'.","color":"red"}]
execute unless data storage vp:temp {action:"permission_clear"} run execute unless data storage vp:temp {action:"flag_clear"} run execute unless data storage vp:temp action_values run return 0

# Find the group. The function vp:find_group will:
# - Set vp_found=1 if found, 0 otherwise.
# - Set vp_found_index to the group's index if found.
function vp:find_group

# If group was found, call the function to apply the changes.
execute if score @s vp_found matches 1 run function vp:edit_group_apply

# If group was not found, send an error message.
execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Group not found: '"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"'"}]

# Clean up temp storage that is safe to remove now
data remove storage vp:temp arg
data remove storage vp:temp cmp
