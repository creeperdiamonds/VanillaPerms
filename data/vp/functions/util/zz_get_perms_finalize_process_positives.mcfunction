# vp:util/zz_get_perms_finalize_process_positives
# Creates a clean list of positive permissions, handling wildcards and removing duplicates/redundancies.
# The result is stored in `_perms.final_list`.

# Stop condition: If the positive list is empty, we are done.
execute unless data storage vp:temp _perms.positive[0] run return 0

# Get the next permission from the positive list.
data modify storage vp:temp arg set from storage vp:temp _perms.positive[0]
data remove storage vp:temp _perms.positive[0]

# --- 1. Check for Duplicates ---
# If the permission is already in the final list, we don't need to do anything.
scoreboard players set @s vp_found 0
data modify storage vp:temp _find.source_list set from storage vp:temp _perms.final_list
data modify storage vp:temp _find.search_path set value ""
data modify storage vp:temp _find.search_value set from storage vp:temp arg
function vp:util/find_in_list
execute if score @s vp_found matches 1 run function vp:util/zz_get_perms_finalize_process_positives
execute if score @s vp_found matches 1 run return 0

# --- 2. Add the new permission ---
data modify storage vp:temp _perms.final_list append from storage vp:temp arg

# --- 3. Handle Wildcard Cleanup ---
# If the permission we just added is a wildcard, run the cleanup process.
execute if data storage vp:temp {arg:"*"} run data modify storage vp:temp _perms.wildcard_base set string storage vp:temp arg 0 -1
execute if data storage vp:temp {arg:"*"} run function vp:util/zz_get_perms_finalize_wildcard_cleanup

# Loop again.
function vp:util/zz_get_perms_finalize_process_positives