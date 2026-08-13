#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]
playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 3 1.2


# Damage nearby entities
execute positioned ~ ~-0.75 ~ as @e[distance=..6,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:spells/explosion/as_target


# Destroy blocks
execute unless score destructive_spells spellcrafter.options matches 1 run return 0

fill ~1.2 ~0.5 ~0.5 ~-1.2 ~-0.5 ~-0.5 minecraft:air replace #spellcrafter:explode_large destroy
fill ~0.5 ~1.2 ~0.5 ~-0.5 ~-1.2 ~-0.5 minecraft:air replace #spellcrafter:explode_large destroy
fill ~0.5 ~0.5 ~1.2 ~-0.5 ~-0.5 ~-1.2 minecraft:air replace #spellcrafter:explode_large destroy
