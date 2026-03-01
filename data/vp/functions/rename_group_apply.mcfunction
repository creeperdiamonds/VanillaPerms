# vp:rename_group_apply
# Applies the rename operation to the group found at index `vp_found_index`.

# --- Setup for Rebuild ---
# We must rebuild the list to modify an element by a dynamic index.
data modify storage vp:temp new_groups set value []
data modify storage vp:temp temp_groups set from storage vp:groups groups
scoreboard players set @s vp_rebuild_loop 0

# --- Start Rebuild Loop ---
function vp:zz_rebuild_groups_loop

# --- Finalize ---
# Overwrite the main groups list with the newly built one.
data modify storage vp:groups groups set from storage vp:temp new_groups

# --- Feedback ---
tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Group '"},{"storage":"vp:temp","nbt":"old_name","color":"yellow"},{"text":"' has been renamed to '"},{"storage":"vp:temp","nbt":"new_name","color":"yellow"},{"text":"'."}]

# --- Cleanup ---
data remove storage vp:temp old_name
data remove storage vp:temp new_name
data remove storage vp:temp arg
data remove storage vp:temp new_groups
data remove storage vp:temp temp_groups