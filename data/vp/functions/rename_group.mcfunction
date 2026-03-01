# vp:rename_group
# Renames a group.
# Expects arguments to be set in `storage vp:temp`:
#   - old_name (string): The current name of the group.
#   - new_name (string): The new name for the group.

# --- 1. Permission Check ---
data modify storage vp:temp permission_to_check set value "vp.command.rename_group"
function vp:util/has_permission
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied
execute if score @s vp_has_permission matches 0 run return 0

# --- 2. Argument Validation ---
# Check if the dispatcher has set the required arguments in temp storage.
execute unless data storage vp:temp {old_name:"", new_name:""} run tellraw @s [{"text":"[ERROR] ","color":"red"},{"text":"Missing arguments for rename_group. 'old_name' and 'new_name' must be provided in temp storage."}]
execute unless data storage vp:temp {old_name:"", new_name:""} run return 0

# --- 3. Check for New Group Name Collision ---
# Use the generic find utility to see if the new name is already taken.
data modify storage vp:temp arg set from storage vp:temp new_name
function vp:find_group
execute if score @s vp_found matches 1 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"A group with the name '"},{"storage":"vp:temp","nbt":"new_name"},{"text":"' already exists."}]
execute if score @s vp_found matches 1 run return 0

# --- 4. Find the Old Group and Rename ---
# Now, find the group to be renamed.
data modify storage vp:temp arg set from storage vp:temp old_name
function vp:find_group

# If the old group was not found, send an error.
execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Group '"},{"storage":"vp:temp","nbt":"old_name"},{"text":"' not found."}]
execute if score @s vp_found matches 0 run return 0

# If found, proceed to rename it. The index is in `vp_found_index`.
execute if score @s vp_found matches 1 run function vp:zz_setup_rebuild_groups