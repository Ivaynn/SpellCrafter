#> [tick] as projectile, at @s
scoreboard players add @s isc.tick 1
scoreboard players operation $id isc.tmp = @s isc.id


# Check projectile cap
scoreboard players add $projectile_count isc.tmp 1
execute if score $projectile_count isc.tmp > projectile_cap isc.options run return run kill @s
execute as @s[tag=isc.kill] run return run kill @s


# Apply projectile direction modifiers --> they are mutually exclusive: homing* > guide > follow* > ... ( * = may fail if no valid entity is in range )
scoreboard players set $spell.homing isc.tmp 0
scoreboard players set $spell.follow isc.tmp 0
execute as @s[tag=isc.spell.homing,tag=!isc.spell.instant] at @s run function isc:spells/homing/tick
execute unless score $spell.homing isc.tmp matches 1 as @s[tag=isc.spell.guide,tag=!isc.spell.instant] at @s run function isc:spells/guide/tick
execute unless score $spell.homing isc.tmp matches 1 as @s[tag=isc.spell.follow,tag=!isc.spell.guide,tag=!isc.spell.instant] run function isc:spells/follow/tick
execute unless score $spell.homing isc.tmp matches 1 unless score $spell.follow isc.tmp matches 1 as @s[tag=!isc.spell.instant] unless score @s isc.weight matches 0 run function isc:as_projectile/weight


# Special cases
execute as @s[tag=isc.spell.arcane_reaper] run function isc:spells/arcane_reaper/tick
execute as @s[tag=isc.spell.scaling] run function isc:spells/scaling/tick
execute as @s[tag=isc.spell.return] run function isc:spells/return/tick
execute as @s[tag=isc.spell.boomerang] run function isc:spells/boomerang/tick
execute as @s[tag=isc.spell.accelerate] run function isc:spells/accelerate/tick


# Get number of move iterations per tick
scoreboard players operation $iter isc.tmp = @s isc.speed
execute if score $iter isc.tmp matches ..-1 run scoreboard players operation $iter isc.tmp *= #n1 isc.math


# Special cases with a fixed speed
execute as @s[tag=isc.spell.instant] run scoreboard players set $iter isc.tmp 1000
execute as @s[tag=isc.spell.anchored] run scoreboard players set $iter isc.tmp 1
execute as @s[tag=isc.spell.follow] if score $spell.follow isc.tmp matches 1 run scoreboard players set $iter isc.tmp 1


# Move projectile
execute if score $iter isc.tmp matches 1001.. run scoreboard players set $iter isc.tmp 1000
execute at @s run function isc:as_projectile/move


# If age < 1, this projectile timed out or hit something
scoreboard players set @s[tag=isc.spell.harmless] isc.damage 0
execute as @s[tag=!isc.kill] unless score @s isc.age matches 1.. at @s run function isc:as_projectile/hit
