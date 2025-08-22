#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:campfire_cosy_smoke ~ ~ ~ .7 .7 .7 0.025 50 force @a[distance=..100]
particle minecraft:campfire_cosy_smoke ~ ~ ~ .7 .7 .7 0.025 100 normal @a[distance=..100]
playsound minecraft:block.fire.extinguish player @a[distance=..100] ~ ~ ~ 2 0.7


# Apply effect
effect give @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.spectator] minecraft:invisibility 2 0 false
