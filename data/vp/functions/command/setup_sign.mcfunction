# vp:command/setup_sign
# Run as the player commander.

# Summon a marker entity at the player's location to anchor the sign.
# We store the player's UUID on it for robust cleanup.
execute at @s run summon marker ~ ~ ~ {Tags:["vp.command_marker"], data:{OwnerUUID:[I;0,0,0,0]}}
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..1,limit=1] data.OwnerUUID[0] int 1 run data get entity @s UUID[0]
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..1,limit=1] data.OwnerUUID[1] int 1 run data get entity @s UUID[1]
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..1,limit=1] data.OwnerUUID[2] int 1 run data get entity @s UUID[2]
execute as @s store result entity @e[type=marker,tag=vp.command_marker,distance=..1,limit=1] data.OwnerUUID[3] int 1 run data get entity @s UUID[3]

# Place the sign 2 blocks ahead and store its exact coordinates on the marker.
execute at @s positioned ^ ^ ^2 run summon armor_stand ~ ~ ~ {Tags:["vp.temp_pos_marker"],NoGravity:1b,Marker:1b,Invisible:1b}
execute as @e[type=marker,tag=vp.command_marker,distance=..1] store result entity @s data.SignPos[0] double 1 run data get entity @e[type=armor_stand,tag=vp.temp_pos_marker,limit=1] Pos[0]
execute as @e[type=marker,tag=vp.command_marker,distance=..1] store result entity @s data.SignPos[1] double 1 run data get entity @e[type=armor_stand,tag=vp.temp_pos_marker,limit=1] Pos[1]
execute as @e[type=marker,tag=vp.command_marker,distance=..1] store result entity @s data.SignPos[2] double 1 run data get entity @e[type=armor_stand,tag=vp.temp_pos_marker,limit=1] Pos[2]
execute at @e[type=armor_stand,tag=vp.temp_pos_marker,limit=1] run setblock ~ ~ ~ oak_sign
kill @e[type=armor_stand,tag=vp.temp_pos_marker]
