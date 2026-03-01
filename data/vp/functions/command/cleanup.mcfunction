# vp:command/cleanup
# Cleans up all temporary markers, blocks, and tags for the executing player.
# This version is robust and can clean up even after a server restart.

# Store the player's UUID to find their specific command marker.
execute store result storage vp:temp _cleanup_uuid[0] int 1 run data get entity @s UUID[0]
execute store result storage vp:temp _cleanup_uuid[1] int 1 run data get entity @s UUID[1]
execute store result storage vp:temp _cleanup_uuid[2] int 1 run data get entity @s UUID[2]
execute store result storage vp:temp _cleanup_uuid[3] int 1 run data get entity @s UUID[3]

# Find the marker owned by this player.
execute as @e[type=marker,tag=vp.command_marker,nbt={data:{OwnerUUID:[I;0,0,0,0]}}] if data entity @s data.OwnerUUID if data storage vp:temp _cleanup_uuid run function vp:command/zz_cleanup_single_marker

# Remove the tag from the player.
tag @s remove vp.commander

# Clear the temporary storage
data remove storage vp:temp command
data remove storage vp:temp _cleanup_uuid
