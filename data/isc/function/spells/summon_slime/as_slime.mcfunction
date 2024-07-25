#> execute summon (slime) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s remove isc.tmp
scoreboard players set @s isc.cooldown 10
scoreboard players set @s isc.age 100


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp


# Scale - can't set the "Size" nbt tag because that causes slimes to create smaller slimes when they die
scoreboard players operation @s isc.age *= $spell.summon_slime isc.tmp
data merge entity @s {Size:0,Health:1.0f,attributes:[{id:"minecraft:generic.scale",base:1},{id:"minecraft:generic.max_health",base:1}]}

execute store result entity @s attributes[{id:"minecraft:generic.scale"}].base float 1 run scoreboard players get $spell.summon_slime isc.tmp
execute store result entity @s attributes[{id:"minecraft:generic.max_health"}].base float 2 run scoreboard players get $spell.summon_slime isc.tmp
execute store result entity @s Health float 2 run scoreboard players get $spell.summon_slime isc.tmp
