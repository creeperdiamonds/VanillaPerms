# vp:zz_rebuild_groups
# Sets up and starts the process of rebuilding the groups list.
# This is used for both modifying and deleting groups.

# Initialize the lists and loop counter.
data modify storage vp:temp new_groups set value []
data modify storage vp:temp temp_groups set from storage vp:groups groups
scoreboard players set @s vp_rebuild_loop 0

# Start the recursive loop.
function vp:zz_rebuild_groups_loop

# After the loop completes, overwrite the main groups list with the new one.
data modify storage vp:groups groups set from storage vp:temp new_groups