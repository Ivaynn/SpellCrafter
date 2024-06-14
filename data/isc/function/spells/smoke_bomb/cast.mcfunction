#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:campfire_cosy_smoke ~ ~ ~ .7 .7 .7 0.025 50 force @a
particle minecraft:campfire_cosy_smoke ~ ~ ~ .7 .7 .7 0.025 100 normal @a
playsound minecraft:block.fire.extinguish player @a ~ ~ ~ 2 0.7


# Apply effect
effect give @e[distance=..4,type=!#isc:untargetable,tag=!isc.spectator] minecraft:invisibility 5 0 false
