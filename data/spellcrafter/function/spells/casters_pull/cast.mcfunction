#> as projectile, on summon, at @s

execute at @s positioned ~ ~-1 ~ facing entity @e[limit=1,distance=..100,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,tag=!spellcrafter.spectator,predicate=spellcrafter:match_id] feet run tp @s ~ ~1 ~ ~ ~
