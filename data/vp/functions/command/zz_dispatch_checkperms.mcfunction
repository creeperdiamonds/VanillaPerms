# vp:command/zz_dispatch_checkperms
data modify storage vp:temp permission_to_check set value "vp.command.check_self"
function vp:util/has_permission
execute if score @s vp_has_permission matches 1 run function vp:check_permissions
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied