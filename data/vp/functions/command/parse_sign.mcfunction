# vp:command/parse_sign
# Run at the location of the command marker.

# Create temporary storage for the command
data modify storage vp:temp command set value {}

# Copy the sign text into storage
# We check all 4 lines and concatenate them.
data modify storage vp:temp command.line1 set from block ^ ^ ^2 front_text.messages[0]
data modify storage vp:temp command.line2 set from block ^ ^ ^2 front_text.messages[1]
data modify storage vp:temp command.line3 set from block ^ ^ ^2 front_text.messages[2]
data modify storage vp:temp command.line4 set from block ^ ^ ^2 front_text.messages[3]

# Now, we parse the command. We'll assume the command is on line 1 for now.
# This is a simplified approach. A real implementation would need to merge lines
# and split by spaces. For now, we'll just check the first line.

# We need to find the original player.
# This is tricky. The scheduled function loses the context of @s.
# I stored the UUID on the marker. Let's try to find the player with that UUID.
# This is a very advanced and potentially slow operation.
# A better way is to run the next function AS the player found by the UUID.
# But `execute as <UUID>` is not a thing.
#
# Let's reconsider. The `vp.commander` tag is still on the player.
# The scheduled function runs at the server level, so we can target the player.
execute as @a[tag=vp.commander] run function vp:command/dispatch_from_storage

# Clean up after parsing
function vp:command/cleanup
