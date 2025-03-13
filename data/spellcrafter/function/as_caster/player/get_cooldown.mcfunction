#> [tick] as player, at @s


# Score "spellcrafter.cooldown" has higher priority, use if available
execute if score @s spellcrafter.cooldown matches 1.. run return run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown


# Get wand cooldown -> if it's zero, stop here and return -1 to signal that the wand item doesn't need an update
execute store result score $cooldown.total spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players operation $cooldown.total spellcrafter.tmp > min_cooldown spellcrafter.options
execute if score $cooldown.total spellcrafter.tmp matches ..0 run return run scoreboard players set $cooldown.this spellcrafter.tmp -1


# Use wand's gametime data from last use to calculate elapsed time and compare that with the wand's cooldown
execute store result score $cooldown.this spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.gametime
scoreboard players operation $cooldown.this spellcrafter.tmp -= $gametime spellcrafter.tmp
scoreboard players operation $cooldown.this spellcrafter.tmp += $cooldown.total spellcrafter.tmp


# Safety checks
execute if score $cooldown.this spellcrafter.tmp > $cooldown.total spellcrafter.tmp run scoreboard players set $cooldown.this spellcrafter.tmp 0
execute unless score $cooldown.this spellcrafter.tmp matches 1.. run scoreboard players set $cooldown.this spellcrafter.tmp 0
