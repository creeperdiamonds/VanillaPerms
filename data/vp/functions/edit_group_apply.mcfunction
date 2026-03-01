# edit_group_apply.mcfunction
# This function orchestrates the rebuilding of the groups list to apply a modification.
# It uses a list-rebuild because direct modification with a dynamic index is not supported.

# --- Setup and Execute Rebuild ---
# The action, action_values, and the group's index (vp_found_index) are already set.
function vp:zz_setup_rebuild_groups

# If the action was a flag set, we need to recalculate flags for all members of that group.
execute if data storage vp:temp {action:"flag_set"} run function vp:zz_recalc_flags_for_group_members

tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Group updated successfully."}]

# Clean up action values after they have been processed.
data remove storage vp:temp action
data remove storage vp:temp action_values
data remove storage vp:temp original_perms
data remove storage vp:temp new_perms
data remove storage vp:temp perm_to_remove
