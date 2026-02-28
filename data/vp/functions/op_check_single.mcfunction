# op_check_single.mcfunction
# executed as a single OP player; assign the appropriate operator group
# in the vp:players storage entry for that player.

# Determine target group name by player's OP level
execute if entity @s[level=1] run data modify storage vp:temp group_arg set value "operator.lvl1"
execute if entity @s[level=2] run data modify storage vp:temp group_arg set value "operator.lvl2"
execute if entity @s[level=3] run data modify storage vp:temp group_arg set value "operator.lvl3"
execute if entity @s[level=4] run data modify storage vp:temp group_arg set value "operator"

# The join_group_update function is designed to update the calling player's
# group to the one specified in `storage vp:temp group_arg`.
function vp:join_group_update

# The 'join_group_update' function now handles recalculating flags and permissions.
# The lines below are no longer needed.

