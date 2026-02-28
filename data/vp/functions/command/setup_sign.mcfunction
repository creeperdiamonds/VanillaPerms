# vp:command/setup_sign
# Run as the player commander.

# Summon a marker entity at the player's location to anchor the sign
execute at @s run summon marker ~ ~ ~ {Tags:["vp.command_marker"]}

# Find a suitable block in front of the player to place the sign
# We'll place it 2 blocks ahead to avoid being inside the player
execute at @s run setblock ^ ^ ^2 oak_sign

# Store the player's UUID on the marker for later reference
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..2,limit=1] UUID[0] int 1 run data get entity @s UUID[0]
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..2,limit=1] UUID[1] int 1 run data get entity @s UUID[1]
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..2,limit=1] UUID[2] int 1 run data get entity @s UUID[2]
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..2,limit=1] UUID[3] int 1 run data get entity @s UUID[3]
