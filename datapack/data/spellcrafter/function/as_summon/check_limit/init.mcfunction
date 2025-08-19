#> as projectile, on summon, at @s

# score "$id spellcrafter.tmp" contains the caster's ID

scoreboard players set $summon.count spellcrafter.tmp 0
execute as @e[distance=..100,predicate=spellcrafter:match_id,tag=spellcrafter.summon,sort=nearest] run function spellcrafter:as_summon/check_limit/as_summon
