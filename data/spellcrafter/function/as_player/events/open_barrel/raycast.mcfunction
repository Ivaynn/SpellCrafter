#> as player, raycast
#> recursive function (limited by scores "$iter spellcrafter.tmp", "$success spellcrafter.tmp")


# Check nearby tables
execute positioned ~ ~.5 ~ as @e[distance=..1,sort=nearest,type=minecraft:block_display,tag=spellcrafter.table] if score $success spellcrafter.tmp matches 0 at @s positioned ~ ~-1 ~ if predicate spellcrafter:is_open_barrel store result score $success spellcrafter.tmp run function spellcrafter:as_player/events/open_barrel/confirm


# Next iteration
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. unless score $success spellcrafter.tmp matches 1 positioned ^ ^ ^0.2 run function spellcrafter:as_player/events/open_barrel/raycast
