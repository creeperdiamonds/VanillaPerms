# vp:util/zz_has_permission_check_deny_single
# Internal helper to check a single negative permission node.

# Get the permission node without the leading '-'
data modify storage vp:temp _check.deny_node set string storage vp:temp _check.current_perm 1

# 1. Check for an exact negative match.
execute store success score @s vp_match run data modify storage vp:temp _check.deny_node set from storage vp:temp permission_to_check
execute if score @s vp_match matches 0 run scoreboard players set @s vp_has_permission 1

# 2. Check for a negative wildcard match.
execute if data storage vp:temp {_check:{deny_node:"*"}} run data modify storage vp:temp _check.wildcard_base set string storage vp:temp _check.deny_node 0 -1
execute if data storage vp:temp {_check:{deny_node:"*"}} run data modify storage vp:temp _check.perm_to_check_copy set from storage vp:temp permission_to_check 
execute if data storage vp:temp {_check:{deny_node:"*"}} run function vp:util/zz_wildcard_permission_check
execute if data storage vp:temp {_check:{deny_node:"*"}} if score @s vp_match matches 1 run scoreboard players set @s vp_has_permission 1