# op_check_single.mcfunction
# executed as a single OP player; assign the appropriate operator group
# in the vp:players storage entry for that player.

# Determine target group name by checking player's OP status
# Note: In vanilla MC, OP levels are 0-4. Since these are ops, we check using permission level
execute if data storage vp:temp find_player_temp[{uuid:[@s]}] run data modify storage vp:temp group_arg set value "operator"
# (Advanced: could check player.dat for actual OP level, but for now use "operator" group)

# The join_group_update function is designed to update the calling player's
# group to the one specified in `storage vp:temp group_arg`.
function vp:join_group_update

# The 'join_group_update' function now handles recalculating flags and permissions.
# The lines below are no longer needed.

