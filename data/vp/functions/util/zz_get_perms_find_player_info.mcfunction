# vp:util/zz_get_perms_find_player_info
# Finds the player in players.json to get their group and personal permissions.

# Get player's UUID and find them.
execute store result storage vp:temp current_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp current_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp current_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp current_uuid[3] int 1.0 run data get entity @s UUID[3]
function vp:find_player

# If player is found, get their data.
# To get an element by a scoreboard index, we copy the list and remove elements from the start
# until our target is at index 0.
execute if score @s vp_found matches 1 run data modify storage vp:temp _temp_player_list set from storage vp:players players
execute if score @s vp_found matches 1 run scoreboard players operation @s vp_tmp = @s vp_found_index
execute if score @s vp_found matches 1 run function vp:util/zz_get_element_by_index
execute if score @s vp_found matches 1 run data modify storage vp:temp _perms.player_data set from storage vp:temp _temp_player_list[0]
execute if score @s vp_found matches 1 run data remove storage vp:temp _temp_player_list
execute if score @s vp_found matches 1 run data modify storage vp:temp groups_to_process append from storage vp:temp _perms.player_data.group

# If player is not found, they belong to the "default" group.
execute if score @s vp_found matches 0 run data modify storage vp:temp groups_to_process append value "default"

# Clean up
data remove storage vp:temp current_uuid