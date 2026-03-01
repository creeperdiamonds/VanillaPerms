# vp:tick_players.mcfunction
# Runs every tick for every player to apply effects from flags.

# This is now optimized to loop through players only once.
execute as @a run function vp:tick_single_player
