# vp:zz_setup_rebuild_groups
# Sets up the list-rebuilding process for editing the groups list.

# Copy original groups list to a temporary location.
data modify storage vp:temp temp_groups set from storage vp:groups groups

# Create a new empty list to build the modified groups list into.
data modify storage vp:temp new_groups set value []

# Initialize a counter for the rebuild loop.
scoreboard players set @s vp_rebuild_loop 0

# Start the rebuild loop.
function vp:zz_rebuild_groups_loop

# After the loop, replace the main groups list with the new one.
data modify storage vp:groups groups set from storage vp:temp new_groups