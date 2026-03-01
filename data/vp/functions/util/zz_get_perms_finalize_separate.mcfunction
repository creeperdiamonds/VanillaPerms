# vp:util/zz_get_perms_finalize_separate
# Loops through the raw `effective_permissions` list and separates them
# into `_perms.positive` and `_perms.negative` lists.

# Stop condition: If the source list is empty, we are done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# Get the next permission and check if it starts with '-'.
data modify storage vp:temp arg set from storage vp:temp effective_permissions[0]
execute if data storage vp:temp {arg:"-"} run data modify storage vp:temp _perms.negative append value ""
execute if data storage vp:temp {arg:"-"} run data modify storage vp:temp _perms.negative[-1] set string storage vp:temp arg 1
execute unless data storage vp:temp {arg:"-"} run data modify storage vp:temp _perms.positive append from storage vp:temp arg

# Remove the processed permission and loop again.
data remove storage vp:temp effective_permissions[0]
function vp:util/zz_get_perms_finalize_separate