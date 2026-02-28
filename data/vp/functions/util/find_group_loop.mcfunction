# vp:util/find_group_loop
# Loops through the temporary groups_copy array.

# Exit condition: if the array is empty, group not found.
execute unless data storage vp:temp groups_copy[0] run return 0

# Get current group from the array's first element
data modify storage vp:temp current_group set from storage vp:temp groups_copy[0]

# Compare names
# data modify storage vp:temp current_group_name set from storage vp:temp current_group.name
# execute if data storage vp:temp {current_group_name} == storage vp:temp {search_group_name} run function vp:util/group_found
# The above does not work. We need to compare the two strings.
# A common way is to put them in the same temporary object and compare.
data modify storage vp:temp group_comparison set value {name1:"", name2:""}
data modify storage vp:temp group_comparison.name1 set from storage vp:temp current_group.name
data modify storage vp:temp group_comparison.name2 set from storage vp:temp search_group_name

execute if data storage vp:temp {group_comparison:{name1:[]}} if data storage vp:temp {group_comparison:{name2:[]}} run function vp:util/group_found

# If not found, remove the first element and loop again
data remove storage vp:temp groups_copy[0]
function vp:util/find_group_loop
