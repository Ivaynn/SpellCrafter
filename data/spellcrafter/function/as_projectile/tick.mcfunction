#> [tick] as projectile, at @s
scoreboard players add @s spellcrafter.tick 1
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id


# Check projectile cap
scoreboard players add $projectile_count spellcrafter.tmp 1
execute if score $projectile_count spellcrafter.tmp > projectile_cap spellcrafter.options run return run kill @s
execute as @s[tag=spellcrafter.kill] run return run kill @s


# Check if spell should damage caster
scoreboard players set $spell.safe_shot spellcrafter.tmp 0
execute as @s[tag=spellcrafter.spell.safe_shot] run scoreboard players set $spell.safe_shot spellcrafter.tmp 1


# Apply projectile direction modifiers
function spellcrafter:as_projectile/trajectory_modifiers
execute as @s[tag=spellcrafter.spell.height_lock] at @s run function spellcrafter:spells/height_lock/tick


# Special cases
execute as @s[tag=spellcrafter.spell.arcane_reaper] run function spellcrafter:spells/arcane_reaper/tick
execute as @s[tag=spellcrafter.spell.scaling] run function spellcrafter:spells/scaling/tick
execute as @s[tag=spellcrafter.spell.return] run function spellcrafter:spells/return/tick
execute as @s[tag=spellcrafter.spell.boomerang] run function spellcrafter:spells/boomerang/tick
execute as @s[tag=spellcrafter.spell.accelerate] run function spellcrafter:spells/accelerate/tick
execute as @s[tag=spellcrafter.spell.arcane_shield] run function spellcrafter:spells/arcane_shield/tick
execute as @s[tag=spellcrafter.spell.healing_circle] run function spellcrafter:spells/healing_circle/tick
execute as @s[tag=spellcrafter.spell.toxic_cloud] run function spellcrafter:spells/toxic_cloud/tick
execute as @s[tag=spellcrafter.spell.mirror_shot] run function spellcrafter:spells/mirror_shot/tick
scoreboard players set @s[tag=spellcrafter.spell.harmless] spellcrafter.damage 0


# Get number of move iterations per tick
scoreboard players operation $iter spellcrafter.tmp = @s spellcrafter.speed
execute if score $iter spellcrafter.tmp matches ..-1 run scoreboard players operation $iter spellcrafter.tmp *= #n1 spellcrafter.math


# Special cases with a fixed speed
execute as @s[tag=spellcrafter.spell.instant] run scoreboard players set $iter spellcrafter.tmp 1000
execute as @s[tag=spellcrafter.spell.anchored] run scoreboard players set $iter spellcrafter.tmp 1
execute as @s[tag=spellcrafter.spell.follow] if score $spell.follow spellcrafter.tmp matches 1 run scoreboard players set $iter spellcrafter.tmp 1


# Get damage to be dealt to shields
scoreboard players operation $shield_damage spellcrafter.tmp = @s spellcrafter.damage
execute unless score $shield_damage spellcrafter.tmp matches 1.. run scoreboard players set $shield_damage spellcrafter.tmp 1
scoreboard players operation $shield_damage spellcrafter.tmp *= #5 spellcrafter.math


# Move projectile
execute if score $iter spellcrafter.tmp matches 1001.. run scoreboard players set $iter spellcrafter.tmp 1000
execute at @s run function spellcrafter:as_projectile/move


# If age < 1, this projectile timed out or hit something
execute as @s[tag=!spellcrafter.kill] unless score @s spellcrafter.age matches 1.. at @s run function spellcrafter:as_projectile/hit
