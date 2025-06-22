#> as projectile, at @s
# projectile hit


# Damage target (scaling with speed)
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

scoreboard players set $damage spellcrafter.tmp 0
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.speed
execute unless score $damage spellcrafter.tmp matches 1.. run scoreboard players operation $damage spellcrafter.tmp *= #n1 spellcrafter.math
scoreboard players operation $damage spellcrafter.tmp += @s spellcrafter.damage

scoreboard players set $success spellcrafter.tmp 0
execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] store result score $success spellcrafter.tmp run function spellcrafter:damage/add
execute if score $success spellcrafter.tmp matches 0 run return 0


# Effects
execute if score @s spellcrafter.speed matches 4..7 run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2 2
execute if score @s spellcrafter.speed matches 8..11 run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2 1.8
execute if score @s spellcrafter.speed matches 12..15 run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2 1.6
execute if score @s spellcrafter.speed matches 16..19 run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2 1.4
execute if score @s spellcrafter.speed matches 20..23 run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 2.5 1.2
execute if score @s spellcrafter.speed matches 24.. run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 3 1.0
