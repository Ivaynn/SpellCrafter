#> as caster
# projectile hit

scoreboard players operation $mana_empty isc.tmp = @s isc.max_mana
scoreboard players operation $mana_empty isc.tmp -= @s isc.mana


# Stop if player is full mana
execute if score $mana_empty isc.tmp matches ..0 run return 0


# Give stolen mana to caster but don't overflow
scoreboard players operation @s isc.mana += $mana_stolen isc.tmp
scoreboard players operation @s isc.mana < @s isc.max_mana
