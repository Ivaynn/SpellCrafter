#> [tick] as player, at @s
# Executed if player is at arena (state 2)


# Reset mana scores on tick to prevent use of Mana Cookie
scoreboard players set @s spellcrafter.max_mana 10000
scoreboard players set @s spellcrafter.mana_reg 25


# Void death
execute at @s unless entity @s[y=-61,dy=45] run damage @s 1000000 minecraft:out_of_world


# Triggers
scoreboard players enable @s spawn
scoreboard players enable @s queue
scoreboard players enable @s private

execute if score @s spawn matches 1.. run function scarena:as_player/state/join/lobby
scoreboard players set @s spawn 0


# Inventory
item replace entity @s inventory.0 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.1 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.2 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.3 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.4 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.5 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.6 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.7 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.8 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.9 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.10 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.11 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.12 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.13 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.14 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.15 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.16 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.17 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.18 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.19 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.20 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.21 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.22 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.23 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.24 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.25 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
item replace entity @s inventory.26 with minecraft:red_stained_glass_pane[minecraft:tooltip_display={hide_tooltip:true}]
