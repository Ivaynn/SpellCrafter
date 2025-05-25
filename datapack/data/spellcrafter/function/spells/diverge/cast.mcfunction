#> as projectile, on summon, at @s
# instant cast


# Rotate projectiles
execute as @e[distance=..30,type=minecraft:marker,tag=spellcrafter.projectile] facing entity @s feet positioned as @s run tp @s ~ ~ ~ ~ ~


# Effects
particle minecraft:wax_off ~ ~ ~ 3 3 3 5 200 force @a
playsound minecraft:block.trial_spawner.spawn_item master @a ~ ~ ~ 1 0.8
