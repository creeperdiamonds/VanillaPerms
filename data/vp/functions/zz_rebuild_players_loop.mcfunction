# vp:zz_rebuild_players_loop.mcfunction
# Recursively rebuilds the players list to modify one entry.

# Stop condition: If the temp list is empty, the rebuild is done.
execute unless data storage vp:temp temp_players[0] run return 0

# Check if the current player is the one we want to modify.
# The target player's index is already in 'vp_found_index'.
execute if score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp target_player set from storage vp:temp temp_players[0]
execute if score @s vp_rebuild_loop = @s vp_found_index run execute if data storage vp:temp {action:"join_group"} run data modify storage vp:temp target_player.group set from storage vp:temp group_arg
execute if score @s vp_rebuild_loop = @s vp_found_index run execute if data storage vp:temp {action:"leave_group"} run data modify storage vp:temp target_player.group set value ""
execute if score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp new_players append from storage vp:temp target_player
execute if score @s vp_rebuild_loop = @s vp_found_index run tag @s add vp_processed_target

# If it's not the target player, just append their data to the new list unmodified.
execute unless entity @s[tag=vp_processed_target] run data modify storage vp:temp new_players append from storage vp:temp temp_players[0]

# Clean up the tag used for skipping.
tag @s remove vp_processed_target

# Increment counter, remove the processed player from the temp list, and recurse.
scoreboard players add @s vp_rebuild_loop 1
data remove storage vp:temp temp_players[0]
function vp:zz_rebuild_players_loop
