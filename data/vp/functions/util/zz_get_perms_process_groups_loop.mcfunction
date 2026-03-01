# vp:util/zz_get_perms_process_groups_loop
# Recursively processes groups from the `groups_to_process` list.

# Stop condition: If there are no more groups to process, exit.
execute unless data storage vp:temp groups_to_process[0] run return 0

# Get the next group to process and remove it from the list.
data modify storage vp:temp arg set from storage vp:temp groups_to_process[0]
data remove storage vp:temp groups_to_process[0]

# --- Prevent Infinite Loops ---
# Check if we've already processed this group.
data modify storage vp:temp _find.source_list set from storage vp:temp processed_groups
data modify storage vp:temp _find.search_path set value "" 
# ^^^ Searching a list of strings
data modify storage vp:temp _find.search_value set from storage vp:temp arg
function vp:util/find_in_list

# If already processed (found=1), skip to the next group in the list.
execute if score @s vp_found matches 1 run function vp:util/zz_get_perms_process_groups_loop
execute if score @s vp_found matches 1 run return 0

# If not processed, add it to the processed list and continue.
data modify storage vp:temp processed_groups append from storage vp:temp arg

# --- Find the group and get its data ---
function vp:find_group
# To get an element by a scoreboard index, we copy the list and remove elements from the start
# until our target is at index 0.
execute if score @s vp_found matches 1 run data modify storage vp:temp _temp_list set from storage vp:groups groups
execute if score @s vp_found matches 1 run scoreboard players operation @s vp_tmp = @s vp_found_index
execute if score @s vp_found matches 1 run function vp:util/zz_get_element_by_index_generic
execute if score @s vp_found matches 1 run data modify storage vp:temp _perms.group_data set from storage vp:temp _temp_list[0]
execute if score @s vp_found matches 1 run data remove storage vp:temp _temp_list
execute if score @s vp_found matches 1 run data modify storage vp:temp effective_permissions append from storage vp:temp _perms.group_data.permissions
execute if score @s vp_found matches 1 run data modify storage vp:temp groups_to_process append from storage vp:temp _perms.group_data.inherits

# Loop again for the next group.
function vp:util/zz_get_perms_process_groups_loop