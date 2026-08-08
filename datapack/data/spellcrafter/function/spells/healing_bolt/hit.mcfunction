#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] store result score $success spellcrafter.tmp run function spellcrafter:damage/add
schedule function spellcrafter:damage/scheduled 1t


# Heal non-undead targets
execute positioned ~ ~-0.75 ~ run scoreboard players add @e[distance=..1.5,type=!#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] spellcrafter.heal 4


# Hurt undead targets
scoreboard players set $damage spellcrafter.tmp 4
execute positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=#minecraft:undead,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run function spellcrafter:damage/add


# Not hit effects
