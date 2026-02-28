# find_group_loop.mcfunction
# Recursively searches for a group name in 'vp:temp find_groups_temp'.

# Stop condition: If the temp list is empty, the loop is over.
execute unless data storage vp:temp find_groups_temp[0] run function vp:find_group_end

# Get the name of the group we are currently checking.
data modify storage vp:temp cmp set from storage vp:temp find_groups_temp[0].name

# Compare the name with the argument using the 'store success' method.
execute store success score @s vp_match run data modify storage vp:temp cmp set from storage vp:temp arg

# Check if the score is 0 (match found).
execute if score @s vp_match matches 0 run scoreboard players set @s vp_found 1
execute if score @s vp_match matches 0 run scoreboard players operation @s vp_found_index = @s vp_loop
execute if score @s vp_match matches 0 run function vp:find_group_end
execute if score @s vp_match matches 0 run return 0

# If no match was found:
# Increment loop counter for the index.
scoreboard players add @s vp_loop 1
# Remove the group we just checked from the temporary list.
data remove storage vp:temp find_groups_temp[0]
# Call this function again to check the next group.
function vp:find_group_loop
