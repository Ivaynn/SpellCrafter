#> as projectile, on summon, at @s
# instant cast


# Randomly shuffles the contents of the storage "isc:tmp wand.spells"

data modify storage isc:tmp tmp set value []
execute store result score $iter isc.tmp run data get storage isc:tmp wand.spells

execute if score $iter isc.tmp matches 1.. run function isc:spells/shuffle/for_spell
data modify storage isc:tmp wand.spells set from storage isc:tmp tmp
