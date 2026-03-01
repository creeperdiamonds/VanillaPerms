# vp:util/has_permission
# Checks if the executing player has a specific permission.
# Expects:
# - `storage vp:temp permission_to_check` (string): The permission node to check.
# Results:
# - `scoreboard @s vp_has_permission` = 1 if permission is granted, 0 otherwise.

# --- 1. Initialization ---
scoreboard players set @s vp_has_permission 0

# --- 2. Gather all permissions ---
# This populates `storage vp:temp effective_permissions`.
function vp:util/get_effective_permissions

# --- 3. Two-Pass Permission Check ---
# First, check for an explicit deny. If one is found, we can stop immediately.
data modify storage vp:temp _check.deny_found set value 0b
function vp:util/zz_has_permission_check_deny_loop
execute if score @s vp_has_permission matches 1 run function vp:util/zz_has_permission_cleanup

# If no explicit deny was found, check for a grant.
function vp:util/zz_has_permission_check_grant_loop

# --- 4. Cleanup ---
function vp:util/zz_has_permission_cleanup

function vp:util/zz_has_permission_cleanup
data remove storage vp:temp effective_permissions
data remove storage vp:temp permission_to_check
data remove storage vp:temp groups_to_process