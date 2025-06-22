#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] run function spellcrafter:damage/add


# Effects
particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.1 15 force @a[distance=..100]
playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2 1.6


# Place block
execute if score destructive_spells spellcrafter.options matches 1 if block ~ ~ ~ #minecraft:replaceable run setblock ~ ~ ~ minecraft:fire replace
