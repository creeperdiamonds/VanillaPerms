# vp:util/get_effective_permissions
# Gathers all permissions for the executing player, including from their group,
# inheritance, and personal overrides. The result is stored in a list at
# `storage vp:temp effective_permissions`.

# --- 1. Initialization ---
# Clear/create the lists we will be working with.
data modify storage vp:temp effective_permissions set value []
data modify storage vp:temp groups_to_process set value []
data modify storage vp:temp processed_groups set value [] 
# ^^^ To prevent infinite inheritance loops

# --- 2. Find Player's Group and Personal Permissions ---
# This helper will find the player, add their group to groups_to_process,
# and store their personal permissions in a temporary spot.
function vp:util/zz_get_perms_find_player_info

# --- 3. Process Group Inheritance ---
# This loop will process all groups in groups_to_process, adding their
# permissions and any groups they inherit from.
function vp:util/zz_get_perms_process_groups_loop

# --- 4. Apply Player's Personal Permissions ---
# This adds the player's specific permissions to the list.
function vp:util/zz_get_perms_apply_player_perms

# --- 5. Finalize Permissions ---
# This handles wildcards and negative permissions to create the final list.
function vp:util/zz_get_perms_finalize