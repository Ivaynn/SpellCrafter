#> [tick] as non-player caster, at @s


# Score "spellcrafter.cooldown" has higher priority, use if available
execute if score @s spellcrafter.cooldown matches 1.. run return run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown


# Save wand cooldown to priority score and return -1 to signal that the wand item doesn't need an update
execute store result score @s spellcrafter.cooldown run data get storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players set $cooldown.this spellcrafter.tmp 0
