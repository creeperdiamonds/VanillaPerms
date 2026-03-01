# vp:util/zz_get_next_node_loop
# Internal recursive loop to extract the first node from a string.
#
# Expects:
#   - storage vp:temp _zz_source_copy: The string being processed.
#
# Modifies:
#   - storage vp:temp _zz_node_builder: Builds the node string.
#   - storage vp:temp _zz_source_copy: Is consumed character by character.

# --- Stop Condition 1: Source string is empty ---
# If the source is empty, we've processed the whole string.
execute unless data storage vp:temp _zz_source_copy run return 0

# --- Get the next character ---
data modify storage vp:temp _zz_char set from storage vp:temp _zz_source_copy
data modify storage vp:temp _zz_char set from storage vp:temp _zz_source_copy

# --- Stop Condition 2: Character is a dot ---
# If we find a dot, the node is complete. Remove the dot from the source and stop.
execute if data storage vp:temp {_zz_char:"."} run data remove storage vp:temp _zz_source_copy 
execute if data storage vp:temp {_zz_char:"."} run data remove storage vp:temp _zz_source_copy 
execute if data storage vp:temp {_zz_char:"."} run return 0

# --- Continue Building ---fom string
# The character is not a dot. Append it to our node d remove it from the source.
data modify storage vp:temp _zz_node_builder append string storage vp:temp _zz_source_copy 0 1
data remove storage vp:temp _zz_source_copy 
data modify storage vp:temp _zz_node_builder append from storage vp:temp _zz_source_copy 
data remove storage vp:temp _zz_source_copy 
function vp:util/zz_get_next_node_loop