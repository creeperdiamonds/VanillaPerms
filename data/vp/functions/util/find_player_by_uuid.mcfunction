# vp:util/find_player_by_uuid
# Finds a player in players.json by their UUID.
# Expects executing player's UUID to be used for the search.
# Stores result in `storage vp:temp found_player_data`.
# Sets `vp.flag_result` score for @s to 1 on success, 0 on failure.

# --- Setup for generic find ---
# The generic find utility cannot compare integer arrays directly.
# To work around this, we convert both the search UUID and the list's UUIDs to strings for comparison.
data modify storage vp:temp _find.source_list set from storage vp:players players
data modify storage vp:temp _find.search_path set value "uuid"

# Get the player's UUID as a string.
data modify storage vp:temp _find.search_value set value '""'
data modify storage vp:temp _find.search_value set from entity @s UUID

# --- Execute generic find ---
# We need a custom loop that stringifies the UUID from the list before comparing.
function vp:util/zz_find_player_by_uuid_loop

# --- Process Results ---
# The loop will set vp_found. We use that as our result flag.
scoreboard players operation @s vp.flag_result = @s vp_found
