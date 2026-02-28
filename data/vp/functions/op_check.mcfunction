# op_check.mcfunction
# Iterate over online players and assign a special operator group based
# on their vanilla OP level.

execute as @a[level=1..] run function vp:op_check_single
