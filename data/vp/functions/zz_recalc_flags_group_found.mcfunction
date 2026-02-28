# vp:zz_recalc_flags_group_found.mcfunction
# This function is called when the player's group is found in the vp:groups storage.

# The group object we want is now at the top of the find_group_temp list.
# Merge the flags from this group into our effective_flags object.
data modify storage vp:temp effective_flags merge from storage vp:temp find_group_temp[0].flags

# Clean up the temporary group list, we are done with it.
data remove storage vp:temp find_group_temp

# Now that all flags (default, player, and group) are merged, apply them to the scoreboards.
function vp:zz_recalc_flags_apply_to_scoreboards
