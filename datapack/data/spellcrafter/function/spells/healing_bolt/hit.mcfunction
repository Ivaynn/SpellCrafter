#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] store result score $success spellcrafter.tmp run function spellcrafter:damage/add


# Heal targets
effect give @e[distance=..1.5,type=!#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] minecraft:instant_health 1 0 true
effect give @e[distance=..1.5,type=#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] minecraft:instant_damage 1 0 true


# Not hit effects
