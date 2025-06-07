#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] run function spellcrafter:damage/add


# Effects
particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]
playsound minecraft:entity.warden.sonic_boom player @a[distance=..100] ~ ~ ~ 2 1.4
