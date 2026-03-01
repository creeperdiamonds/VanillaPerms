# vp:zz_rebuild_groups_loop
# Recursively rebuilds the groups list to modify one entry.

# Stop condition: If the temp list is empty, the rebuild is done.
execute unless data storage vp:temp temp_groups[0] run return 0

# Check if the current group is the one we want to modify.
execute if score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp target_group set from storage vp:temp temp_groups[0]
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"permission_add"} run data modify storage vp:temp target_group.permissions append from storage vp:temp action_values
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"flag_set"} run data modify storage vp:temp target_group.flags merge from storage vp:temp action_values
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"set_inheritance"} run data modify storage vp:temp target_group.inherits set from storage vp:temp action_values
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"permission_remove"} run function vp:zz_rebuild_groups_remove_perm_helper
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"permission_clear"} run data modify storage vp:temp target_group.permissions set value []
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"flag_clear"} run data modify storage vp:temp target_group.flags set value {}
execute if score @s vp_rebuild_loop = @s vp_found_index if data storage vp:temp {action:"rank_set"} run data modify storage vp:temp target_group.rank merge from storage vp:temp action_values
execute if score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp new_groups append from storage vp:temp target_group

# If it's not the target group, just append its data to the new list unmodified.
execute unless score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp new_groups append from storage vp:temp temp_groups[0]

# Increment counter, remove the processed group from the temp list, and recurse.
scoreboard players add @s vp_rebuild_loop 1
data remove storage vp:temp temp_groups[0]
function vp:zz_rebuild_groups_loop

function vp:zz_rebuild_groups_remove_perm_helper
    data modify storage vp:temp original_perms set from storage vp:temp target_group.permissions
    data modify storage vp:temp new_perms set value []
    data modify storage vp:temp perm_to_remove set from storage vp:temp action_values
    function vp:zz_rebuild_permissions_list_loop
    data modify storage vp:temp target_group.permissions set from storage vp:temp new_perms
    return 1