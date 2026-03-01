# vp:util/zz_get_perms_finalize_wildcard_cleanup
# When a wildcard permission is added, this function cleans up more specific
# permissions that are now redundant.
# Expects:
# - _perms.wildcard_base (string): The base of the wildcard (e.g., "command.").
# - _perms.final_list (list): The list to clean up.

# --- Setup ---
# Copy the list to a temporary location to iterate over, and create a new empty list.
data modify storage vp:temp _perms.cleanup_source set from storage vp:temp _perms.final_list
data modify storage vp:temp _perms.final_list set value []

# --- Loop ---
# Stop condition: If the source list is empty, we are done.
execute unless data storage vp:temp _perms.cleanup_source[0] run return 0

# Get the next permission to check.
data modify storage vp:temp _perms.check_perm set from storage vp:temp _perms.cleanup_source[0]

# Check if check_perm starts with wildcard_base. We do this by trying to replace
# the wildcard_base at the start of check_perm with an empty string. If the
# command succeeds (and the string is modified), it was a match.
execute store success score @s vp_match run data modify storage vp:temp _perms.check_perm set string storage vp:temp _perms.wildcard_base 0

# If it did NOT match (success=0), the permission is not covered by the wildcard, so we keep it.
execute if score @s vp_match matches 0 run data modify storage vp:temp _perms.final_list append from storage vp:temp _perms.cleanup_source[0]

# Remove the processed permission and loop again.
data remove storage vp:temp _perms.cleanup_source[0]
function vp:util/zz_get_perms_finalize_wildcard_cleanup