# vp:util/find_player_loop
# Loops through the temporary players_copy array.

# Exit condition: if the array is empty, player not found.
execute unless data storage vp:temp players_copy[0] run return 0

# Get current player from the array's first element
data modify storage vp:temp current_player set from storage vp:temp players_copy[0]

# Compare UUIDs by checking if the search_uuid is present in the current_player object.
# This requires a more complex data check.
execute if data storage vp:temp {current_player:{uuid:[]}} if data storage vp:temp {search_uuid:[]} run function vp:util/player_found

# If found, the 'player_found' function will have set the success score and will stop the loop.
# If we are still here, the player was not the one.
# Remove the first element and loop again.
data remove storage vp:temp players_copy[0]
function vp:util/find_player_loop
