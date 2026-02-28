# vp:command/read_sign
# Scheduled to run after the player has had time to write on the sign.

# Find the marker and execute as the original player
# We can't directly target the player, so we use the marker as a proxy.
# The actual parsing will be done by another function, executed as the player.
execute at @e[type=marker,tag=vp.command_marker] run function vp:command/parse_sign
