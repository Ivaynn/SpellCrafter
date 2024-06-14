#> as target


execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0
damage @s 8 minecraft:player_explosion by @e[limit=1,type=#isc:caster,tag=isc.caster,predicate=isc:match_id]
