# vp:edit_player_find_by_name_loop
# Executed as each online player (@s) to find a match by name.

# Store the current player's name in a temporary path for comparison.
data modify storage vp:temp _player_name_check set from entity @s CustomName

# Compare the player's name with the target name from `storage vp:temp arg`.
# If they match, the `data modify` command will have a success count of 0.
execute store success score @s vp_match run data modify storage vp:temp _player_name_check set from storage vp:temp arg

# If the names matched (vp_match = 0), this is our target player.
# We can now execute the rest of the logic as this player.
execute if score @s vp_match matches 0 run function vp:edit_player_found_online

# Also, set the 'vp_found' score on the original command executor to prevent the error message.
# We need to target the original executor, who is the only one without the 'vp.commander' tag removed yet.
execute if score @s vp_match matches 0 run execute as @a[tag=vp.commander,limit=1] run scoreboard players set @s vp_found 1