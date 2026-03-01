# vp:util/zz_get_perms_finalize_apply_negatives
# Loops through the negative permissions and removes them from the final list.

# Stop condition: If the negative list is empty, we are done.
execute unless data storage vp:temp _perms.negative[0] run return 0

# Get the next negative permission.
data modify storage vp:temp perm_to_remove set from storage vp:temp _perms.negative[0]
data remove storage vp:temp _perms.negative[0]

# Rebuild the final list, excluding the permission to be removed.
data modify storage vp:temp original_perms set from storage vp:temp _perms.final_list
data modify storage vp:temp new_perms set value []
function vp:zz_rebuild_permissions_list_loop
data modify storage vp:temp _perms.final_list set from storage vp:temp new_perms

# Loop again.
function vp:util/zz_get_perms_finalize_apply_negatives