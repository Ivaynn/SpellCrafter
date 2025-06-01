#> as projectile, on summon, at @s

scoreboard players set $echo.spell spellcrafter.tmp 0
execute store result score $echo.spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[1]
function spellcrafter:spells/echo/confirm
