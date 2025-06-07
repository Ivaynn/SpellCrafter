#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] run function spellcrafter:damage/add


# Effects
playsound minecraft:entity.splash_potion.break player @a[distance=..100] ~ ~ ~ 1 1.2
