# vp:edit_group_apply_permission_remove.mcfunction
# Sets up the list-rebuilding process for removing a permission from a group.

# Copy original groups list to a temporary location.
data modify storage vp:temp temp_groups set from storage vp:groups groups

# Create a new empty list to build the modified groups list into.
data modify storage vp:temp new_groups set value []

# Initialize a counter for the rebuild loop.
scoreboard players set @s vp_rebuild_loop 0

# Start the rebuild loop. The loop is generic and will use the 'action' from storage.
function vp:edit_group_rebuild_loop

# After the loop finishes, the new list is complete.
# Replace the original groups list with the new one.
data modify storage vp:groups groups set from storage vp:temp new_groups

# Tell the user the update was successful.
tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Group permissions updated successfully."}]

# Clean up temporary lists used in the process.
data remove storage vp:temp temp_groups
data remove storage vp:temp new_groups
data remove storage vp:temp target_group
