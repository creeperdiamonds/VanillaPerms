# vp:util/zz_get_perms_finalize_loop
# Internal loop to create a unique list of permissions.

# Stop condition: If the source list is empty, we are done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# Get the next permission from the source list.
data modify storage vp:temp arg set from storage vp:temp effective_permissions[0]
data remove storage vp:temp effective_permissions[0]

# Check if this permission is already in our final list.
data modify storage vp:temp _find.source_list set from storage vp:temp _perms.final_list
data modify storage vp:temp _find.search_path set value "" 
# ^^ Searching a list of strings
data modify storage vp:temp _find.search_value set from storage vp:temp arg
function vp:util/find_in_list

# If it's not already in the list (found=0), add it.
execute if score @s vp_found matches 0 run data modify storage vp:temp _perms.final_list append from storage vp:temp arg

# Loop again.
function vp:util/zz_get_perms_finalize_loop