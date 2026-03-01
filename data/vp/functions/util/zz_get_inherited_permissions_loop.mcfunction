# vp:util/zz_get_inherited_permissions_loop
# Internal recursive loop to gather permissions from a list of groups,
# including any groups they inherit from.
#
# Expects:
#   - storage vp:temp groups_to_process (list): A list of group names to check.
#
# Modifies:
#   - storage vp:temp effective_permissions: Appends permissions from found groups.

# --- Stop Condition ---
# If there are no more groups to process, we are done.
execute unless data storage vp:temp groups_to_process[0] run return 0

# --- Process Next Group ---
# Get the next group name from the list.
data modify storage vp:temp search_group_name set from storage vp:temp groups_to_process[0]
function vp:util/find_group_by_name

# If the group was found, append its permissions and its inheritance list.
execute if score @s vp.flag_result matches 1 run data modify storage vp:temp effective_permissions append from storage vp:temp found_group_data.permissions
execute if score @s vp.flag_result matches 1 run data modify storage vp:temp groups_to_process append from storage vp:temp found_group_data.inherits

# Remove the group we just processed and loop again.
data remove storage vp:temp groups_to_process[0]
function vp:util/zz_get_inherited_permissions_loop