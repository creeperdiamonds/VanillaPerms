# leave_group.mcfunction
# remove the executor from their current group

# determine UUID of executor as a 4-part integer array
execute store result storage vp:temp current_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp current_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp current_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp current_uuid[3] int 1.0 run data get entity @s UUID[3]

# search for their entry
function vp:find_player

execute if score @s vp_found_index matches -1 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"You are not in any group."}]
execute unless score @s vp_found_index matches -1 run function vp:leave_group_do

