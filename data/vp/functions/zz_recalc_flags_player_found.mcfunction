# vp:zz_recalc_flags_player_found.mcfunction
# This function is called when the player is found in the vp:players storage.

# Set 'found' flag and index.
scoreboard players set @s vp_found 1
scoreboard players operation @s vp_found_index = @s vp_loop

# The player object we want is now at the top of the find_player_temp list.
# Copy the player's data object and their group name for later use.
data modify storage vp:temp found_player_data set from storage vp:temp find_player_temp[0]
data modify storage vp:temp group_arg set from storage vp:temp found_player_data.group

# Now that we have the player data, merge their personal flags into the effective flags.
# The group's flags will be merged after we find the group.
data modify storage vp:temp effective_flags merge from storage vp:temp found_player_data.flags

# Clean up the temporary player list, we are done with it.
data remove storage vp:temp find_player_temp

# Now, start the process of finding the player's group.
function vp:zz_recalc_flags_find_group
