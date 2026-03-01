# vp:leave_group_rebuild
# Sets up and executes the player list rebuild to remove the current player.

# Copy original players list to a temporary location.
data modify storage vp:temp temp_players set from storage vp:players players

# Create a new empty list to build the modified players list into.
data modify storage vp:temp new_players set value []

# Initialize a counter for the rebuild loop.
scoreboard players set @s vp_rebuild_loop 0

# Start the rebuild loop.
function vp:leave_group_rebuild_loop

# After the loop, replace the main players list with the new one.
data modify storage vp:players players set from storage vp:temp new_players

tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"You have left your group and returned to default."}]