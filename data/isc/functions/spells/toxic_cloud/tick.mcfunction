#> [tick] as projectile, at @s

execute unless score damage_caster isc.options matches 1 run effect give @e[distance=..4,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:poison 2 4 false
execute if score damage_caster isc.options matches 1 as @s[tag=!isc.spell.safe_shot] run effect give @e[distance=..4,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator] minecraft:poison 2 4 false
execute if score damage_caster isc.options matches 1 as @s[tag=isc.spell.safe_shot] run effect give @e[distance=..4,type=!#isc:untargetable,tag=!isc.untargetable,tag=!isc.spectator,predicate=!isc:match_id] minecraft:poison 2 4 false 
