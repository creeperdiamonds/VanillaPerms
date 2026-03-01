# vp:zz_rebuild_groups_modify_target
# Internal helper that applies the specified action to the target group.

data modify storage vp:temp target_group set from storage vp:temp temp_groups[0]
execute if data storage vp:temp {action:"permission_add"} run data modify storage vp:temp target_group.permissions append from storage vp:temp action_values
execute if data storage vp:temp {action:"flag_set"} run data modify storage vp:temp target_group.flags merge from storage vp:temp action_values
execute if data storage vp:temp {action:"set_inheritance"} run data modify storage vp:temp target_group.inherits set from storage vp:temp action_values
execute if data storage vp:temp {action:"permission_remove"} run function vp:zz_rebuild_groups_remove_perm_helper
execute if data storage vp:temp {action:"permission_clear"} run data modify storage vp:temp target_group.permissions set value []
execute if data storage vp:temp {action:"flag_clear"} run data modify storage vp:temp target_group.flags set value {}
execute if data storage vp:temp {action:"rename"} run data modify storage vp:temp target_group.name set from storage vp:temp new_name
execute if data storage vp:temp {action:"rank_set"} run data modify storage vp:temp target_group.rank merge from storage vp:temp action_values
data modify storage vp:temp new_groups append from storage vp:temp target_group