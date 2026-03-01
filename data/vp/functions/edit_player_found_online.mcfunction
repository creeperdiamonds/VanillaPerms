# vp:edit_player_found_online
# Executed as the target player (@s) once they are found online.

# --- 1. Get Player UUID and Find in players.json ---
execute store result storage vp:temp current_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp current_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp current_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp current_uuid[3] int 1.0 run data get entity @s UUID[3]
function vp:find_player

# --- 2. Create Player Entry if it Doesn't Exist ---
# If the player is not in players.json, create a default entry for them.
execute if score @s vp_found matches 0 run data modify storage vp:players players append value {uuid:[I;0,0,0,0],group:"default",permissions:[],flags:{},rank:{Chat:null,Tab:null,Player:null}}
execute if score @s vp_found matches 0 run data modify storage vp:players players[-1].uuid set from storage vp:temp current_uuid
# After adding, we need to find them again to get their index.
execute if score @s vp_found matches 0 run function vp:find_player

# --- 3. Apply the Edit ---
# Now that we have the player's index in vp_found_index, apply the changes.
function vp:edit_player_apply