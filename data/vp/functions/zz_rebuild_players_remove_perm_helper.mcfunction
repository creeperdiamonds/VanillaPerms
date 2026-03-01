# vp:zz_rebuild_players_remove_perm_helper
# Internal helper to rebuild a player's permission list after removing a permission.
# Expects:
# - storage vp:temp target_player
# - storage vp:temp action_values (the permission to remove)
data modify storage vp:temp original_perms set from storage vp:temp target_player.permissions
data modify storage vp:temp new_perms set value []
data modify storage vp:temp perm_to_remove set from storage vp:temp action_values
function vp:zz_rebuild_permissions_list_loop
data modify storage vp:temp target_player.permissions set from storage vp:temp new_perms