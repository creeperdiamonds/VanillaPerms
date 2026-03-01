# vp:zz_info_player_find_online
# Tries to find the target player online to display their info.

# Set up for the search loop.
scoreboard players set @s vp_found 0
tag @s add vp.commander

# Execute the search loop as every online player.
execute as @a run function vp:edit_player_find_by_name_loop

# Cleanup the commander tag.
tag @s remove vp.commander

# If the player was not found online, try searching offline data.
execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"Player '","color":"gray"},{"text":"","extra":[{"storage":"vp:temp","nbt":"arg"}]},{"text":"' is not online. Searching offline data... (Not yet implemented)","color":"gray"}]
# TODO: Add call to a function that searches players.json by name.