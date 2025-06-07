#> as projectile, on summon, at @s
# instant cast


# Rotate projectiles
execute as @e[distance=..30,type=minecraft:marker,tag=spellcrafter.projectile] facing entity @s feet positioned as @s run tp @s ~ ~ ~ facing ^ ^ ^-1


# Effects
particle minecraft:wax_off ~ ~ ~ 3 3 3 5 200 force @a[distance=..100]
playsound minecraft:block.trial_spawner.spawn_mob master @a[distance=..100] ~ ~ ~ 1 0.7
