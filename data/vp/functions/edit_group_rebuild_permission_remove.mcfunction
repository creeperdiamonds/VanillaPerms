# edit_group_rebuild_permission_remove.mcfunction
# Removes permissions from the target group during rebuild loop.
# Called from edit_group_rebuild_loop when action is "permission_remove".
# Expects: vp:temp target_group (the group being modified)
# Expects: vp:temp action_values (list of permissions to remove)

# Initialize a counter to iterate through action_values.
scoreboard players set @s vp_perm_remove_loop 0

# Call the removal loop.
function vp:edit_group_rebuild_permission_remove_loop
