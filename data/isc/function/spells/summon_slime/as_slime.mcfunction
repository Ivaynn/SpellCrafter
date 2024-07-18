#> execute summon (slime) at the projectile's position


# Tag, invulnerability timer, despawn timer
tag @s remove isc.tmp
scoreboard players set @s isc.cooldown 10
scoreboard players set @s isc.age 400


# Get caster's id
scoreboard players operation @s isc.id = $id isc.tmp
