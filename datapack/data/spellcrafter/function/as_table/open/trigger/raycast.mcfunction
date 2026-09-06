#> as player, raycast
#> recursive function (limited by scores "$iter spellcrafter.tmp")


# Check nearby tables
execute positioned ~ ~.5 ~ as @e[distance=..1,sort=nearest,type=minecraft:item_display,tag=spellcrafter.table] if score $iter spellcrafter.tmp matches 0.. at @s positioned ~ ~-1 ~ if predicate spellcrafter:is_open_barrel run function spellcrafter:as_table/open/trigger/confirm


# Next iteration
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. positioned ^ ^ ^0.2 run function spellcrafter:as_table/open/trigger/raycast
