#> as (other) projectile, at @s
# projectile hit


scoreboard players set $success isc.tmp 1

scoreboard players operation $add isc.tmp = @s isc.damage
scoreboard players operation $damage isc.tmp += $add isc.tmp

scoreboard players operation $add isc.tmp = @s isc.age
scoreboard players operation $age isc.tmp += $add isc.tmp

scoreboard players operation $add isc.tmp = @s isc.speed
scoreboard players operation $speed isc.tmp += $add isc.tmp


# Remove self
particle minecraft:dust{color:[0.5,0.0,0.0],scale:1} ~ ~ ~ 0.3 0.3 0.3 0 10 force @a
function isc:as_projectile/remove
