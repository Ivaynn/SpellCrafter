#> as projectile, on summon, at @s


execute store result score $spell isc.tmp run random value 1..75


# Exceptions
execute if score $spell isc.tmp matches 50 run return run function isc:spells/random_spell/cast
