# vp:tick_players.mcfunction
# Runs every tick for every player to apply effects from flags.

# --- Ability Flags ---
# AllowFlight
execute as @a if score @s vp_flag_AllowFlight matches 1 run ability @s mayfly true
execute as @a if score @s vp_flag_AllowFlight matches 0 run ability @s mayfly false

# --- Effect Flags ---
# InstantBreak
execute as @a if score @s vp_flag_InstantBreak matches 1 run effect give @s minecraft:haste 1 100 true
execute as @a if score @s vp_flag_InstantBreak matches 0 run effect clear @s minecraft:haste

# IsInvulnerable
execute as @a if score @s vp_flag_IsInvulnerable matches 1 run effect give @s minecraft:resistance 1 5 true
execute as @a if score @s vp_flag_IsInvulnerable matches 0 run effect clear @s minecraft:resistance

# NoHunger
execute as @a if score @s vp_flag_NoHunger matches 1 run effect give @s minecraft:saturation 1 1 true
execute as @a if score @s vp_flag_NoHunger matches 0 run effect clear @s minecraft:saturation
