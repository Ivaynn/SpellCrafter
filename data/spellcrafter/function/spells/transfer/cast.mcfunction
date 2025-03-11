#> as projectile, on summon, at @s

scoreboard players operation @s spellcrafter.id = @e[limit=1,distance=0.1..100,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] spellcrafter.id
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
