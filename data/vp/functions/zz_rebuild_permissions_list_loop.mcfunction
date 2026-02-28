# vp:zz_rebuild_permissions_list_loop.mcfunction
# Recursively rebuilds a permissions list to remove one entry.
# Expects the following to be set in storage vp:temp before calling:
# - original_perms (list): The source list of permissions to copy from.
# - new_perms (empty list): The new list to build into.
# - perm_to_remove (string): The permission string to be removed.

# Stop condition: If the original list is empty, the process is done.
execute unless data storage vp:temp original_perms[0] run return 0

# Get the current permission from the original list.
data modify storage vp:temp cmp set from storage vp:temp original_perms[0]

# Compare it with the permission we want to remove.
# If they are different (success=1), we keep it.
execute store success score @s vp_match run data modify storage vp:temp cmp set from storage vp:temp perm_to_remove

# If they did NOT match, append the permission to the new list.
execute if score @s vp_match matches 1 run data modify storage vp:temp new_perms append from storage vp:temp original_perms[0]

# Remove the permission we just processed from the original list and recurse.
data remove storage vp:temp original_perms[0]
function vp:zz_rebuild_permissions_list_loop
