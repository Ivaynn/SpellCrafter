#> as projectile, on summon, at @s
# instant cast

effect clear @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator]

# Effects
particle minecraft:large_smoke ~ ~ ~ 1 1 1 0.3 10 force @a[distance=..100]
playsound minecraft:entity.generic.drink player @a[distance=..100] ~ ~ ~ 1 0.9
