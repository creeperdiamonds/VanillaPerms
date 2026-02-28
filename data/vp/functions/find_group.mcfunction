# find_group.mcfunction
# Searches the groups array for the name stored in storage vp:temp arg.
# Results:
#   scoreboard vp_found = 1 if found else 0
#   scoreboard vp_found_index = index of matching element (0-based)

# Initialize scores
scoreboard players set @s vp_found 0
scoreboard players set @s vp_found_index -1
scoreboard players set @s vp_loop 0

# Copy groups to a temporary list for safe iteration
data modify storage vp:temp find_groups_temp set from storage vp:groups groups

# Start the loop
function vp:find_group_loop

# The loop will eventually call find_group_end.
# After the loop, we also need to clean up the temporary list.
data remove storage vp:temp find_groups_temp
