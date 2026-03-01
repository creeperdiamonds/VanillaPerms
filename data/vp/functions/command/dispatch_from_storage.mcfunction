# vp:command/dispatch_from_storage
# This function acts as a router for commands entered via signs.
# It is executed by the player who placed the sign.
#
# It should read the command from `vp:temp command.line1` and the
# primary argument from `vp:temp arg`, then call the appropriate
# function (e.g., vp:create_group, vp:join_group).

# Example:
# execute if data storage vp:temp {command:{line1:'"create_group"'}} run function vp:create_group