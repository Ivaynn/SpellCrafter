#> as summon, at target projectile (to be removed)

execute if score $hit_shield spellcrafter.tmp matches 1 run return 0
scoreboard players set $hit_shield spellcrafter.tmp 1

execute at @s run function spellcrafter:spells/magic_shield/break
