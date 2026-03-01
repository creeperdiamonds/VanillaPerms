# vp:command/zz_dispatch_reload
data modify storage vp:temp permission_to_check set value "vp.command.reload_config"
function vp:util/has_permission
execute if score @s vp_has_permission matches 1 run function vp:reload_config
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied