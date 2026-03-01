# vp:leave_group_rebuild_loop
# Recursively rebuilds the players list, skipping the player at vp_found_index.

# Stop condition: If the temp list is empty, the rebuild is done.
execute unless data storage vp:temp temp_players[0] run return 0

# If the current loop index does NOT match the target index, copy the player.
execute unless score @s vp_rebuild_loop = @s vp_found_index run data modify storage vp:temp new_players append from storage vp:temp temp_players[0]

# Increment counter, remove the processed player from the temp list, and recurse.
scoreboard players add @s vp_rebuild_loop 1
data remove storage vp:temp temp_players[0]
function vp:leave_group_rebuild_loop