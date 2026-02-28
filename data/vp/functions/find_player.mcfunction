# find_player.mcfunction
# Searches the players array for the UUID stored in storage vp:temp current_uuid.
# This function sets up a safe, recursive loop.
# Results:
#   scoreboard vp_found = 1 if found, 0 otherwise.
#   scoreboard vp_found_index = index of matching element, or -1.

# Initialize scores
scoreboard players set @s vp_found 0
scoreboard players set @s vp_found_index -1
scoreboard players set @s vp_loop 0

# Copy players list to a temporary location for safe iteration.
data modify storage vp:temp find_player_temp set from storage vp:players players

# Start the loop. The loop will manage its own recursion and cleanup.
function vp:find_player_loop
