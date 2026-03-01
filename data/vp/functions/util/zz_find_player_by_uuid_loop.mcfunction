# vp:util/zz_find_player_by_uuid_loop
# Internal recursive loop for finding a player by UUID.
# This is a specialized version of the generic find_in_list_loop that handles UUID array to string conversion.

# --- Setup on first run ---
execute unless score @s vp_loop matches 1.. run scoreboard players set @s vp_found 0
execute unless score @s vp_loop matches 1.. run scoreboard players set @s vp_found_index -1
execute unless score @s vp_loop matches 1.. run scoreboard players set @s vp_loop 0
execute unless score @s vp_loop matches 1.. run data modify storage vp:temp _find.workspace_list set from storage vp:temp _find.source_list

# --- Stop Condition: List is empty ---
execute unless data storage vp:temp _find.workspace_list[0] run function vp:util/zz_find_in_list_end

# --- Comparison ---
# Get the UUID from the current player object and convert it to a string for comparison.
data modify storage vp:temp _find.current_value set from storage vp:temp _find.workspace_list[0].uuid

# Compare it with the search value (which is already a string). If they match, success score is 0.
execute store success score @s vp_match run data modify storage vp:temp _find.current_value set from storage vp:temp _find.search_value

# --- Delegate to the standard loop's logic for handling match/no-match ---
function vp:util/zz_find_in_list_loop_body