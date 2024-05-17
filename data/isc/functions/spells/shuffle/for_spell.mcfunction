#> as projectile, on summon, at @s
#> recursive function (limited by the length of score "$iter isc.tmp")


# Get a random number between 1 and "$iter isc.tmp" (max 27 slots)
execute store result score $random isc.tmp run random value 1..100000
scoreboard players operation $random isc.tmp %= $iter isc.tmp
execute unless score $random isc.tmp matches 0..26 run scoreboard players set $random isc.tmp 0


# Append spell to tmp array and remove it from the original array
function isc:spells/shuffle/append


# Next iteration
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:spells/shuffle/for_spell
