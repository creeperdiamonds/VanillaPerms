# join_group_find.mcfunction
# invoked after we know group_arg contains a name
# look up the group
execute store result storage vp:temp arg string 1 run data get storage vp:temp group_arg
function vp:find_group

# if not found, report and exit
execute if score @s vp_found_index matches -1 run tellraw @s ["",{"text":"[VP] ","color":"red"},{"text":"Group not found: "},{"storage":"vp:temp","nbt":"group_arg","color":"yellow"}]   

execute unless score @s vp_found_index matches -1 run function vp:join_group_update
