# join_group_addnew.mcfunction
# append new player entry with default fields and set group

# create object
data modify storage vp:players players append value {uuid:"",group:"",permissions:[],flags:{},rank:{Chat:null,Tab:null,Player:null}}
# fill fields
data modify storage vp:players players[-1].uuid set from storage vp:temp current_uuid
data modify storage vp:players players[-1].group set from storage vp:temp group_arg

tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"You joined group "},{"storage":"vp:temp","nbt":"group_arg","color":"yellow"}]

# Recalculate the player's flags now that their group is set.
function vp:player_recalculate_flags
