# vp:util/zz_get_perms_finalize
# Processes the raw list of permissions to handle wildcards and negatives.

# --- 1. Initialization ---
# Create temporary lists for processing.
data modify storage vp:temp _perms set value {positive:[], negative:[], final_list:[]}

# --- 2. Separate positive and negative permissions ---
function vp:util/zz_get_perms_finalize_separate

# --- 3. Process wildcards and duplicates from the positive list ---
function vp:util/zz_get_perms_finalize_process_positives

# --- 4. Apply negative permissions ---
# This will remove any negated permissions from the final list.
function vp:util/zz_get_perms_finalize_apply_negatives

# --- 5. Final Cleanup ---
# Replace the original list with the new, cleaned-up list.
data modify storage vp:temp effective_permissions set from storage vp:temp _perms.final_list

# Clean up temporary data.
data remove storage vp:temp _perms
data remove storage vp:temp processed_groups
data remove storage vp:temp arg