#> [tick] as projectile, at @s

execute as @s[tag=spellcrafter.spell.instant] run return 0

scoreboard players set $spell.homing spellcrafter.tmp 0
scoreboard players set $spell.guide spellcrafter.tmp 0
scoreboard players set $spell.orbit spellcrafter.tmp 0
scoreboard players set $spell.follow spellcrafter.tmp 0


# Mutually exclusive - the first one to succeed cancels the others below it

execute as @s[tag=spellcrafter.spell.homing] at @s run function spellcrafter:spells/homing/tick
execute if score $spell.homing spellcrafter.tmp matches 1 run return 1

execute as @s[tag=spellcrafter.spell.guide] at @s run function spellcrafter:spells/guide/tick
execute if score $spell.guide spellcrafter.tmp matches 1 run return 1

execute as @s[tag=spellcrafter.spell.follow] run function spellcrafter:spells/follow/tick
execute if score $spell.follow spellcrafter.tmp matches 1 run return 1

execute as @s[tag=spellcrafter.spell.orbit] at @s run function spellcrafter:spells/orbit/tick
execute if score $spell.orbit spellcrafter.tmp matches 1 run return 1

execute unless score @s spellcrafter.weight matches 0 run function spellcrafter:as_projectile/weight
