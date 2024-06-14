#> as projectile, at @s


execute as @s[tag=!isc.spell.piercing] run scoreboard players set @s isc.age 0
execute as @s[tag=isc.spell.piercing] run function isc:spells/piercing/damage
