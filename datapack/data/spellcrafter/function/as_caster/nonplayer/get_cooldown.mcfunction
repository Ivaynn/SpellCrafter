#> [tick] as non-player caster, at @s


# Score "spellcrafter.cooldown" has higher priority, use if available
execute if score @s spellcrafter.cooldown matches 1.. run return run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown


# Save wand cooldown to priority score
execute store result score @s spellcrafter.cooldown run data get storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players operation @s spellcrafter.cooldown > min_cooldown spellcrafter.options
scoreboard players set $cooldown.this spellcrafter.tmp 0
