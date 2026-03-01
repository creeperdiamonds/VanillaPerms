# vp:zz_recalc_flags_for_group_members_single.mcfunction
# This function is run for each online player (@s) to check if they
# are a member of the group that was just edited.

# This utility function will find the current player (@s) in the players
# storage and place their group name in 'storage vp:temp current_player_group'.
function vp:zz_util_get_player_group_name

# The edited group name is in 'storage vp:temp arg'.
# The player's group name is now in 'storage vp:temp current_player_group'.
execute if data storage vp:temp current_player_group run data modify storage vp:temp cmp set from storage vp:temp current_player_group
execute if data storage vp:temp current_player_group run execute store success score @s vp_match run data modify storage vp:temp cmp set from storage vp:temp arg

# If match (success=0), then this player is a member. Recalculate their flags.
execute if data storage vp:temp current_player_group run execute if score @s vp_match matches 0 run function vp:player_recalculate_flags

# Clean up the temp storage used by this check.
data remove storage vp:temp current_player_group
