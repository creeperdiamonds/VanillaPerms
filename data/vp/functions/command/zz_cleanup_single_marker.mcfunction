# vp:command/zz_cleanup_single_marker
# Executed as the specific marker entity to be cleaned up.

# Remove the sign block by reading its stored coordinates from this marker.
data modify storage vp:temp sign_pos set from entity @s data.SignPos
execute if data storage vp:temp sign_pos run summon armor_stand 0 0 0 {Tags:["vp.temp_cleanup_marker"],NoGravity:1b,Marker:1b,Invisible:1b}
execute if data storage vp:temp sign_pos run data modify entity @e[type=armor_stand,tag=vp.temp_cleanup_marker,limit=1] Pos set from storage vp:temp sign_pos
execute if data storage vp:temp sign_pos at @e[type=armor_stand,tag=vp.temp_cleanup_marker,limit=1] run setblock ~ ~ ~ air
kill @e[type=armor_stand,tag=vp.temp_cleanup_marker]
data remove storage vp:temp sign_pos

# Kill this marker entity.
kill @s