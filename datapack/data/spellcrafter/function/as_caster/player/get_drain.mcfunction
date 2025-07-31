#> [tick] as player, at @s


# Use the cached value if available (fast)
execute if score @s spellcrafter.cache.drain matches 0.. run return run scoreboard players operation $mana_drain spellcrafter.tmp = @s spellcrafter.cache.drain


# Get the real value (slow) and save it on cache for next tick
execute store result score $mana_drain spellcrafter.tmp run data get entity @s SelectedItem.components."minecraft:custom_data".spellcrafter.wand.drain
scoreboard players operation @s spellcrafter.cache.drain = $mana_drain spellcrafter.tmp
