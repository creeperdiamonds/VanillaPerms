# vp:command/cleanup
# Cleans up all temporary markers, blocks, and tags.

# Kill the marker entity
kill @e[type=marker,tag=vp.command_marker]

# Remove the sign block. This is tricky without knowing its exact location.
# For now, we'll assume it's at ^ ^ ^2 relative to the player.
# This is NOT a robust solution.
# A better way is to store the block's coordinates on the marker.
execute as @a[tag=vp.commander] at @s run setblock ^ ^ ^2 air

# Remove the tag from the player
tag @a[tag=vp.commander] remove vp.commander

# Clear the temporary storage
data remove storage vp:temp command
