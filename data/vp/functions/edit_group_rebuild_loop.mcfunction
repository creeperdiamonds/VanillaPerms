# edit_group_rebuild_loop.mcfunction
# Recursively rebuilds the groups list to modify one entry.

# Stop condition: If the temp list is empty, the rebuild is done.
execute unless data storage vp:temp temp_groups[0] run return 0

# Check if the current group is the one we want to modify.
execute if score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp target_group set from storage vp:temp temp_groups[0]
execute if score @s vp_rebuild_loop = @s vp_found_index run execute if data storage vp:temp {action:"permission_add"} run data modify storage vp:temp target_group.permissions append from storage vp:temp action_values
execute if score @s vp_rebuild_loop = @s vp_found_index run execute if data storage vp:temp {action:"flag_set"} run data modify storage vp:temp target_group.flags merge from storage vp:temp action_values
execute if score @s vp_rebuild_loop = @s vp_found_index run execute if data storage vp:temp {action:"permission_remove"} run function vp:edit_group_rebuild_permission_remove
execute if score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp new_groups append from storage vp:temp target_group
execute if score @s vp_rebuild_loop = @s vp_found_index run tag @s add vp_processed_target

# If it's not the target group, just append it to the new list unmodified.
execute unless entity @s[tag=vp_processed_target] run data modify storage vp:temp new_groups append from storage vp:temp temp_groups[0]

# Clean up the tag used for skipping.
tag @s remove vp_processed_target

# Increment counter, remove the processed group from the temp list, and recurse.
scoreboard players add @s vp_rebuild_loop 1
data remove storage vp:temp temp_groups[0]
function vp:edit_group_rebuild_loop
