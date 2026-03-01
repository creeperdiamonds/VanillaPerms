# vp:zz_rebuild_groups_split_string
# Internal helper to split the action_values string by the first comma.
# Expects:
# - storage vp:temp action_values (string): The string to split.
# - score @s vp_match: The index of the comma.
# Results:
# - storage vp:temp perm_to_remove: The part of the string before the comma.
# - storage vp:temp action_values: The part of the string after the comma.

data modify storage vp:temp perm_to_remove set from storage vp:temp action_values
data modify string storage vp:temp perm_to_remove 0 -1
data modify string storage vp:temp action_values 0 1