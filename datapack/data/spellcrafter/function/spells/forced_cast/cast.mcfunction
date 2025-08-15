#> as projectile, on summon, at @s
# instant cast

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[limit=1,sort=nearest,distance=..20,type=#spellcrafter:caster,predicate=!spellcrafter:match_id,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,tag=spellcrafter.caster,predicate=spellcrafter:holding_wand] at @s run function spellcrafter:as_caster/use_wand

particle minecraft:enchanted_hit ~ ~ ~ 2 2 2 0.5 50 force @a[distance=..100]
playsound minecraft:entity.evoker.prepare_attack player @a[distance=..100] ~ ~ ~ 2 2
