# vp:util/zz_get_perms_apply_player_perms
# Appends the player's personal permissions to the effective list.

# If the player had a data entry, append their personal permissions.
execute if data storage vp:temp _perms.player_data.permissions run data modify storage vp:temp effective_permissions append from storage vp:temp _perms.player_data.permissions