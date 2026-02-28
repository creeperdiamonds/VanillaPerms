# edit_group_rebuild_permission_remove_loop.mcfunction
# Loops through action_values and removes each permission from target_group.
# Called by edit_group_rebuild_permission_remove.

# Stop condition: if action_values is empty, we're done.
execute unless data storage vp:temp action_values[0] run return 0

# Check if current permission exists in target_group.permissions.
# We need to rebuild target_group.permissions without the current permission.
# Store the permission to remove.
data modify storage vp:temp perm_to_remove set from storage vp:temp action_values[0]

# Create a new empty permissions list.
data modify storage vp:temp new_permissions set value []

# Initialize loop counter for the permissions rebuild.
scoreboard players set @s vp_perm_check_loop 0

# Call the permission check loop.
function vp:edit_group_rebuild_permission_remove_check_loop

# Replace the permissions list with the new one.
data modify storage vp:temp target_group.permissions set from storage vp:temp new_permissions

# Remove the currently processed permission from action_values.
data remove storage vp:temp action_values[0]

# Increment counter and recurse.
scoreboard players add @s vp_perm_remove_loop 1
function vp:edit_group_rebuild_permission_remove_loop
