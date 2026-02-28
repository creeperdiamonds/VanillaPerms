# create_group.mcfunction
# expects the name of the new group to be stored as a string in
# storage vp:temp arg before this function is invoked.
# (see documentation / vp:set_arg helpers if provided)

# if arg is empty, abort with error
execute if data storage vp:temp {arg:""} run tellraw @s ["",{"text":"[ERROR] ","color":"red"},{"text":"No group name specified. Use /trigger and set vp:temp arg first."}]
execute unless data storage vp:temp {arg:""} run function vp:create_group_continue

# clear the temp argument to avoid reusing accidentally
data modify storage vp:temp arg set value ""

tag @s remove vp_arg1_processed

