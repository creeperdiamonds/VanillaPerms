# vp:util/group_found
# Called when the group is found in the find_group_loop.

# Copy the found group data
data modify storage vp:temp found_group_data set from storage vp:temp current_group

# Set success flag
scoreboard players set @s vp.flag_result 1

# Cleanup
data remove storage vp:temp groups_copy
data remove storage vp:temp current_group
data remove storage vp:temp search_group_name
data remove storage vp:temp group_comparison
