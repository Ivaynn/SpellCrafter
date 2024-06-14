#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:firework ~ ~ ~ 0 0 0 0.2 50 force @a
particle minecraft:firework ~ ~ ~ 0 0 0 0.2 50 normal @a
playsound minecraft:entity.firework_rocket.blast player @a ~ ~ ~ 3 0.75


# Check target line of sight
execute as @e[distance=..30,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] facing entity @s eyes run function isc:spells/flash/as_target
