# vp:zz_recalc_flags_find_group.mcfunction
# Sets up a loop to find the player's group in the vp:groups storage array.

# Initialize loop variables
scoreboard players set @s vp_loop 0
# vp_found and vp_found_index are reused, so reset them.
scoreboard players set @s vp_found 0
scoreboard players set @s vp_found_index -1

# Copy the groups array to a temporary location to iterate over it.
data modify storage vp:temp find_group_temp set from storage vp:groups groups

# Start the loop.
function vp:zz_recalc_flags_find_group_loop
