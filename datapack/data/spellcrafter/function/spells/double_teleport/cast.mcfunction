#> as projectile, on summon, at @s
# instant cast


# Teleport closest target to caster
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id


# Teleport caster to this position
execute as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,tag=!spellcrafter.spectator,predicate=spellcrafter:match_id] at @e[distance=..3,limit=1,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] run function spellcrafter:spells/double_teleport/as_caster
