# vp:util/zz_check_perm_wildcard_loop
# Internal recursive loop for comparing permission nodes.
#
# Expects:
#   - storage vp:temp permission_to_check
#   - storage vp:temp pattern_to_check

# Stop Condition 1: Pattern is empty. If permission is also empty, it's a match.
execute unless data storage vp:temp pattern_to_check run execute unless data storage vp:temp permission_to_check run scoreboard players set @s vp_match 1
execute unless data storage vp:temp pattern_to_check run return 0

# Stop Condition 2: Permission is empty, but pattern is not. No match.
execute unless data storage vp:temp permission_to_check run return 0

# Get the next node from both strings.
function vp:util/zz_get_next_node {"id":"perm_node", "source":"permission_to_check"}
function vp:util/zz_get_next_node {"id":"pattern_node", "source":"pattern_to_check"}

# If the pattern node is a wildcard, it's a match.
execute if data storage vp:temp {pattern_node:"*"} run scoreboard players set @s vp_match 1
execute if data storage vp:temp {pattern_node:"*"} run return 0

# Compare the nodes.
execute store success score @s vp_tmp run data modify storage vp:temp perm_node set from storage vp:temp pattern_node

# If nodes don't match, it's not a valid prefix. No match.
execute if score @s vp_tmp matches 1 run return 0

# Nodes match, continue loop.
function vp:util/zz_check_perm_wildcard_loop