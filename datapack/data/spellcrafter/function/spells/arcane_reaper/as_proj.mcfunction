#> as (other) projectile, at @s


scoreboard players set $success spellcrafter.tmp 1

scoreboard players operation $add spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $damage spellcrafter.tmp += $add spellcrafter.tmp

scoreboard players operation $add spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $age spellcrafter.tmp += $add spellcrafter.tmp

scoreboard players operation $add spellcrafter.tmp = @s spellcrafter.speed
scoreboard players operation $speed spellcrafter.tmp += $add spellcrafter.tmp


# Remove self
particle minecraft:dust{color:[0.5,0.0,0.0],scale:1} ~ ~ ~ 0.3 0.3 0.3 0 10 force @a[distance=..100]
function spellcrafter:as_projectile/remove
