# find_group_end.mcfunction
# finishes search; if nothing found, vp_found_index remains -1
execute unless score @s vp_found matches 1 run scoreboard players set @s vp_found_index -1
# cleanup loop counter
scoreboard players set @s vp_loop 0
