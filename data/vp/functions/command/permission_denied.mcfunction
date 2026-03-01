# vp:command/permission_denied
# Displays a standard "permission denied" error message.
# Expects:
#   - storage vp:temp permission_to_check: The permission that was denied.

tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"You do not have permission to use this command. Required: "},{"storage":"vp:temp","nbt":"permission_to_check","color":"yellow"}]