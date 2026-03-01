# find_player.mcfunction
# Searches the players array for the UUID stored in storage vp:temp current_uuid.
# This function now uses a generic list search utility.
# Results:
#   scoreboard vp_found = 1 if found, 0 otherwise.
#   scoreboard vp_found_index = index of matching element, or -1.

# The generic find utility cannot compare UUIDs directly because they are integer arrays.
# We must fall back to the old, specialized loop for this.
# A future refactor could involve converting UUIDs to strings for generic comparison.

## --- Setup for generic find (DISABLED for UUIDs) ---
# data modify storage vp:temp _find.source_list set from storage vp:players players
# data modify storage vp:temp _find.search_path set value "uuid"
# data modify storage vp:temp _find.search_value set from storage vp:temp current_uuid
# function vp:util/find_in_list

## --- Using old loop for UUID comparison ---
scoreboard players set @s vp_found 0
scoreboard players set @s vp_found_index -1
scoreboard players set @s vp_loop 0
data modify storage vp:temp find_player_temp set from storage vp:players players
function vp:find_player_loop
