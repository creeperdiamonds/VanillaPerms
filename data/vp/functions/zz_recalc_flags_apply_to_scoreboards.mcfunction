# vp:zz_recalc_flags_apply_to_scoreboards.mcfunction
# Takes the final merged effective_flags from storage and applies them to the player's scoreboards.

# --- New Ability/Effect Flags ---
execute store result score @s vp_flag_AllowFlight run data get storage vp:temp effective_flags.AllowFlight
execute store result score @s vp_flag_InstantBreak run data get storage vp:temp effective_flags.InstantBreak
execute store result score @s vp_flag_IsInvulnerable run data get storage vp:temp effective_flags.IsInvulnerable
execute store result score @s vp_flag_NoHunger run data get storage vp:temp effective_flags.NoHunger
execute store result score @s vp_flag_KeepInventory run data get storage vp:temp effective_flags.KeepInventory
execute store result score @s vp_flag_NoFallDamage run data get storage vp:temp effective_flags.NoFallDamage

# --- Original Configuration Flags ---
execute store result score @s vp_flag_AllowExecuteForOthers run data get storage vp:temp effective_flags.AllowExecuteForOthers
execute store result score @s vp_flag_ChatRank run data get storage vp:temp effective_flags.ChatRank
execute store result score @s vp_flag_TabRank run data get storage vp:temp effective_flags.TabRank
execute store result score @s vp_flag_HideChat run data get storage vp:temp effective_flags.HideChat
execute store result score @s vp_flag_HideTab run data get storage vp:temp effective_flags.HideTab
execute store result score @s vp_flag_HidePlayer run data get storage vp:temp effective_flags.HidePlayer
execute store result score @s vp_flag_LogCommandUse run data get storage vp:temp effective_flags.LogCommandUse
execute store result score @s vp_flag_MaxCommandTargets run data get storage vp:temp effective_flags.MaxCommandTargets

# --- Cleanup ---
# Clean up all the temporary data used in the recalculation process.
data remove storage vp:temp effective_flags
data remove storage vp:temp find_uuid
data remove storage vp:temp group_arg
data remove storage vp:temp found_player_data
data remove storage vp:temp cmp
data remove storage vp:temp cmp_uuid
