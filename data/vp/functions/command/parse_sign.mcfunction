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

# Simple argument parsing strategy:
# - Treat `line1` as the command verb (e.g. create, edit, join, leave, reload)
# - Treat `line2` as the primary argument (e.g. group name or other param)
# This covers the common use-cases and keeps parsing simple and deterministic.

# Copy line2 into a canonical temp arg for the downstream command handlers.
data modify storage vp:temp arg set from storage vp:temp command.line2

# Run the dispatcher as the player who placed the sign (tagged earlier).
execute as @a[tag=vp.commander] run function vp:command/dispatch_from_storage

# Clean up after parsing
function vp:command/cleanup
