# vp:give_book
# Gives the player a book with a clickable UI for managing permissions.

# --- Permission Check ---
# We'll check for a general 'vp.admin' or 'vp.book' permission.
data modify storage vp:temp permission_to_check set value "vp.command.book"
function vp:util/has_permission
execute if score @s vp_has_permission matches 0 run function vp:command/permission_denied
execute if score @s vp_has_permission matches 0 run return 0

# Give the player the book defined in the loot table.
loot give @s loot vp:book
