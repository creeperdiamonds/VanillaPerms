# op_check_single.mcfunction
# Executed as a single OP player (@s). Assigns the appropriate operator group
# based on the player's vanilla permission level.

# Determine target group name by checking the player's OP level.
# We check from highest to lowest to ensure the correct group is assigned.
execute if entity @s[level=4] run data modify storage vp:temp arg set value "operator"
execute if entity @s[level=3..3] run data modify storage vp:temp arg set value "operator.lvl3"
execute if entity @s[level=2..2] run data modify storage vp:temp arg set value "operator.lvl2"
execute if entity @s[level=1..1] run data modify storage vp:temp arg set value "operator.lvl1"

# Call the modern, refactored join_group function. It expects the
# group name to be in `storage vp:temp arg`.
function vp:join_group
