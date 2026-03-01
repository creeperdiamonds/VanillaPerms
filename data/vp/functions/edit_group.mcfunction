# vp:command/book/edit_group
tellraw @s {"text":"Choose an edit action:","color":"gold"}
tellraw @s ["",{"text":"[Add Permission]","color":"green","click_event":{"action":"suggest_command","command":"/function vp:edit_group {group:\"<group>\", action:\"add\", permission:\"<permission>\"}"}}]
tellraw @s ["",{"text":"[Remove Permission]","color":"red","click_event":{"action":"suggest_command","command":"/function vp:edit_group {group:\"<group>\", action:\"remove\", permission:\"<permission>\"}"}}]
tellraw @s ["",{"text":"[Set Flag]","color":"yellow","click_event":{"action":"suggest_command","command":"/function vp:edit_group {group:\"<group>\", action:\"flag\", flag:\"<FlagName> <true|false|reset>\"}"}}]
tellraw @s ["",{"text":"[Set Inheritance]","color":"aqua","click_event":{"action":"suggest_command","command":"/function vp:edit_group {group:\"<group>\", action:\"inherit\", parent:\"<parent_group|none>\"}"}}]
tellraw @s ["",{"text":"[Set Chat Rank]","color":"light_purple","click_event":{"action":"suggest_command","command":"/function vp:edit_group {group:\"<group>\", action:\"chat\", rank:\"<rank_name>\"}"}}]