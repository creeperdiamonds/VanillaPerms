# vp:command/zz_dispatch_edit_player

# Set up arguments from the sign command.
data modify storage vp:temp action set from storage vp:temp command.line3
data modify storage vp:temp action_values set from storage vp:temp command.line4

# Check permission and execute.
data modify storage vp:temp permission_to_check set value "vp.command.edit_player"
function vp:util/has_permission
execute if score @s vp_has_permission matches 1 run function vp:edit_player
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied