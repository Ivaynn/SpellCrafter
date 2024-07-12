#> as projectile, on summon, at @s
#> recursive function (limited by the length of score "$iter isc.tmp")


# Append spell to tmp array and remove it from the original array
data modify storage isc:tmp tmp append from storage isc:tmp wand.spells[-1]
data remove storage isc:tmp wand.spells[-1]


# Next iteration
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:spells/reverse/for_spell
