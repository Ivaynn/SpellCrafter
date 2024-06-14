#> recursive function (limited by score "$spell.multishot isc.tmp")
#> as projectile, on summon, at @s


# Summon copies
execute at @s summon minecraft:marker run function isc:spells/multishot/summon_left
execute at @s summon minecraft:marker run function isc:spells/multishot/summon_right


# Next iteration
scoreboard players remove $spell.multishot isc.tmp 1
execute if score $spell.multishot isc.tmp matches 1.. at @s run function isc:spells/multishot/for_copy
