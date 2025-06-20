#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:explosion ~ ~ ~ .8 .8 .8 0 5 force @a[distance=..100]
playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 3 1.4


# Damage nearby entities
execute positioned ~ ~-1 ~ as @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:spells/small_explosion/as_target
