# vp:util/player_found
# Called when the player is found in the find_player_loop.

# Copy the found player data
data modify storage vp:temp found_player_data set from storage vp:temp current_player

# Set success flag
scoreboard players set @s vp.flag_result 1

# Cleanup the loop-related temporary data
data remove storage vp:temp players_copy
data remove storage vp:temp current_player
data remove storage vp:temp search_uuid
