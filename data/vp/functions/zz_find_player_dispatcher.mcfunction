# vp:zz_find_player_dispatcher.mcfunction
# Dispatches to the correct "player found" handler based on the
# value of the 'vp_callback' scoreboard.

# Callback 1: The full flag recalculation process.
execute if score @s vp_callback matches 1 run function vp:zz_recalc_flags_player_found

# Callback 2: Utility to just get the player's group name.
execute if score @s vp_callback matches 2 run function vp:zz_util_player_found_get_group

# Reset the callback score after use to prevent accidental re-triggering.
scoreboard players set @s vp_callback 0
