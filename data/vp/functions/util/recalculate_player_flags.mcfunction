# vp:util/recalculate_player_flags
# Main entry point for recalculating a player's flags using the modular util system.
# To be executed as the player whose flags are being recalculated.

# Start with the default flags from the config.
data modify storage vp:temp effective_flags set from storage vp:config config.DefaultFlags

function vp:util/find_player_by_uuid

# If the player was found, merge their personal flags and get their group name.
execute if score @s vp.flag_result matches 1 run data modify storage vp:temp effective_flags merge from storage vp:temp found_player_data.flags
execute if score @s vp.flag_result matches 1 run data modify storage vp:temp search_group_name set from storage vp:temp found_player_data.group

# If the player was NOT found, they belong to the 'default' group.
execute if score @s vp.flag_result matches 0 run data modify storage vp:temp search_group_name set value "default"

# Create a list of groups to process, starting with the player's primary group.
data modify storage vp:temp groups_to_process set value []
data modify storage vp:temp groups_to_process append from storage vp:temp search_group_name

# Start the recursive loop to get all flags from the inheritance chain.
function vp:util/zz_get_inherited_flags_loop

# This reuses the existing function that writes the final flags to scoreboards.
function vp:zz_recalc_flags_apply_to_scoreboards

# --- Cleanup ---
data remove storage vp:temp effective_flags
data remove storage vp:temp found_player_data
data remove storage vp:temp groups_to_process
data remove storage vp:temp search_group_name
data remove storage vp:temp found_group_data