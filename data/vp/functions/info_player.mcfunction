# vp:info_player
# Displays information about a specific player.
# Expects:
# - NBT arguments from function call: {player:"<PlayerName>"}

# --- Permission Check ---
data modify storage vp:temp permission_to_check set value "vp.command.info.player"
function vp:util/has_permission
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied
execute if score @s vp_has_permission matches 0 run return 0

# --- Find Player ---
# The {player:"..."} argument is automatically stored in vp:temp.
# We rename it to 'arg' for consistency with other functions.
data modify storage vp:temp arg set from storage vp:temp player

# First, try to find the player online.
function vp:zz_info_player_find_online