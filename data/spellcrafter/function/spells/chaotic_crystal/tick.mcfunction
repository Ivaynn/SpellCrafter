#> [tick] as item_display, at @s


particle minecraft:dust{color:[0.1,0.1,0.1],scale:1.5} ~ ~ ~ 0.4 0.4 0.4 0 1 normal @a[distance=..50]
tp @s ~ ~ ~ ~5 ~


# Shoot every X seconds
scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #60 spellcrafter.math
execute unless score $rem spellcrafter.tmp matches 1 run return 0

execute store result score $random spellcrafter.tmp run random value 1..50
scoreboard players operation @s spellcrafter.age -= $random spellcrafter.tmp


# Get a random rotation
data modify storage spellcrafter:tmp rotation set value [0.0f,0.0f]
execute store result storage spellcrafter:tmp rotation[0] float 1 run random value -180..180
execute store result storage spellcrafter:tmp rotation[1] float 1 run random value -90..90


# Get a random spell
data remove storage spellcrafter:tmp wand
execute store result score $random spellcrafter.tmp run random value 0..9
execute if score $random spellcrafter.tmp matches 0 run data modify storage spellcrafter:tmp wand.spells set value [1]
execute if score $random spellcrafter.tmp matches 1 run data modify storage spellcrafter:tmp wand.spells set value [2]
execute if score $random spellcrafter.tmp matches 2 run data modify storage spellcrafter:tmp wand.spells set value [3]
execute if score $random spellcrafter.tmp matches 3 run data modify storage spellcrafter:tmp wand.spells set value [53]
execute if score $random spellcrafter.tmp matches 4 run data modify storage spellcrafter:tmp wand.spells set value [57]
execute if score $random spellcrafter.tmp matches 5 run data modify storage spellcrafter:tmp wand.spells set value [63]
execute if score $random spellcrafter.tmp matches 6 run data modify storage spellcrafter:tmp wand.spells set value [65]
execute if score $random spellcrafter.tmp matches 7 run data modify storage spellcrafter:tmp wand.spells set value [79]
execute if score $random spellcrafter.tmp matches 8 run data modify storage spellcrafter:tmp wand.spells set value [91]
execute if score $random spellcrafter.tmp matches 9 run data modify storage spellcrafter:tmp wand.spells set value [101]


# Create projectile
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute summon minecraft:marker run function spellcrafter:as_projectile/summon
