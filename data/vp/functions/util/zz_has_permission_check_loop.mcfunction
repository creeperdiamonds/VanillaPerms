# vp:util/zz_has_permission_check_loop
# Internal loop to check for a permission within the `effective_permissions` list.

# --- Stop Conditions ---
# If permission is already granted, no need to check further.
execute if score @s vp_has_permission matches 1 run return 0
# If the list is empty and we haven't found it, we're done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# --- Get next permission from the list ---
data modify storage vp:temp _check.current_perm set from storage vp:temp effective_permissions[0]

# --- Perform Checks ---
# 1. Check for the universal wildcard '*'.
execute if data storage vp:temp {_check:{current_perm:"*"}} run scoreboard players set @s vp_has_permission 1

# 2. Check for an exact match.
execute store success score @s vp_match run data modify storage vp:temp _check.current_perm set from storage vp:temp permission_to_check
execute if score @s vp_match matches 0 run scoreboard players set @s vp_has_permission 1

# 3. Check for a node wildcard (e.g., command.*).
execute if data storage vp:temp {_check:{current_perm:"*"}} run data modify storage vp:temp _check.wildcard_base set string storage vp:temp _check.current_perm 0 -1
execute if data storage vp:temp {_check:{current_perm:"*"}} run data modify storage vp:temp _check.perm_to_check_copy set from storage vp:temp permission_to_check
execute if data storage vp:temp {_check:{current_perm:"*"}} run function vp:util/zz_wildcard_permission_check
execute if data storage vp:temp {_check:{current_perm:"*"}} if score @s vp_match matches 1 run scoreboard players set @s vp_has_permission 1

# --- Recurse ---
# Remove the processed permission and loop again if we haven't found a match yet.
data remove storage vp:temp effective_permissions[0]
function vp:util/zz_has_permission_check_loop

# Cleanup check-specific temp data
data remove storage vp:temp _check