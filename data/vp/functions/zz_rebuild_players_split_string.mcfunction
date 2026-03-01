# vp:zz_rebuild_players_split_string
# Internal helper to split the action_values string by the first comma.
# Expects:
# - storage vp:temp action_values (string): The string to split.
# - score @s vp_match: The index of the comma.
# Results:
# - storage vp:temp perm_to_remove: The part of the string before the comma.
# - storage vp:temp action_values: The part of the string after the comma.

# 1. Get the part before the comma.
# Copy the whole string, then remove characters from the end until it's the right length.
data modify storage vp:temp perm_to_remove set from storage vp:temp action_values
execute store result score @s vp_len run data get storage vp:temp action_values
scoreboard players operation @s vp_len -= @s vp_match
function vp:zz_rebuild_players_trim_end_loop

# 2. Get the part after the comma.
# Remove characters from the start until we pass the comma.
scoreboard players add @s vp_match 1
function vp:zz_rebuild_players_trim_start_loop