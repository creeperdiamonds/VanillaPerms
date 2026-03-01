# vp:util/get_flag_value
# Retrieves the effective value of a flag for a player (@s).
# Expects the flag name (string) to be in `storage vp:temp flag_query`.
# The flag name must correspond to a scoreboard objective (e.g., "AllowFlight" -> "vp_flag_AllowFlight").
# Result is stored in the `vp.flag_result` score for @s (1 for true, 0 for false).

# 1.  stores them in the player's scoreboards (e.g., vp_flag_AllowFlight).
function vp:util/recalculate_player_flags

# 2. Get the value from the corresponding scoreboard.
# This is a dynamic lookup. We construct the scoreboard name and then read from it.
# Tnte if data storage vp:temp {flag_query:"AllowFlight"} run scoreboard players operation @s vp.flag_result = @s vp_flag_AllowFlight
execute if data storage vp:temp {flag_query:"InstantBreak"} run scoreboard players operation @s vp.flag_result = @s vp_flag_InstantBreak
execute if data storage vp:temp {flag_query:"IsInvulnerable"} run scoreboard players operation @s vp.flag_result = @s vp_flag_IsInvulnerable
# ... add other flags here as needed