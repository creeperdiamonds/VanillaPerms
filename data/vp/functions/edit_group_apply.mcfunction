# edit_group_apply.mcfunction
# Main logic for applying an edit to a group.
# This function orchestrates the rebuilding of the entire groups list.

# Route to the correct logic based on the action.
execute if data storage vp:temp {action:"permission_add"} run function vp:edit_group_apply_permission_add
execute if data storage vp:temp {action:"flag_set"} run function vp:edit_group_apply_flag_set
execute if data storage vp:temp {action:"permission_remove"} run function vp:edit_group_apply_permission_remove

# Clean up action values after they have been processed.
data remove storage vp:temp action
data remove storage vp:temp action_values
