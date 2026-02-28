# vp:create_group_do_create.mcfunction
# This function performs the actual creation of a new group after checks have passed.

# Append a new, empty group object. Default flags will be applied by a different function.
data modify storage vp:groups groups append value {name:"", permissions:[], flags:{}, rank:{Chat:null, Tab:null, Player:null}}

# Copy the group name from the temporary argument into the 'name' field of the new group (which is the last one in the list).
execute store result storage vp:groups groups[-1].name string 1 run data get storage vp:temp arg

# Tell the player the group was created.
tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Group created: '","color":"gray"},{"storage":"vp:temp","nbt":"arg","color":"yellow"},{"text":"'","color":"gray"}]

# (This function does not clean up temp storage, the calling function should)
