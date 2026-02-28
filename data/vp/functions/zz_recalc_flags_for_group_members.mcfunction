# vp:zz_recalc_flags_for_group_members.mcfunction
# Recalculates flags for all online players who are members of the edited group.

# The edited group's name is in 'storage vp:temp arg'.

# This function is run by the command executor. It needs to iterate through
# all online players and run a check for each one.
execute as @a run function vp:zz_recalc_flags_for_group_members_single
