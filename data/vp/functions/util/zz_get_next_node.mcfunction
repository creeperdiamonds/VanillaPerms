# vp:util/zz_get_next_node
# Internal utility to get the first node (substring before '.') from a string.
#
# Expects from calling function (via function-macro):
#   - id (string): The destination path in `vp:temp` to store the node.
#   - source (string): The source path in `vp:temp` to read from.
#
# Modifies:
#   - storage vp:temp $(id): Stores the extracted node.
#   - storage vp:temp $(source): The source string with the extracted node and delimiter removed.

# --- Setup ---
# Initialize a temporary builder string and copy the source string to a workspace.
data modify storage vp:temp _zz_node_builder set value ""
data modify storage vp:temp _zz_source_copy set from storage vp:temp $(source)

# --- Execution ---
# Start the recursive loop to find the first node.
function vp:util/zz_get_next_node_loop

# --- Finalization ---
# The loop is done. The extracted node is in _zz_node_builder and the remainder is in _zz_source_copy.
data modify storage vp:temp $(id) set from storage vp:temp _zz_node_builder
data modify storage vp:temp $(source) set from storage vp:temp _zz_source_copy

# --- Cleanup ---
data remove storage vp:temp _zz_node_builder
data remove storage vp:temp _zz_source_copy
data remove storage vp:temp _zz_char