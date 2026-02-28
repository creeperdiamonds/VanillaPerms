# create_group_check_loop.mcfunction
# Recursively checks for a group name's existence in 'vp:temp groups'.

# Stop condition: If the temporary list is empty, the group does not exist. End the loop.
execute unless data storage vp:temp groups[0] run return 0

# Get the name of the group we are currently checking.
data modify storage vp:temp cmp set from storage vp:temp groups[0].name

# Compare the name with the argument using the 'store success' method.
# This command will return a success of 0 if the values are identical.
execute store success score @s vp_match run data modify storage vp:temp cmp set from storage vp:temp arg

# Check if the score is 0 (match found).
execute if score @s vp_match matches 0 run block
    # If they match, send an error, tag the player, and end the loop.
    tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Group already exists: '","color":"gray"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"'","color":"gray"}]
    tag @s add vp_group_exists
    return 0
end

# If no match was found:
# Remove the group we just checked from the temporary list.
data remove storage vp:temp groups[0]

# Call this function again to check the next group in the list.
function vp:create_group_check_loop
