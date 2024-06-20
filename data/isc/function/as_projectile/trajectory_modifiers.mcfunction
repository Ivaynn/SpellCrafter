#> [tick] as projectile, at @s

execute as @s[tag=isc.spell.instant] run return 0

scoreboard players set $spell.homing isc.tmp 0
scoreboard players set $spell.guide isc.tmp 0
scoreboard players set $spell.orbit isc.tmp 0
scoreboard players set $spell.follow isc.tmp 0


# Mutually exclusive - the first one to succeed cancels the others below it

execute as @s[tag=isc.spell.homing] at @s run function isc:spells/homing/tick
execute if score $spell.homing isc.tmp matches 1 run return 1

execute as @s[tag=isc.spell.guide] at @s run function isc:spells/guide/tick
execute if score $spell.guide isc.tmp matches 1 run return 1

execute as @s[tag=isc.spell.follow] run function isc:spells/follow/tick
execute if score $spell.follow isc.tmp matches 1 run return 1

execute as @s[tag=isc.spell.orbit] at @s run function isc:spells/orbit/tick
execute if score $spell.orbit isc.tmp matches 1 run return 1

execute unless score @s isc.weight matches 0 run function isc:as_projectile/weight
