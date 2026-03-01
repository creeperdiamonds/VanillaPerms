# vp:command/dispatch_from_storage
# Run as the player who typed the command.
# Checks permissions and dispatches to the correct command function.

# --- Command: create ---
execute if data storage vp:temp {command:{line1:'"create"'}} run function vp:command/zz_dispatch_create
execute if data storage vp:temp {command:{line1:'create'}} run function vp:command/zz_dispatch_create

# --- Command: edit ---
execute if data storage vp:temp {command:{line1:'"edit"'}} run function vp:command/zz_dispatch_edit
execute if data storage vp:temp {command:{line1:'edit'}} run function vp:command/zz_dispatch_edit

# --- Command: edit_player ---
execute if data storage vp:temp {command:{line1:'"edit_player"'}} run function vp:command/zz_dispatch_edit_player
execute if data storage vp:temp {command:{line1:'edit_player'}} run function vp:command/zz_dispatch_edit_player

# --- Command: join ---
execute if data storage vp:temp {command:{line1:'"join"'}} run function vp:command/zz_dispatch_join
execute if data storage vp:temp {command:{line1:'join'}} run function vp:command/zz_dispatch_join

# --- Command: leave ---
execute if data storage vp:temp {command:{line1:'"leave"'}} run function vp:command/zz_dispatch_leave
execute if data storage vp:temp {command:{line1:'leave'}} run function vp:command/zz_dispatch_leave

# --- Command: reload ---
execute if data storage vp:temp {command:{line1:'"reload"'}} run function vp:command/zz_dispatch_reload
execute if data storage vp:temp {command:{line1:'reload'}} run function vp:command/zz_dispatch_reload

# --- Command: checkperms ---
execute if data storage vp:temp {command:{line1:'"checkperms"'}} run function vp:command/zz_dispatch_checkperms
execute if data storage vp:temp {command:{line1:'checkperms'}} run function vp:command/zz_dispatch_checkperms

# --- Command: checkperms ---
execute if data storage vp:temp {command:{line1:'"checkperms"'}} run function vp:command/zz_dispatch_checkperms
execute if data storage vp:temp {command:{line1:'checkperms'}} run function vp:command/zz_dispatch_checkperms

# --- Fallback: Unknown Command ---
# If we reach this point, no command matched and returned.
tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Unknown command on sign."}]