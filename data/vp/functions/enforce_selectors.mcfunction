# vp:enforce_selectors
# Runs every tick to enforce the selector usage rule.

# Find all players who do NOT have the AllowSelectors flag (score = 0)
# and are holding a command block, then clear it from their inventory.
execute as @a[scores={vp_AllowSelectors=0},nbt={SelectedItem:{id:"minecraft:command_block"}}] run clear @s minecraft:command_block