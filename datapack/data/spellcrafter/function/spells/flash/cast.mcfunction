#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:firework ~ ~ ~ 0 0 0 0.2 50 force @a[distance=..100]
particle minecraft:firework ~ ~ ~ 0 0 0 0.2 50 normal @a[distance=..100]
particle minecraft:flash{color:[1.000,1.000,1.000,1.00]} ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]
playsound minecraft:entity.firework_rocket.blast player @a[distance=..100] ~ ~ ~ 3 0.75

# Check target line of sight
execute as @e[distance=..30,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] facing entity @s eyes run function spellcrafter:spells/flash/as_target
