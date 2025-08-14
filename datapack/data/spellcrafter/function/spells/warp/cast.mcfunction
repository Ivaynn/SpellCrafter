#> as projectile, on summon, at @s

execute at @e[limit=1,distance=0.1..5,sort=nearest,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] positioned ~ ~1 ~ facing entity @s feet run function spellcrafter:spells/warp/validate_tp
