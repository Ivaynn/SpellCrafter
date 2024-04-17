#> [tick] as projectile, at @s


# Check projectile cap
scoreboard players add $projectile_count isc.tmp 1
execute if score $projectile_count isc.tmp >= projectile_cap isc.options run return run kill @s
execute as @s[tag=isc.kill] run return run kill @s


# Apply projectile direction modifiers --> they can't be active at the same time
scoreboard players set $homing isc.tmp 0
execute as @s[tag=isc.spell.homing,tag=!isc.laser] at @s run function isc:spells/homing/tick
execute unless score $homing isc.tmp matches 1 as @s[tag=isc.spell.guide,tag=!isc.laser] at @s run function isc:spells/guide/tick


# Move projectile --> projectile speed = number of move iterations per tick
scoreboard players operation $iter isc.tmp = @s isc.speed
execute at @s run function isc:as_projectile/move


# If age < 1, this projectile timed out or hit something
execute unless score @s isc.age matches 1.. at @s run function isc:as_projectile/hit
