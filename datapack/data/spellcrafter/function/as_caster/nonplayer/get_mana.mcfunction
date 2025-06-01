#> as non-player caster, at @s


# Get tier from entity type
function spellcrafter:as_caster/nonplayer/get_tier
execute unless score $gen.tier spellcrafter.tmp matches 1..5 run return run tag @s remove spellcrafter.caster


# Get random mana scores depending on tier
execute if score $gen.tier spellcrafter.tmp matches 1 store result score @s spellcrafter.mana run random value 1000..3000
execute if score $gen.tier spellcrafter.tmp matches 2 store result score @s spellcrafter.mana run random value 4000..8000
execute if score $gen.tier spellcrafter.tmp matches 3 store result score @s spellcrafter.mana run random value 10000..15000
execute if score $gen.tier spellcrafter.tmp matches 4 store result score @s spellcrafter.mana run random value 20000..35000
execute if score $gen.tier spellcrafter.tmp matches 5 store result score @s spellcrafter.mana run random value 40000..50000

scoreboard players operation @s spellcrafter.max_mana = @s spellcrafter.mana

scoreboard players operation @s spellcrafter.mana_reg = @s spellcrafter.mana
scoreboard players operation @s spellcrafter.mana_reg /= #20 spellcrafter.math
scoreboard players operation @s spellcrafter.mana_reg /= #10 spellcrafter.math
