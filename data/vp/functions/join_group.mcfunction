# join_group.mcfunction
# Add the executor (or a target specified in vp:temp.target_uuid) to the named
# group.  The group name is read from vp:temp.arg, as with the other
# functions.  If the player is not already in players.json the entry is
# created.  After membership changes the player's effective permissions,
# flags and ranks may be recalculated by calling the appropriate helper
# functions (apply_group_permissions/apply_group_flags).
#
# Example sequence:
#   data modify storage vp:temp arg set value "default"
#   trigger vp set 3
#
# If a specific player should be targeted the caller can set
# vp:temp.target_uuid beforehand (the function will default to @s).

# retrieve group name and optional target uuid
# store it into a dedicated variable used by the helpers below
execute store result storage vp:temp group_arg string 1 run data get storage vp:temp arg

# if the group name is empty, abort
execute if data storage vp:temp group_arg value matches "" run tellraw @s ["",{"text":"[VP] ","color":"red"},{"text":"No group name provided."}]
execute unless data storage vp:temp group_arg value matches "" run function vp:join_group_find

# clear the temp argument so it doesn't linger
data modify storage vp:temp arg set value ""

