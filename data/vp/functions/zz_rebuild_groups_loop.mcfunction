# vp:zz_rebuild_groups_loop
# Recursively rebuilds the groups list to modify one entry.

# Stop condition: If the temp list is empty, the rebuild is done.
execute unless data storage vp:temp temp_groups[0] run return 0

# Check if the current group is the one we want to modify.
execute if score @s vp_rebuild_loop = @s vp_found_index unless data storage vp:temp {action:"delete"} run function vp:zz_rebuild_groups_modify_target

# If it's not the target group, just append its data to the new list unmodified.
# This also handles the "delete" case, as the target group is simply skipped.
execute unless score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp new_groups append from storage vp:temp temp_groups[0]

# Increment counter, remove the processed group from the temp list, and recurse.
scoreboard players add @s vp_rebuild_loop 1
data remove storage vp:temp temp_groups[0]
function vp:zz_rebuild_groups_loop