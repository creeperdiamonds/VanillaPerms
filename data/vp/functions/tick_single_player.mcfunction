# vp:tick_single_player.mcfunction
# Runs for each player (@s) every tick to apply effects from flags.

# --- Ability Flags ---
# AllowFlight
execute if score @s vp_flag_AllowFlight matches 1 run effect give @s minecraft:levitation 1 0 true
execute if score @s vp_flag_AllowFlight matches 0 run effect clear @s minecraft:levitation

# --- Effect Flags ---
# InstantBreak
execute if score @s vp_flag_InstantBreak matches 1 run effect give @s minecraft:haste 1 100 true
execute if score @s vp_flag_InstantBreak matches 0 run effect clear @s minecraft:haste

# IsInvulnerable
execute if score @s vp_flag_IsInvulnerable matches 1 run effect give @s minecraft:resistance 1 5 true
execute if score @s vp_flag_IsInvulnerable matches 0 run effect clear @s minecraft:resistance

# NoHunger
execute if score @s vp_flag_NoHunger matches 1 run effect give @s minecraft:saturation 1 1 true
execute if score @s vp_flag_NoHunger matches 0 run effect clear @s minecraft:saturation