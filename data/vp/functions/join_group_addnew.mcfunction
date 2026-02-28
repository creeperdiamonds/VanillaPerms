# join_group_addnew.mcfunction
# append new player entry with default fields and set group

# create object
data modify storage vp:players players append value {uuid:"",group:"",permissions:[],flags:{},rank:{Chat:null,Tab:null,Player:null}}
# fill fields
execute store result storage vp:players players[-1].uuid string 1 run data get storage vp:temp current_uuid
execute store result storage vp:players players[-1].group string 1 run data get storage vp:temp group_arg

tellraw @s ["",{"text":"[VP] ","color":"green"},{"text":"You joined group "},{"storage":"vp:temp","nbt":"group_arg","color":"yellow"}]

# Recalculate the player's flags now that their group is set.
function vp:player_recalculate_flags
