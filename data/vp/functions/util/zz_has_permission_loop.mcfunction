# vp:util/zz_has_permission_loop
# Internal loop for vp:util/has_permission.

# Stop Condition 1: If we already found a match, no need to keep checking.
execute if score @s vp_has_permission matches 1 run return 0

# Stop Condition 2: If there are no more permissions to check, we're done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# Get the next permission pattern from the list.
data modify storage vp:temp pattern_to_check set from storage vp:temp effective_permissions[0]

# Check if it matches the requested permission.
function vp:util/check_permission_match

# If vp_match is 1, the player has the permission.
execute if score @s vp_match matches 1 run scoreboard players set @s vp_has_permission 1

# Remove the permission we just processed from the list and recurse.
data remove storage vp:temp effective_permissions[0]

# Loop again.
function vp:util/zz_has_permission_loop