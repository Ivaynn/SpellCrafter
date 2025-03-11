#> as sheep, on timeout, at @s
# instant cast


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.generic.explode player @a ~ ~ ~ 2 1.4
playsound minecraft:entity.sheep.death player @a ~ ~ ~ 2 1.6


# Damage nearby entities
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute positioned ~ ~-1 ~ as @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:spells/sheep/as_target
