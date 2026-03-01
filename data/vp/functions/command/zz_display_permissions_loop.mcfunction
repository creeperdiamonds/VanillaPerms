# vp:command/zz_display_permissions_loop
# Internal loop to display a list of permissions.

# Stop condition: If the list is empty, we are done.
execute unless data storage vp:temp effective_permissions[0] run return 0

# Display the first permission in the list.
tellraw @s ["",{"text":"- ","color":"dark_gray"},{"storage":"vp:temp","nbt":"effective_permissions[0]","color":"aqua"}]

# Remove the displayed permission and loop again.
data remove storage vp:temp effective_permissions[0]
function vp:command/zz_display_permissions_loop