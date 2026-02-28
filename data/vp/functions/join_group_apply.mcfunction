# join_group_apply.mcfunction
# Sets the group for an existing player using the player rebuild loop.

# Set the action for the rebuild loop.
data modify storage vp:temp action set value "join_group"

# Set up and run the player rebuild loop.
function vp:zz_setup_rebuild_players

# After the loop, replace the main players list with the new one.
data modify storage vp:players players set from storage vp:temp new_players

# Clean up temp lists used in the rebuild process.
data remove storage vp:temp temp_players
data remove storage vp:temp new_players
data remove storage vp:temp target_player

# Tell the user the group was changed.
tellraw @s ["",{"text":"[VP] ","color":"green"},{"text":"Group changed to "},{"storage":"vp:temp","nbt":"group_arg","color":"yellow"}]

# Recalculate the player's flags now that their group is set.
function vp:player_recalculate_flags
