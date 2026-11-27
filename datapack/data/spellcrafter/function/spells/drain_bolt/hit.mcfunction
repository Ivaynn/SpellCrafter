#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

scoreboard players set $success spellcrafter.tmp 0
execute as @e[distance=..10,type=!#spellcrafter:untargetable] if function spellcrafter:util/hitbox run function spellcrafter:damage/from_projectile


# Drain mana from the nearest target that's a caster but not this spell's owner
execute as @e[distance=..10,type=#spellcrafter:caster,type=!#spellcrafter:untargetable,tag=spellcrafter.caster,tag=!spellcrafter.untargetable,predicate=!spellcrafter:match_id] if function spellcrafter:util/hitbox run tag @s add spellcrafter.drain_target
execute as @e[distance=..10,tag=spellcrafter.drain_target,limit=1,sort=nearest] run function spellcrafter:spells/drain_bolt/as_target
tag @e[distance=..10,tag=spellcrafter.drain_target] remove spellcrafter.drain_target


# Effects
execute if score $success spellcrafter.tmp matches 1.. run playsound minecraft:entity.allay.item_thrown player @a[distance=..100] ~ ~ ~ 2 0.9
