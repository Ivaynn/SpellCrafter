#> as projectile, on summon, at @s
# instant cast


# Teleport caster to this position
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] positioned ^ ^ ^-0.5 align xyz run tp @s ~.5 ~ ~.5


# Effects
particle minecraft:reverse_portal ~ ~ ~ 0.3 0.3 0.3 0.5 50 force @a
playsound minecraft:entity.player.teleport player @a ~ ~ ~ 1 1
