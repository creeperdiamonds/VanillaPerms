# vp:zz_util_get_player_group_name.mcfunction
# Utility to find the current player's group name and store it.
# The result is placed in 'storage vp:temp current_player_group'.

# This function is executed as the player we want to find.
# Step 1: Store player's UUID.
execute store result storage vp:temp find_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp find_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp find_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp find_uuid[3] int 1.0 run data get entity @s UUID[3]

# Step 2: Set the callback identifier for the find loop. '2' means just get the group name.
scoreboard players set @s vp_callback 2

# Step 3: Start the generic find player process.
function vp:zz_recalc_flags_find_player
