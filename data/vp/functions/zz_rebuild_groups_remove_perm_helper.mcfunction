# vp:zz_rebuild_groups_remove_perm_helper
# Internal helper to rebuild a group's permission list after removing a permission.

data modify storage vp:temp original_perms set from storage vp:temp target_group.permissions
data modify storage vp:temp new_perms set value []
data modify storage vp:temp perm_to_remove set from storage vp:temp action_values
function vp:zz_rebuild_permissions_list_loop
data modify storage vp:temp target_group.permissions set from storage vp:temp new_perms