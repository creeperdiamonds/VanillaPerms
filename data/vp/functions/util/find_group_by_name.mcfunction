# vp:util/find_group_by_name
# Finds a group in groups.json by its name.
# Expects group name in `storage vp:temp search_group_name`.
# Stores result in `storage vp:temp found_group_data`.
# Sets `vp.flag_result` score for @s to 1 on success, 0 on failure.

# --- Setup for generic find ---
data modify storage vp:temp _find.source_list set from storage vp:groups groups
data modify storage vp:temp _find.search_path set value "name"
data modify storage vp:temp _find.search_value set from storage vp:temp search_group_name

# --- Execute generic find ---
function vp:util/find_in_list

# --- Process Results ---
# The generic find function sets vp_found. We will use that as our result flag.
scoreboard players operation @s vp.flag_result = @s vp_found
