#> as projectile, on summon, at @s

scoreboard players add $summon.count spellcrafter.tmp 1
execute if score $summon.count spellcrafter.tmp <= max_summons spellcrafter.options run return 0


# Silent remove
execute on passengers run ride @s dismount
execute at @s run tp @s ~ -999 ~
data remove entity @s CustomName
kill @s[type=!minecraft:player]
