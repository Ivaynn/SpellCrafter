#> as projectile, on summon, at the summon position (not at @s)
#> recursive function (limited by score "$spell.remote_down isc.tmp")

execute at @s run tp @s ~ ~-5 ~
scoreboard players remove $spell.remote_down isc.tmp 1
execute if score $spell.remote_down isc.tmp matches 1.. run function isc:spells/remote_down/cast
