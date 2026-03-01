# vp:edit_player_apply
# This function orchestrates the rebuilding of the players list to apply a modification.

# --- Setup and Execute Rebuild ---
# The action, action_values, and the player's index (vp_found_index) are already set.
function vp:zz_setup_rebuild_players

# After the loop, replace the main players list with the new one.
data modify storage vp:players players set from storage vp:temp new_players

tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Player data updated successfully."}]