# join_group_update.mcfunction
# at this point vp_found_index holds the group index
# determine target player UUID (default to executor) as a 4-part integer array
execute store result storage vp:temp current_uuid[0] int 1.0 run data get entity @s UUID[0]
execute store result storage vp:temp current_uuid[1] int 1.0 run data get entity @s UUID[1]
execute store result storage vp:temp current_uuid[2] int 1.0 run data get entity @s UUID[2]
execute store result storage vp:temp current_uuid[3] int 1.0 run data get entity @s UUID[3]

# search for player entry
function vp:find_player

# if not found, append a new entry
execute if score @s vp_found_index matches -1 run function vp:join_group_addnew
execute unless score @s vp_found_index matches -1 run function vp:join_group_apply
