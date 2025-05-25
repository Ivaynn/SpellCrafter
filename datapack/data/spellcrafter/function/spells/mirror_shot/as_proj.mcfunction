#> as (other) projectile, at @s


scoreboard players set $success spellcrafter.tmp 1

data remove storage spellcrafter:tmp copy
data modify storage spellcrafter:tmp copy.tags set from entity @s Tags

scoreboard players operation $speed spellcrafter.tmp = @s spellcrafter.speed
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $range spellcrafter.tmp = @s spellcrafter.range
scoreboard players operation $weight spellcrafter.tmp = @s spellcrafter.weight
