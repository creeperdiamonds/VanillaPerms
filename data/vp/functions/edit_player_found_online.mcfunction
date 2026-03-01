# vp:edit_player_found_online
# Executed AS the target player once they are found online.
# For the 'info' command, this gathers and displays their data.

# --- Gather Data ---
# Get all effective permissions for this player (@s).
function vp:util/get_effective_permissions

# --- Display Data ---
# Switch back to the original command executor to show them the message.
execute as @a[tag=vp.commander,limit=1] run tellraw @s ""
execute as @a[tag=vp.commander,limit=1] run tellraw @s {"text":"--- Player Info: ","color":"gold","extra":[{"selector":"@s","color":"white"}]}
execute as @a[tag=vp.commander,limit=1] run tellraw @s ["",{"text":"UUID: ","color":"gray"},{"text":"","extra":[{"storage":"vp:temp","nbt":"_perms.player_data.uuid"}]}]
execute as @a[tag=vp.commander,limit=1] run tellraw @s ["",{"text":"Group: ","color":"gray"},{"text":"","extra":[{"storage":"vp:temp","nbt":"_perms.player_data.group"}]}]

execute as @a[tag=vp.commander,limit=1] run tellraw @s {"text":"Personal Permissions:","color":"gray"}
execute as @a[tag=vp.commander,limit=1] run tellraw @s {"text":"","extra":[{"storage":"vp:temp","nbt":"_perms.player_data.permissions"}]}

execute as @a[tag=vp.commander,limit=1] run tellraw @s {"text":"Effective Permissions (from all sources):","color":"gray"}
execute as @a[tag=vp.commander,limit=1] run tellraw @s {"text":"","extra":[{"storage":"vp:temp","nbt":"effective_permissions"}]}
execute as @a[tag=vp.commander,limit=1] run tellraw @s ""