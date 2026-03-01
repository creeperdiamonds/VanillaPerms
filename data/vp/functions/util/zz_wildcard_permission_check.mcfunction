# vp:util/zz_wildcard_permission_check
# Checks if a permission node matches a wildcard permission.
# Expects:
#   - storage vp:temp _check.perm_to_check_copy : The full permission node to check (e.g., "command.ban")
#   - storage vp:temp _check.wildcard_base      : The base of the wildcard permission (e.g., "command.")
#
# Result:
#   - score @s vp_match : Set to 1 on match, 0 otherwise.

execute store success score @s vp_match run data modify storage vp:temp _check.perm_to_check_copy set string storage vp:temp _check.wildcard_base