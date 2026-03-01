# vp:util/zz_has_permission_check_single_grant
# Checks if the current `pattern_to_check` grants the `permission_to_check`.
# Sets `vp_perm_granted` to 1 on match.

# Check if the pattern matches the permission.
function vp:util/check_permission_match

# If vp_match is 1, a grant was found.
execute if score @s vp_match matches 1 run scoreboard players set @s vp_perm_granted 1