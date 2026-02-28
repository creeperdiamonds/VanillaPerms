# vp:zz_setup_rebuild_players.mcfunction
# Sets up the list-rebuilding process for editing the players list.

# Copy original players list to a temporary location.
data modify storage vp:temp temp_players set from storage vp:players players

# Create a new empty list to build the modified players list into.
data modify storage vp:temp new_players set value []

# Initialize a counter for the rebuild loop.
# We will use 'vp_found_index' to identify the player to modify.
scoreboard players set @s vp_rebuild_loop 0

# Start the rebuild loop.
function vp:zz_rebuild_players_loop
