# vp:util/check_permission_match
# Checks if a given permission string matches a permission pattern, supporting hierarchical wildcards.
#
# Expects:
#   - storage vp:temp permission_to_check (string): The permission being requested (e.g., "command.ban").
#   - storage vp:temp pattern_to_check (string): The pattern from the user's permissions list (e.g., "command.*").
#
# Result:
#   - score @s vp_match: Set to 1 if it's a match, 0 otherwise.

# --- Initial Setup ---
scoreboard players set @s vp_match 0

# --- Handle Simple Cases (Early Exit) ---

# Case 1: Universal wildcard. The pattern is just "*".
execute if data storage vp:temp {pattern_to_check:"*"} run scoreboard players set @s vp_match 1
execute if data storage vp:temp {pattern_to_check:"*"} run return 0

# --- Handle Hierarchical Wildcard ---

# Case 3: Check for ".*" at the end of the pattern. If it doesn't end with ".*", it's not a hierarchical wildcard match.
# The only remaining possibility was an exact match, which already failed. So we can exit.
execute unless data storage vp:temp {pattern_to_check:".*"} run function vp:util/zz_check_perm_wildcard_loop

# Case 2: Exact match (if not a wildcard)
execute if score @s vp_match matches 0 run execute if data storage vp:temp {permission_to_check:"$(pattern_to_check)"} run scoreboard players set @s vp_match 1