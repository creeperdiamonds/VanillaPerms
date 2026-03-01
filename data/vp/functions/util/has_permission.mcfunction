# vp:util/has_permission
# Checks if the executing player has a specific permission.
# Expects:
# - `storage vp:temp permission_to_check` (string): The permission node to check.
# Results:
# - `scoreboard @s vp_has_permission` = 1 if permission is granted, 0 otherwise.

# --- 1. Initialization ---
scoreboard players set @s vp_perm_denied 0
scoreboard players set @s vp_perm_granted 0

# --- 2. Gather all permissions ---
# This populates `storage vp:temp effective_permissions`.
function vp:util/get_effective_permissions

# --- 3. Check Permissions ---
# This single loop checks for both grants and denies.
# It will set vp_perm_granted and vp_perm_denied scores.
function vp:util/zz_has_permission_loop

# --- 4. Final Result ---
# Permission is granted if a grant was found AND no deny was found.
scoreboard players set @s vp_has_permission 0
execute if score @s vp_perm_granted matches 1 if score @s vp_perm_denied matches 0 run scoreboard players set @s vp_has_permission 1

# --- 5. Cleanup ---
function vp:util/zz_has_permission_cleanup