# vp:command/dispatch_from_storage
# Run as the player who typed the command.
# NOTE: This system is not safe for multiple concurrent users.
# A more robust system would use a unique player ID to avoid conflicts.

# For now, we'll parse the first line of the command storage.
# We'll need to implement a proper argument parser later.
# For now, we'll check for simple command names.

execute if data storage vp:temp {command:{line1:'"create"'}} run function vp:create_group
execute if data storage vp:temp {command:{line1:'"edit"'}} run function vp:edit_group
execute if data storage vp:temp {command:{line1:'"join"'}} run function vp:join_group
execute if data storage vp:temp {command:{line1:'"leave"'}} run function vp:leave_group
execute if data storage vp:temp {command:{line1:'"reload"'}} run function vp:reload_config

# If no command matched, tell the player.
# (This requires a bit more logic, maybe a scoreboard check)
# For now, we'll just let it fail silently.