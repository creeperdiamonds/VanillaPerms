# leave_group_do.mcfunction
# Removes a player from their group using the player rebuild loop.

# Set the action for the rebuild loop.
data modify storage vp:temp action set value "leave_group"

# Set up and run the player rebuild loop.
# 'vp_found_index' was already set by the calling 'leave_group' function.
function vp:zz_setup_rebuild_players

# After the loop, replace the main players list with the new one.
data modify storage vp:players players set from storage vp:temp new_players

# Clean up temp lists used in the rebuild process.
data remove storage vp:temp temp_players
data remove storage vp:temp new_players
data remove storage vp:temp target_player

# Tell the user they have left their group.
tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"You have left your group."}]

# Recalculate the player's flags. They will now have flags based on the 'default' group.
function vp:player_recalculate_flags
