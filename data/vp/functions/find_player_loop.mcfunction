# find_player_loop.mcfunction
# Recursively searches for a player by UUID in 'vp:temp find_player_temp'.

# Stop condition: If the temp list is empty, the player was not found. End the loop.
execute unless data storage vp:temp find_player_temp[0] run data remove storage vp:temp find_player_temp

# Get the UUID of the player from the list we are currently checking.
data modify storage vp:temp cmp_uuid set from storage vp:temp find_player_temp[0].uuid

# Compare the stored UUID with the target UUID from 'current_uuid'.
# We check if setting the data from the source changes it. If it doesn't (success=0), the parts are equal.
scoreboard players set @s vp_match 0
execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[0] set from storage vp:temp current_uuid[0]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[1] set from storage vp:temp current_uuid[1]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[2] set from storage vp:temp current_uuid[2]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[3] set from storage vp:temp current_uuid[3]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

# If vp_match is 4, all four UUID components matched.
execute if score @s vp_match matches 4 run scoreboard players set @s vp_found 1
execute if score @s vp_match matches 4 run scoreboard players operation @s vp_found_index = @s vp_loop
execute if score @s vp_match matches 4 run data remove storage vp:temp find_player_temp
execute if score @s vp_match matches 4 run data remove storage vp:temp cmp_uuid
execute if score @s vp_match matches 4 run return 0

# If no match was found, continue the loop.
execute if score @s vp_match matches ..3 run scoreboard players add @s vp_loop 1
execute if score @s vp_match matches ..3 run data remove storage vp:temp find_player_temp[0]
execute if score @s vp_match matches ..3 run function vp:find_player_loop
