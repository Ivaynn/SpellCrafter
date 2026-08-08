#> [tick] as player, at @s


# If option "shared_cooldowns" is set to "true", use the non-player cooldown system
execute if score shared_cooldowns spellcrafter.options matches 1 run return run function spellcrafter:as_caster/nonplayer/get_cooldown


# Get wand cooldown
execute store result score $cooldown.wand spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.cooldown
scoreboard players operation $cooldown.wand spellcrafter.tmp > min_cooldown spellcrafter.options


# Get wand cooldown -> if it's zero, stop here and return -1 to signal that the wand item doesn't need an update
execute if score $cooldown.wand spellcrafter.tmp matches ..0 run return run scoreboard players set $cooldown.this spellcrafter.tmp -1


# Use wand's gametime data from last use to calculate elapsed time and compare that with the wand's cooldown
execute store result score $cooldown.this spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.gametime
scoreboard players operation $cooldown.this spellcrafter.tmp -= $gametime spellcrafter.tmp


# If priority cooldown is bigger, use that value instead
execute if score $cooldown.this spellcrafter.tmp < @s spellcrafter.cooldown run scoreboard players operation $cooldown.this spellcrafter.tmp = @s spellcrafter.cooldown


# Safety checks
execute unless score $cooldown.this spellcrafter.tmp matches 1.. run scoreboard players set $cooldown.this spellcrafter.tmp 0
