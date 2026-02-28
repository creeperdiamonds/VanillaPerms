# vp:zz_recalc_flags_find_player.mcfunction
# Sets up a loop to find the player in the vp:players storage array.

# Initialize loop variables
scoreboard players set @s vp_loop 0
scoreboard players set @s vp_found 0
scoreboard players set @s vp_found_index -1

# Copy the players array to a temporary location to iterate over it.
data modify storage vp:temp find_player_temp set from storage vp:players players

# Start the loop.
function vp:zz_recalc_flags_find_player_loop
