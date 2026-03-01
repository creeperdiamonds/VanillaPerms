# vp:command/cleanup
# This function cleans up temporary data after a sign command has been processed.
# It is executed by the player who placed the sign.

# Remove the commander tag
tag @s remove vp.commander

# Clear temporary command data from storage
data remove storage vp:temp command
data remove storage vp:temp arg