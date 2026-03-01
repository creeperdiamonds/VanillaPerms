# vp:util/zz_find_in_list_loop
# Internal recursive loop for the generic find utility.

# --- Stop Condition: List is empty ---
execute unless data storage vp:temp _find.workspace_list[0] run function vp:util/zz_find_in_list_end

# --- Comparison ---
# Get the value from the current object in the list using the specified search path.
data modify storage vp:temp _find.current_value set from storage vp:temp _find.workspace_list[0].$(search_path)

# Compare it with the search value. If they match, success score is 0.
execute store success score @s vp_match run data modify storage vp:temp _find.current_value set from storage vp:temp _find.search_value

# --- Handle Match ---
execute if score @s vp_match matches 0 run scoreboard players set @s vp_found 1
execute if score @s vp_match matches 0 run scoreboard players operation @s vp_found_index = @s vp_loop
execute if score @s vp_match matches 0 run function vp:util/zz_find_in_list_end

# --- Continue Loop (No Match) ---
execute if score @s vp_match matches 1 run scoreboard players add @s vp_loop 1
execute if score @s vp_match matches 1 run data remove storage vp:temp _find.workspace_list[0]
execute if score @s vp_match matches 1 run function vp:util/zz_find_in_list_loop