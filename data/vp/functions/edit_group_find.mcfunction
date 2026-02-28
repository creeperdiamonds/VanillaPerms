# edit_group_find.mcfunction
# look up the group index and perform operations for edit_group
# the desired group name is stored in vp:temp arg

# since find_group expects its target in vp:temp arg we don't need to
# copy anything, just call it
function vp:find_group

execute if score @s vp_found matches 0 run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"Group not found: "},{"storage":"vp:temp","nbt":"arg","color":"yellow"}]
execute if score @s vp_found matches 1 run function vp:edit_group_apply
