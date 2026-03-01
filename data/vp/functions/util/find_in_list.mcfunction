# vp:util/find_in_list
# Generic utility to find an item in a list of objects.
#
# Expects the following to be set in `storage vp:temp`:
#   - _find.source_list (list): The list to search through (e.g., from storage vp:groups groups).
#   - _find.search_path (string): The NBT path of the field to compare inside each object (e.g., "name").
#   - _find.search_value (any): The value to search for (e.g., "admin").
#
# Results:
#   - scoreboard @s vp_found = 1 if found, 0 otherwise.
#   - scoreboard @s vp_found_index = index of matching element, or -1.

# --- Setup ---
scoreboard players set @s vp_found 0
scoreboard players set @s vp_found_index -1
scoreboard players set @s vp_loop 0

# Copy the source list to a temporary workspace to avoid modifying the original.
data modify storage vp:temp _find.workspace_list set from storage vp:temp _find.source_list

# --- Execution ---
function vp:util/zz_find_in_list_loop