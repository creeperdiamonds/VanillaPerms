# vp:command/init
# Executed by the player who triggered the command.
# This setup is for a sign-based command input system.

# Tag the player to identify them in subsequent functions
tag @s add vp.commander

# Reset the trigger so it doesn't run again
scoreboard players set @s vp 0

# Tell the player how to enter the command
tellraw @s ["",{"text":"[SUCCESS] ","color":"green"},{"text":"Please type your command on the sign that will appear in front of you.","color":"aqua"}]

# Run the setup for the sign input
function vp:command/setup_sign

# Schedule the read function to run in 3 seconds
schedule function vp:command/read_sign 3s
