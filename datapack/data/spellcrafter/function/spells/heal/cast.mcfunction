#> as projectile, on summon, at @s
# instant cast


# Heal targets
effect give @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] minecraft:instant_health 1 1 true


# Effects
particle minecraft:heart ^ ^ ^ 0.5 0.5 0.5 0.4 5 force @a[distance=..100]
playsound minecraft:entity.experience_orb.pickup player @a[distance=..100] ~ ~ ~ 1 1.2
