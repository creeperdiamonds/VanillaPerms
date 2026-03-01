# vp:util/zz_get_inherited_flags_loop
# Internal recursive loop to gather flags from a list of groups and their inheritance chain.
#
# Expects:
#   - storage vp:temp groups_to_process (list): A list of group names to check.
#
# Modifies:
#   - storage vp:temp effective_flags: Merges flags from found groups.

# --- Stop Condition ---
execute unless data storage vp:temp groups_to_process[0] run return 0

# --- Process Next Group ---
data modify storage vp:temp search_group_name set from storage vp:temp groups_to_process[0]
function vp:util/find_group_by_name

execute if score @s vp.flag_result matches 1 run data modify storage vp:temp effective_flags merge from storage vp:temp found_group_data.flags
execute if score @s vp.flag_result matches 1 run data modify storage vp:temp groups_to_process append from storage vp:temp found_group_data.inherits

data remove storage vp:temp groups_to_process[0]
function vp:util/zz_get_inherited_flags_loop