#> as projectile, on summon, at @s
# instant cast


# Heal targets
effect give @e[distance=..4,type=!#isc:untargetable,type=!#minecraft:undead] minecraft:instant_health 1 0 true
effect give @e[distance=..4,type=#minecraft:undead,type=!#isc:untargetable] minecraft:instant_health 1 0 true


# Effects
particle minecraft:heart ^ ^ ^ 0.5 0.5 0.5 0.4 5 force @a
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1.5
