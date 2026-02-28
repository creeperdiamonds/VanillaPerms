# vp:util/find_group_by_name
# Finds a group in groups.json by its name.
# Expects group name in `storage vp:temp search_group_name`.
# Stores result in `storage vp:temp found_group_data`.
# Sets `vp.flag_result` score for @s to 1 on success, 0 on failure.

# Create a temporary copy of the groups array
data modify storage vp:temp groups_copy set from storage vp:groups groups

# Initialize success flag
scoreboard players set @s vp.flag_result 0

# Start the loop
function vp:util/find_group_loop
