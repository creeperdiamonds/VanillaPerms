# vp:player_recalculate_flags.mcfunction
# Main entry point for recalculating a player's flags.
# To be executed as the player whose flags are being recalculated.

# Step 1: Initialize a temporary NBT object with the default flags from the config.
data modify storage vp:temp effective_flags set from storage vp:config config.Flags

# Step 2: Store the player's UUID. This will be used to find the player's data in the vp:players storage.
# The UUID is stored as an array of four integers.
execute store result storage vp:temp find_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp find_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp find_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp find_uuid[3] int 1.0 run data get entity @s UUID[3]

# Step 3: Set the callback identifier for the find loop. '1' means full recalculation.
scoreboard players set @s vp_callback 1

# Step 4: Start the function chain to find the player's data, merge group/player flags, and apply them to scoreboards.
function vp:zz_recalc_flags_find_player
