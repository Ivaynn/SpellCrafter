#> as projectile, at @s

scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.tick
scoreboard players operation $rem spellcrafter.tmp %= #20 spellcrafter.math

execute if score $rem spellcrafter.tmp matches 1.. run return 0

scoreboard players add @s spellcrafter.damage 2
scoreboard players remove @s[tag=spellcrafter.spell.safe_shot] spellcrafter.damage 1
