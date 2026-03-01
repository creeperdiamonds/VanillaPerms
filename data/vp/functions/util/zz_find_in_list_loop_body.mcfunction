# vp:util/zz_find_in_list_loop_body
# The core logic of the find_in_list loop, separated to be reusable.

# --- Handle Match ---
execute if score @s vp_match matches 0 run scoreboard players set @s vp_found 1
execute if score @s vp_match matches 0 run scoreboard players operation @s vp_found_index = @s vp_loop
execute if score @s vp_match matches 0 run function vp:util/zz_find_in_list_end

# --- Continue Loop (No Match) ---
execute if score @s vp_match matches 1 run scoreboard players add @s vp_loop 1
execute if score @s vp_match matches 1 run data remove storage vp:temp _find.workspace_list[0]
execute if score @s vp_match matches 1 run function vp:util/zz_find_in_list_loop