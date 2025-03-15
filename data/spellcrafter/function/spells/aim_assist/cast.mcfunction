#> as projectile, on summon, at @s

execute at @e[limit=1,distance=0.1..30,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run rotate @s facing ~ ~1 ~
