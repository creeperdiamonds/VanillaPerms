# vp:zz_rebuild_players_remove_multiple_perms
# Parses a comma-separated list of permissions from `action_values` and removes each one from the target player.

# --- Setup ---
# Copy the player's current permissions to a working list.
data modify storage vp:temp original_perms set from storage vp:temp target_player.permissions

# --- Loop through comma-separated values ---
# Stop condition: If action_values is empty, we are done.
execute unless data storage vp:temp {action_values:''} run return 0

# Find the index of the first comma.
scoreboard players set @s vp_match -1
execute store result score @s vp_match run data get storage vp:temp action_values[0].find(',')

# After the loop, set the player's permissions to the newly built list.
data modify storage vp:temp target_player.permissions set from storage vp:temp new_perms

# If no comma is found, process the whole string as the last permission.
execute if score @s vp_match matches -1 run data modify storage vp:temp perm_to_remove set from storage vp:temp action_values
execute if score @s vp_match matches -1 run data modify storage vp:temp action_values set value ''

# If a comma is found, split the string.
execute if score @s vp_match matches 0.. run function vp:zz_rebuild_players_split_string

# Rebuild the permissions list, removing the current `perm_to_remove`.
data modify storage vp:temp new_perms set value []
function vp:zz_rebuild_permissions_list_loop
data modify storage vp:temp original_perms set from storage vp:temp new_perms

# Loop again for the next permission.
function vp:zz_rebuild_players_remove_multiple_perms