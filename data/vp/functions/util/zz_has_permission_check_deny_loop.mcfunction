# vp:util/zz_has_permission_check_deny_loop
# Internal loop to check for an EXPLICIT DENY permission within the `effective_permissions` list.

# --- Stop Conditions ---
# If an explicit deny is already found, no need to check further.
execute if score @s vp_has_permission matches 1 run return 0
# If the list is empty and we haven't found it, we're done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# --- Get next permission from the list ---
data modify storage vp:temp _check.current_perm set from storage vp:temp effective_permissions[0]

# --- Perform Checks (only for negative permissions) ---
execute if data storage vp:temp {_check:{current_perm:"-"}} run function vp:util/zz_has_permission_check_deny_single

# --- Recurse ---
# Remove the processed permission and loop again if we haven't found a deny yet.
data remove storage vp:temp effective_permissions[0]
function vp:util/zz_has_permission_check_deny_loop