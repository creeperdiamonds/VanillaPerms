# vp:util/get_flag_value
# Retrieves the effective value of a flag for a player (@s).
# Expects the flag name (string) to be in `storage vp:temp flag_query`.
# Result is stored in the `vp.flag_result` score for @s (1 for true, 0 for false).

# 1. Start with the default flags from config.
data modify storage vp:temp effective_flags set from storage vp:config DefaultFlags

# 2. Find the player's data.
function vp:util/find_player_by_uuid
execute if score @s vp.flag_result matches 1 run function vp:util/process_player_for_flags

# If player is not in players.json, they are in the 'default' group.
execute if score @s vp.flag_result matches 0 run data modify storage vp:temp search_group_name set value '"default"'

# 3. Find the group's data.
function vp:util/find_group_by_name
execute if score @s vp.flag_result matches 1 run data modify storage vp:temp effective_flags merge from storage vp:temp found_group_data.flags

# 4. Merge the player's flags (if they were found).
execute if data storage vp:temp found_player_data run data modify storage vp:temp effective_flags merge from storage vp:temp found_player_data.flags

# 5. Get the final value of the queried flag.
data modify storage vp:temp final_flag_value set value {}
data modify storage vp:temp final_flag_value.query set from storage vp:temp flag_query
data modify storage vp:temp final_flag_value.value set from storage vp:temp effective_flags[$(final_flag_value.query)]

# 6. Convert boolean to score.
scoreboard players set @s vp.flag_result 0
execute if data storage vp:temp {final_flag_value:{value:true}} run scoreboard players set @s vp.flag_result 1

# 7. Cleanup.
data remove storage vp:temp flag_query
data remove storage vp:temp effective_flags
data remove storage vp:temp found_player_data
data remove storage vp:temp found_group_data
data remove storage vp:temp final_flag_value
