#> as projectile, on summon, at @s

execute at @s positioned ~ ~-1 ~ run rotate @s facing entity @e[limit=1,distance=0.1..30,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] feet
