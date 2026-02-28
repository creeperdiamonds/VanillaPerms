# vp:zz_recalc_flags_find_group_loop.mcfunction
# Recursive loop to find a group by name in the temporary groups list.

# Exit condition: If the temp list is empty, the group was not found.
# This could happen if a player belongs to a non-existent group.
# We'll just proceed and apply the flags we have so far.
execute unless data storage vp:temp find_group_temp[0] run function vp:zz_recalc_flags_apply_to_scoreboards

# Get the name of the group from the list that we are currently checking.
data modify storage vp:temp cmp set from storage vp:temp find_group_temp[0].name

# Try to change the 'cmp' value to the target group name from 'group_arg'.
# If the command's success is 0, it means the value was not changed, which means it was already correct.
# This is how we detect a match.
execute store success score @s vp_match run data modify storage vp:temp cmp set from storage vp:temp group_arg

# If vp_match is 0, we found the group.
execute if score @s vp_match matches 0 run function vp:zz_recalc_flags_group_found

# If no match was found (the value was changed, so success=1), continue the loop.
execute if score @s vp_match matches 1 run block
    # Increment loop counter.
    scoreboard players add @s vp_loop 1
    # Remove the group we just checked from the temporary list.
    data remove storage vp:temp find_group_temp[0]
    # Call this function again to check the next group.
    function vp:zz_recalc_flags_find_group_loop
end
