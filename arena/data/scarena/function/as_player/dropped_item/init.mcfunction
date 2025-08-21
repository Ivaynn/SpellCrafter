#> as dropped item, at @s


# Each item is only processed once
tag @s add scarena.item


# Find owner and check scores
scoreboard players set $item.found_owner scarena.tmp 0
scoreboard players set $item.inf_spells scarena.tmp 0
scoreboard players set $item.player_state scarena.tmp 0
execute on origin run function scarena:as_player/dropped_item/as_thrower


# Owner not found -> ignore item
execute unless score $item.found_owner scarena.tmp matches 1 run return 0


# Find item type -> 1=wand, 2=spell, 0=other
scoreboard players set $item.type scarena.tmp 0
execute if data entity @s Item.components."minecraft:custom_data".spellcrafter.wand run scoreboard players set $item.type scarena.tmp 1
execute if score $item.type scarena.tmp matches 0 if data entity @s Item.components."minecraft:custom_data".spellcrafter.spell run scoreboard players set $item.type scarena.tmp 2


# Item is a spell and owner has infinite spells -> delete item
execute if score $item.inf_spells scarena.tmp matches 1 if score $item.type scarena.tmp matches 2 run return run kill @s


# Item is a wand or spell and owner is not in an arena -> ignore item
execute if score $item.type scarena.tmp matches 1..2 unless score $item.player_state scarena.tmp matches 3.. run return 0


# Item is not a wand and player is in game -> ignore item
execute unless score $item.type scarena.tmp matches 1 if score $item.player_state scarena.tmp matches 4 run return 0


# Teleport item to owner
tag @s add scarena.tmp
execute on origin at @s store success score $item.success scarena.tmp run tp @e[distance=..5,type=minecraft:item,tag=scarena.item,tag=scarena.tmp] @s
tag @s remove scarena.tmp


# Make item instantly picked-up by owner (or it gets deleted)
data modify entity @s Owner set from entity @s Thrower
data merge entity @s {Invulnerable:1b,Age:5990,PickupDelay:0}
