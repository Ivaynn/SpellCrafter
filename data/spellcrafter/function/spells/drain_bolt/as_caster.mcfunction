#> as caster
# projectile hit

scoreboard players operation $mana_empty spellcrafter.tmp = @s spellcrafter.max_mana
scoreboard players operation $mana_empty spellcrafter.tmp -= @s spellcrafter.mana


# Stop if player is full mana
execute if score $mana_empty spellcrafter.tmp matches ..0 run return 0


# Give stolen mana to caster but don't overflow
scoreboard players operation @s spellcrafter.mana += $mana_stolen spellcrafter.tmp
scoreboard players operation @s spellcrafter.mana < @s spellcrafter.max_mana
