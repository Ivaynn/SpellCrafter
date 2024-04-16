#> recursive function (limited by score "$spell.clone isc.tmp")
#> as projectile, on summon, at @s


# Summon copy
execute at @s summon minecraft:marker run function isc:spells/clone/summon_copy


# Next iteration
scoreboard players remove $spell.clone isc.tmp 1
execute if score $spell.clone isc.tmp matches 1.. at @s run function isc:spells/clone/for_clone
