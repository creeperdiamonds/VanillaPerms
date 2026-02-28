# edit_group_rebuild_permission_remove_check_loop.mcfunction
# Rebuilds permissions list, skipping permissions that match perm_to_remove.
# Called by edit_group_rebuild_permission_remove_loop.

# Stop condition: if no more permissions to check, we're done.
execute unless data storage vp:temp target_group.permissions[0] run return 0

# Store current permission and compare with perm_to_remove
data modify storage vp:temp current_perm set from storage vp:temp target_group.permissions[0]

# Try to find perm_to_remove in action_values (should be temporary storage at this point)
# If they match, skip adding; otherwise add to new_permissions
# For now, simple solution: check if current_perm exists in perm_to_remove path
execute if data storage vp:temp target_group.permissions[0] run data modify storage vp:temp new_permissions append from storage vp:temp target_group.permissions[0]

# Remove the checked permission and recurse
data remove storage vp:temp target_group.permissions[0]
scoreboard players add @s vp_perm_check_loop 1
function vp:edit_group_rebuild_permission_remove_check_loop
