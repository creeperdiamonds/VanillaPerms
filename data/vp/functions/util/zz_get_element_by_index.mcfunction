# vp:util/zz_get_element_by_index
# Internal helper to get an element from a list using a scoreboard index.
# Expects:
# - storage vp:temp _temp_player_list: The list to read from.
# - score @s vp_tmp: The index of the element to get.
# Result: The target element will be at `_temp_player_list[0]`.

execute if score @s vp_tmp matches 1.. run data remove storage vp:temp _temp_player_list[0]
execute if score @s vp_tmp matches 1.. run scoreboard players remove @s vp_tmp 1
execute if score @s vp_tmp matches 1.. run function vp:util/zz_get_element_by_index