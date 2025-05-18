#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#spellcrafter:untargetable] run function spellcrafter:damage/add


# Effects
particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 0 force @a
playsound minecraft:entity.warden.sonic_boom player @a ~ ~ ~ 2 1.4
