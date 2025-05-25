#> as projectile, on summon, at @s
# instant cast


# Teleport closest target to caster
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] at @e[distance=..3,limit=1,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run function spellcrafter:spells/inverse_teleport/as_caster
