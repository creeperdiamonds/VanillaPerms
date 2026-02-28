# vp:command/dispatch_from_storage
# Run as the player who typed the command.
# NOTE: This system is not safe for multiple concurrent users.
# A more robust system would use a unique player ID to avoid conflicts.

## Dispatch command stored in `vp:temp`.
## We accept either a plain verb (create) or a quoted verb ("create") because
## different server implementations may return slightly different NBT for sign text.

# create
execute if data storage vp:temp {command:{line1:'"create"'}} run function vp:create_group
execute if data storage vp:temp {command:{line1:'create'}} run function vp:create_group

# edit
execute if data storage vp:temp {command:{line1:'"edit"'}} run function vp:edit_group
execute if data storage vp:temp {command:{line1:'edit'}} run function vp:edit_group

# join
execute if data storage vp:temp {command:{line1:'"join"'}} run function vp:join_group
execute if data storage vp:temp {command:{line1:'join'}} run function vp:join_group

# leave
execute if data storage vp:temp {command:{line1:'"leave"'}} run function vp:leave_group
execute if data storage vp:temp {command:{line1:'leave'}} run function vp:leave_group

# reload
execute if data storage vp:temp {command:{line1:'"reload"'}} run function vp:reload_config
execute if data storage vp:temp {command:{line1:'reload'}} run function vp:reload_config

# Unknown command -> show help
execute unless data storage vp:temp {command:{line1:'"create"'}} unless data storage vp:temp {command:{line1:'create'}} unless data storage vp:temp {command:{line1:'"edit"'}} unless data storage vp:temp {command:{line1:'edit'}} unless data storage vp:temp {command:{line1:'"join"'}} unless data storage vp:temp {command:{line1:'join'}} unless data storage vp:temp {command:{line1:'"leave"'}} unless data storage vp:temp {command:{line1:'leave'}} unless data storage vp:temp {command:{line1:'"reload"'}} unless data storage vp:temp {command:{line1:'reload'}} run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Unknown command on sign."}]