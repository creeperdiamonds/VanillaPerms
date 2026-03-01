# join_group.mcfunction
# Adds the executing player to the group specified in `storage vp:temp arg`.
# This function has been refactored for simplicity and efficiency.

# If the group name is empty, abort.
execute if data storage vp:temp {arg:""} run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"No group name provided."}]
execute if data storage vp:temp {arg:""} run return 0

# Use the generic find utility to see if the group exists.
function vp:find_group
execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Group not found: '"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"'"}]
execute if score @s vp_found matches 0 run return 0

# Get the player's UUID and search for them in players.json.
execute store result storage vp:temp current_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp current_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp current_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp current_uuid[3] int 1.0 run data get entity @s UUID[3]
function vp:find_player

# If player was found, we must rebuild the players list to update their group,
# as direct modification with a dynamic index is not supported.
execute if score @s vp_found matches 1 run data modify storage vp:temp action set value "join_group"
execute if score @s vp_found matches 1 run data modify storage vp:temp group_arg set from storage vp:temp arg
execute if score @s vp_found matches 1 run function vp:zz_setup_rebuild_players

# If player was not found, append a new entry for them.
execute if score @s vp_found matches 0 run data modify storage vp:players players append value {uuid:[I;0,0,0,0],group:"",permissions:[],flags:{},rank:{Chat:null,Tab:null,Player:null}}
execute if score @s vp_found matches 0 run data modify storage vp:players players[-1].uuid set from storage vp:temp current_uuid
execute if score @s vp_found matches 0 run data modify storage vp:players players[-1].group set from storage vp:temp arg

tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"You joined group '"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"'."}]

# Recalculate flags to apply any changes from the new group.
function vp:player_recalculate_flags

# Clean up temp storage.
data remove storage vp:temp arg
data remove storage vp:temp current_uuid
data remove storage vp:temp group_arg
