#> as projectile, on summon, at @s
# instant cast


# Heal targets
effect give @e[distance=..4,type=!#minecraft:undead,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] minecraft:instant_health 1 1 true
effect give @e[distance=..4,type=#minecraft:undead,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] minecraft:instant_damage 1 1 true


# Effects
particle minecraft:heart ^ ^ ^ 0.5 0.5 0.5 0.4 5 force @a
playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1 1.2
