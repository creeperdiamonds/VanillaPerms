# vp:command/zz_dispatch_create
data modify storage vp:temp permission_to_check set value "vp.command.create_group"
function vp:util/has_permission
execute if score @s vp_has_permission matches 1 run function vp:create_group
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied