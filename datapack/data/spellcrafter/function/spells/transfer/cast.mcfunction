#> as projectile, on summon, at @s


# Get id of the nearest caster
scoreboard players set $transfer.id spellcrafter.tmp 0
scoreboard players operation $transfer.id spellcrafter.tmp = @e[limit=1,distance=0.1..5,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator,predicate=!spellcrafter:match_id] spellcrafter.id


# If no caster is found, stop here
execute if score $transfer.id spellcrafter.tmp matches 0 run return run function spellcrafter:spells/transfer/not_found


# If a caster is found, get their id
scoreboard players operation @s spellcrafter.id = $transfer.id spellcrafter.tmp
scoreboard players operation $id spellcrafter.tmp = $transfer.id spellcrafter.tmp
