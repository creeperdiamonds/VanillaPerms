# vp:tick
# Main function running every tick.

# 1. Run per-player tick operations (ranks, effects, etc.)
function vp:tick_players

# 2. Detect and handle command input
# We'll use a placeholder objective `vp.cmd` for now.
# This will be replaced by a system that reads from the config.
execute as @a[scores={vp=1..}] run function vp:command/init

# 3. Enforce server rules based on flags
function vp:enforce_selectors
