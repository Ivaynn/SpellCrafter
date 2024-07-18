#> as projectile, on summon, at @s

scoreboard players set $echo.spell isc.tmp 0
execute store result score $echo.spell isc.tmp run data get storage isc:tmp wand.spells[-1]
function isc:spells/echo/confirm
