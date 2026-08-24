#> as projectile, on summon, at @s
# instant cast


# If this puts a player inside a barrier, cancel
execute if block ~ ~0.5 ~ #spellcrafter:anti_magic run return fail
execute if block ~ ~1.5 ~ #spellcrafter:anti_magic run return fail


# Teleport caster to this position
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] positioned ^ ^ ^-1 run function spellcrafter:spells/teleport/as_caster


# Effects
particle minecraft:reverse_portal ~ ~ ~ 0.3 0.3 0.3 0.5 25 force @a[distance=..100]
playsound minecraft:entity.player.teleport player @a[distance=..100] ~ ~ ~ 1 1
