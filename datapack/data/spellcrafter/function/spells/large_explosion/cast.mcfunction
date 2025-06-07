#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 3 force @a[distance=..100]
particle minecraft:flame ~ ~ ~ 1 1 1 0.2 50 force @a[distance=..100]
playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 3 0.6


# Damage nearby entities
execute positioned ~ ~-1 ~ as @e[distance=..7,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:spells/large_explosion/as_target
