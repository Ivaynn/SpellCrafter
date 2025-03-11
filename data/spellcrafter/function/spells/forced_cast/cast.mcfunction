#> as projectile, on summon, at @s
# instant cast

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[limit=1,sort=nearest,distance=..5,type=#spellcrafter:caster,predicate=!spellcrafter:match_id,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,tag=spellcrafter.caster,predicate=spellcrafter:holding_wand,scores={spellcrafter.cooldown=..0}] at @s run function spellcrafter:spells/forced_cast/as_target

particle minecraft:enchanted_hit ~ ~ ~ 2 2 2 0.5 50 force @a
playsound minecraft:entity.evoker.prepare_attack player @a ~ ~ ~ 2 2
