#> as projectile, on summon, at @s

execute at @e[limit=1,distance=..100,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,tag=!spellcrafter.spectator,predicate=spellcrafter:match_id] positioned ~ ~1 ~ facing entity @s feet run function spellcrafter:spells/warp/validate_tp
