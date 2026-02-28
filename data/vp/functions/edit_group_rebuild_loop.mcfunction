# edit_group_rebuild_loop.mcfunction
# Recursively rebuilds the groups list to modify one entry.

# Stop condition: If the temp list is empty, the rebuild is done.
execute unless data storage vp:temp temp_groups[0] run return 0

# Check if the current group is the one we want to modify.
execute if score @s vp_rebuild_loop = @s vp_found_index run block
    # This is the target group.
    # Copy it for modification.
    data modify storage vp:temp target_group set from storage vp:temp temp_groups[0]

    # --- ACTION DISPATCHER ---
    # Perform the modification based on the 'action' value.
    execute if data storage vp:temp {action:"permission_add"} run data modify storage vp:temp target_group.permissions append from storage vp:temp action_values
    execute if data storage vp:temp {action:"flag_set"} run data modify storage vp:temp target_group.flags merge from string storage vp:temp action_values
    execute if data storage vp:temp {action:"permission_remove"} run block
        # To remove a permission, we must rebuild the permissions list.
        # 1. Set up the inputs for the permissions loop helper.
        data modify storage vp:temp original_perms set from storage vp:temp target_group.permissions
        data modify storage vp:temp new_perms set value []
        data modify storage vp:temp perm_to_remove set from storage vp:temp action_values

        # 2. Call the helper to do the inner loop.
        function vp:zz_rebuild_permissions_list_loop

        # 3. Replace the old permissions list with the newly created one.
        data modify storage vp:temp target_group.permissions set from storage vp:temp new_perms

        # 4. Clean up temp storage used by the helper.
        data remove storage vp:temp original_perms
        data remove storage vp:temp new_perms
        data remove storage vp:temp perm_to_remove
    end

    # Append the MODIFIED group to the new list.
    data modify storage vp:temp new_groups append from storage vp:temp target_group
    
    # Skip the default append below to avoid duplicating the entry.
    tag @s add vp_processed_target
end

# If it's not the target group, just append it to the new list unmodified.
execute unless entity @s[tag=vp_processed_target] run data modify storage vp:temp new_groups append from storage vp:temp temp_groups[0]

# Clean up the tag used for skipping.
tag @s remove vp_processed_target

# Increment counter, remove the processed group from the temp list, and recurse.
scoreboard players add @s vp_rebuild_loop 1
data remove storage vp:temp temp_groups[0]
function vp:edit_group_rebuild_loop
