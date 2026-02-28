# vp:util/find_group_loop
# Loops through the temporary groups_copy array.

# Exit condition: if the array is empty, group not found.
execute unless data storage vp:temp groups_copy[0] run return 0

# Get current group from the array's first element
data modify storage vp:temp current_group set from storage vp:temp groups_copy[0]

# Compare names using store success
# If the names match (no change when trying to set), success = 0
scoreboard players set @s vp_match 1
execute store success score @s vp_match run data modify storage vp:temp search_group_name set from storage vp:temp current_group.name

# If vp_match is 0, names matched
execute if score @s vp_match matches 0 run function vp:util/group_found

# If not found, remove the first element and loop again
data remove storage vp:temp groups_copy[0]
function vp:util/find_group_loop
