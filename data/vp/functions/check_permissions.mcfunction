# vp:check_permissions
# Gathers and displays all effective permissions for the executing player.
function vp:util/get_effective_permissions

tellraw @s {"text":"--- Your Effective Permissions ---","color":"gold"}

# If the list is empty, say so.
execute unless data storage vp:temp effective_permissions[0] run tellraw @s {"text":"- (none)","color":"gray"}

# Loop through the permissions and display them.
function vp:command/zz_display_permissions_loop

data remove storage vp:temp effective_permissions
data remove storage vp:temp groups_to_process
data remove storage vp:temp search_group_name
data remove storage vp:temp found_group_data