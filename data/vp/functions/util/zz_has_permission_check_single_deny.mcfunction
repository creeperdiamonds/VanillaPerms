# vp:util/zz_has_permission_check_single_deny
# Checks if the current negative `pattern_to_check` revokes the `permission_to_check`.
# Sets `vp_perm_denied` to 1 on match.

# Remove the leading '-' from the pattern to check it.
data modify storage vp:temp pattern_to_check set string storage vp:temp pattern_to_check 1

# Check if the (now positive) pattern matches the permission.
function vp:util/check_permission_match

# If vp_match is 1, an explicit deny was found.
execute if score @s vp_match matches 1 run scoreboard players set @s vp_perm_denied 1