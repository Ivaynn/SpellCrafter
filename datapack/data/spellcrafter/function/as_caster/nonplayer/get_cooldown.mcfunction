#> [tick] as non-player caster, at @s


# Get wand cooldown
execute store result score $cooldown.wand spellcrafter.tmp run data get storage spellcrafter:tmp mainhand.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players operation $cooldown.wand spellcrafter.tmp > min_cooldown spellcrafter.options


# Score "spellcrafter.cooldown" has higher priority, use if available
execute if score @s spellcrafter.cooldown matches 1.. run return run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown


# Save wand cooldown to priority score
scoreboard players operation @s spellcrafter.cooldown = $cooldown.wand spellcrafter.tmp
scoreboard players set $cooldown.this spellcrafter.tmp 0
