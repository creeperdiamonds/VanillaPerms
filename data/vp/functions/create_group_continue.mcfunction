# create_group_continue.mcfunction
# This function checks if a group with the given name already exists.
# It initiates a loop that is safe for NBT list iteration.

# Clean up any tags from previous runs
tag @s remove vp_group_exists

# Copy the list of groups to a temporary location to avoid destroying the original data.
data modify storage vp:temp groups set from storage vp:groups groups

# Start the loop to check for duplicates.
function vp:create_group_check_loop

# After the loop has run, check if the 'vp_group_exists' tag was set.
# If it was not set, proceed with creating the group.
execute unless entity @s[tag=vp_group_exists] run function vp:create_group_do_create

# If the tag was set, it means a duplicate was found.
# The loop function will have already sent the error message.
# Clean up the tag.
execute if entity @s[tag=vp_group_exists] run tag @s remove vp_group_exists

# Clean up the temporary group list
data remove storage vp:temp groups
