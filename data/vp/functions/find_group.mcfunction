# find_group.mcfunction
# Searches the groups array for the name stored in storage vp:temp arg.
# This now uses the generic find_in_list utility.
# Results:
#   scoreboard vp_found = 1 if found else 0
#   scoreboard vp_found_index = index of matching element (0-based)

# --- Setup for generic find ---
data modify storage vp:temp _find.source_list set from storage vp:groups groups
data modify storage vp:temp _find.search_path set value "name"
data modify storage vp:temp _find.search_value set from storage vp:temp arg

# --- Execute generic find ---
function vp:util/find_in_list
