# vp:util/find_player_by_uuid
# Finds a player in players.json by their UUID.
# Expects executing player's UUID to be used for the search.
# Stores result in `storage vp:temp found_player_data`.
# Sets `vp.flag_result` score for @s to 1 on success, 0 on failure.

# Store player's UUID for the loop to use
execute store result storage vp:temp search_uuid[0] int 1 run data get entity @s UUID[0]
execute store result storage vp:temp search_uuid[1] int 1 run data get entity @s UUID[1]
execute store result storage vp:temp search_uuid[2] int 1 run data get entity @s UUID[2]
execute store result storage vp:temp search_uuid[3] int 1 run data get entity @s UUID[3]

# Create a temporary copy of the players array to loop over
data modify storage vp:temp players_copy set from storage vp:players players

# Initialize success flag
scoreboard players set @s vp.flag_result 0

# Start the loop
function vp:util/find_player_loop
