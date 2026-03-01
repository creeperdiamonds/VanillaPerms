# leave_group.mcfunction
# Removes the executing player from their group by deleting their entry from players.json.
# This causes them to fall back to the 'default' group.
# This function has been refactored for simplicity and efficiency.

# Get the player's UUID and search for them in players.json.
execute store result storage vp:temp current_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp current_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp current_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp current_uuid[3] int 1.0 run data get entity @s UUID[3]
function vp:find_player

# If the player was not found, they are already in the default group.
execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"You are not in a custom group."}]
execute if score @s vp_found matches 0 run return 0

# If the player was found, start the process to remove their entry by rebuilding the list.
execute if score @s vp_found matches 1 run function vp:leave_group_rebuild

# Recalculate flags to apply the 'default' group's settings.
function vp:player_recalculate_flags

# Clean up temp storage.
data remove storage vp:temp current_uuid
