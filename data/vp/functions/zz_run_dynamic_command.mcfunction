# vp:zz_run_dynamic_command
# Executes a command that has been dynamically built and stored in `storage vp:temp command_to_run`.
# This is a workaround for the inability to use storage values directly in parts of commands.

# This requires a command block to execute the command from storage.
# We place a command block, set its command, trigger it, and then remove it.
setblock ~ ~ ~ command_block
data modify block ~ ~ ~ Command set from storage vp:temp command_to_run
setblock ~ ~ ~ redstone_block
setblock ~ ~ ~ air