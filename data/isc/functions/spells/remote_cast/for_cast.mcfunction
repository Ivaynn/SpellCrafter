#> as projectile, on summon, at @s
#> recursive function (limited by score "$spell.remote_cast isc.tmp")

execute at @s run tp @s ^ ^ ^3
scoreboard players remove $spell.remote_cast isc.tmp 1
execute if score $spell.remote_cast isc.tmp matches 1.. run function isc:spells/remote_cast/for_cast
