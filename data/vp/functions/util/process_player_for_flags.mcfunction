# --- Safety: Only process real players ---
execute unless entity @s[type=player] run return 0
# --- Reset all calculated flag scoreboards ---
scoreboard players set @s vp_AllowExecute 0
scoreboard players set @s vp_AllowExecuteForOthers 0
scoreboard players set @s vp_AllowSelectors 0
scoreboard players set @s vp_AllowFunctionCall 0
scoreboard players set @s vp_AllowTriggerUse 0
scoreboard players set @s vp_ChatRank 0
scoreboard players set @s vp_TabRank 0
scoreboard players set @s vp_PlayerRank 0
scoreboard players set @s vp_DebugMode 0
scoreboard players set @s vp_MaintenanceMode 0
# (Add more flag scoreboards here as needed)
# Find Player Group
function vp:util/find_player_by_uuid
# After this function:
# - storage vp:temp should contain playerIndex
# - storage vp:temp should contain groupName
# If player not found → stop
execute unless data storage vp:temp playerFound run return 0
# Apply Group Flags
function vp:util/find_group_by_name
# If group not found → stop
execute unless data storage vp:temp groupFound run return 0
# Copy group flags into temp working storage
data modify storage vp:temp workingFlags set from storage vp:groups groups[0].flags
# Apply Player Overrides (if any)
# If player has custom flags, merge them
execute if data storage vp:players players[0].flags run data modify storage vp:temp workingFlags merge from storage vp:players players[0].flags
# Push Working Flags To Scoreboards
# AllowExecute
execute if data storage vp:temp workingFlags{AllowExecute:true} run scoreboard players set @s vp_AllowExecute 1
# AllowExecuteForOthers
execute if data storage vp:temp workingFlags{AllowExecuteForOthers:true} run scoreboard players set @s vp_AllowExecuteForOthers 1
# AllowSelectors
execute if data storage vp:temp workingFlags{AllowSelectors:true} run scoreboard players set @s vp_AllowSelectors 1
# AllowFunctionCall
execute if data storage vp:temp workingFlags{AllowFunctionCall:true} run scoreboard players set @s vp_AllowFunctionCall 1
# AllowTriggerUse
execute if data storage vp:temp workingFlags{AllowTriggerUse:true} run scoreboard players set @s vp_AllowTriggerUse 1
# ChatRank
execute if data storage vp:temp workingFlags{ChatRank:true} run scoreboard players set @s vp_ChatRank 1
# TabRank
execute if data storage vp:temp workingFlags{TabRank:true} run scoreboard players set @s vp_TabRank 1
# PlayerRank
execute if data storage vp:temp workingFlags{PlayerRank:true} run scoreboard players set @s vp_PlayerRank 1
# DebugMode
execute if data storage vp:temp workingFlags{DebugMode:true} run scoreboard players set @s vp_DebugMode 1
# MaintenanceMode
execute if data storage vp:temp workingFlags{MaintenanceMode:true} run scoreboard players set @s vp_MaintenanceMode 1
# Optional Auto Display Update
execute if score @s vp_ChatRank matches 1 run function vp:zz_recalc_flags_apply_to_scoreboards