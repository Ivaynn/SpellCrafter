#> as projectile, at @s

playsound minecraft:item.trident.return player @a[distance=..100] ~ ~ ~ 2 1.6
execute at @e[limit=1,distance=2..10,sort=random,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run rotate @s facing ~ ~1 ~
