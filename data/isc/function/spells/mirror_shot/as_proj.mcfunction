#> as (other) projectile, at @s


scoreboard players set $success isc.tmp 1

data remove storage isc:tmp copy
data modify storage isc:tmp copy.tags set from entity @s Tags

scoreboard players operation $speed isc.tmp = @s isc.speed
scoreboard players operation $damage isc.tmp = @s isc.damage
scoreboard players operation $range isc.tmp = @s isc.range
scoreboard players operation $weight isc.tmp = @s isc.weight
