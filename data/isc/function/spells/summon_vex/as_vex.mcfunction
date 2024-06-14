#> execute summon (vex) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s add isc.summon
scoreboard players set @s isc.cooldown 10
scoreboard players set @s isc.age 600


# Update entity NBT
data merge entity @s {Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,HandItems:[{id:"minecraft:iron_sword",Count:1b},{}],HandDropChances:[-99999.000F,0.085F]}


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp
