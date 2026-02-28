# create_group.mcfunction
# expects the name of the new group to be stored as a string in
# storage vp:temp arg before this function is invoked.
# (see documentation / vp:set_arg helpers if provided)

# read the requested name into the "arg" scoreboard for comparisons
execute store result score @s vp_arg1 run data get storage vp:temp arg

# if arg is empty, abort with error
execute if score @s vp_arg1 matches 0 run tellraw @s ["",{"text":"[VP] ","color":"red"},{"text": "No group name specified. Use /trigger and set vp:temp arg first."}]
execute unless score @s vp_arg1 matches 0 run function vp:create_group_continue

# clear the temp argument to avoid reusing accidentally
data modify storage vp:temp arg set value ""

tag @s remove vp_arg1_processed

