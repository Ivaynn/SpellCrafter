#> as projectile, on summon, at @s


# Get spell id
execute store result score $spell isc.tmp run data get storage isc:tmp wand.spells[-1]


# Blacklisted spells (can't be copied)
execute if score $spell isc.tmp matches 50 run scoreboard players set $spell isc.tmp 0
execute if score $spell isc.tmp matches 92 run scoreboard players set $spell isc.tmp 0
execute if score $spell isc.tmp matches 93 run scoreboard players set $spell isc.tmp 0
execute if score $spell isc.tmp matches 96 run scoreboard players set $spell isc.tmp 0
