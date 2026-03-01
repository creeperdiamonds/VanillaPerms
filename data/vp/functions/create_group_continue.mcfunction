# create_group_continue.mcfunction
# This function checks if a group with the given name already exists.
# It now uses the generic find_in_list utility.

# --- Setup for generic find ---
# The group name to check is already in `storage vp:temp arg`.
data modify storage vp:temp _find.source_list set from storage vp:groups groups
data modify storage vp:temp _find.search_path set value "name"
data modify storage vp:temp _find.search_value set from storage vp:temp arg

# --- Execute generic find ---
function vp:util/find_in_list

# --- Process Results ---
# If the group was not found (vp_found = 0), proceed with creation.
execute if score @s vp_found matches 0 run function vp:create_group_do_create

# If the group was found (vp_found = 1), it's a duplicate. Send an error.
execute if score @s vp_found matches 1 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Group already exists: '"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"'"}]
