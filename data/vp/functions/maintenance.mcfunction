# vp:command/book/maintenance
tellraw @s {"text":"Choose an option:","color":"gold"}
tellraw @s ["",{"text":"[Turn On]","color":"red","click_event":{"action":"suggest_command","command":"/function vp:maintenance {mode:\"on\"}"}},{"text":" | "},{"text":"[Turn Off]","color":"green","click_event":{"action":"suggest_command","command":"/function vp:maintenance {mode:\"off\"}"}}]