# vp:zz_recalc_flags_find_player_loop.mcfunction
# Recursive loop to find a player by UUID in the temporary players list.

# Exit condition: If the temp list is empty, the player was not found in storage.
# In this case, we just apply the default flags that are already in effective_flags.
execute unless data storage vp:temp find_player_temp[0] run function vp:zz_recalc_flags_apply_to_scoreboards

# Get the UUID of the player from the list we are currently checking.
data modify storage vp:temp cmp_uuid set from storage vp:temp find_player_temp[0].uuid

# Compare the stored UUID with the current player's UUID.
# We check if setting the data from the source changes it. If it doesn't (success=0), the parts are equal.
scoreboard players set @s vp_match 0
execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[0] set from storage vp:temp find_uuid[0]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[1] set from storage vp:temp find_uuid[1]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[2] set from storage vp:temp find_uuid[2]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

execute store success score @s vp_tmp run data modify storage vp:temp cmp_uuid[3] set from storage vp:temp find_uuid[3]
execute if score @s vp_tmp matches 0 run scoreboard players add @s vp_match 1

# If vp_match is 4, all four UUID components matched, so we've found the player.
# Call a dispatcher function which will decide what to do next based on a scoreboard value.
execute if score @s vp_match matches 4 run function vp:zz_find_player_dispatcher

# If no match was found, continue the loop.
execute if score @s vp_match matches ..3 run block
    # Increment loop counter.
    scoreboard players add @s vp_loop 1
    # Remove the player we just checked from the temporary list.
    data remove storage vp:temp find_player_temp[0]
    # Call this function again to check the next player.
    function vp:zz_recalc_flags_find_player_loop
end
