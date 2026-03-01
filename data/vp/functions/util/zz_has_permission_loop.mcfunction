# vp:util/zz_has_permission_loop
# Internal loop for vp:util/has_permission. Checks for both grants and denies.

# Stop Condition: If there are no more permissions to check, we're done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# Get the next permission pattern from the list.
data modify storage vp:temp pattern_to_check set from storage vp:temp effective_permissions[0]
data remove storage vp:temp effective_permissions[0]

# Check if the pattern is a negative permission (starts with '-')
execute if data storage vp:temp {pattern_to_check:"-"} run function vp:util/zz_has_permission_check_single_deny
execute unless data storage vp:temp {pattern_to_check:"-"} run function vp:util/zz_has_permission_check_single_grant

# If an explicit deny was found, we can stop checking immediately.
execute if score @s vp_perm_denied matches 1 run return 0

# Loop again.
function vp:util/zz_has_permission_loop