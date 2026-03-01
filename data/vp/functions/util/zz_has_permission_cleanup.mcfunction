# vp:util/zz_has_permission_cleanup
# Cleans up all temporary data used by the has_permission check.

data remove storage vp:temp effective_permissions
data remove storage vp:temp permission_to_check
data remove storage vp:temp groups_to_process
data remove storage vp:temp _check
data remove storage vp:temp pattern_to_check
scoreboard players reset @s vp_perm_denied
scoreboard players reset @s vp_perm_granted