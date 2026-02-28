# vp:util/find_player_loop
# Loops through the temporary players_copy array.

# Exit condition: if the array is empty, player not found.
execute unless data storage vp:temp players_copy[0] run return 0

# Get current player from the array's first element
data modify storage vp:temp current_player set from storage vp:temp players_copy[0]

# Compare UUIDs - all 4 parts must match
scoreboard players set @s vp_match 0
execute store success score @s vp_tmp run data modify storage vp:temp search_uuid[0] set from storage vp:temp current_player.uuid[0]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp search_uuid[1] set from storage vp:temp current_player.uuid[1]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp search_uuid[2] set from storage vp:temp current_player.uuid[2]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp search_uuid[3] set from storage vp:temp current_player.uuid[3]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

# If all 4 matched (vp_match == 4), player found
execute if score @s vp_match matches 4 run function vp:util/player_found

# If found, the 'player_found' function will have set the success score and will stop the loop.
# If we are still here, the player was not the one.
# Remove the first element and loop again.
data remove storage vp:temp players_copy[0]
function vp:util/find_player_loop
