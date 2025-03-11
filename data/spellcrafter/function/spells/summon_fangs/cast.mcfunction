#> as projectile, on summon, at @s
# instant cast


# Summon entity
execute at @e[distance=..5,sort=nearest,type=!#spellcrafter:untargetable,predicate=!spellcrafter:match_id,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run summon minecraft:evoker_fangs ~ ~ ~ {Tags:["spellcrafter.summon"]}
