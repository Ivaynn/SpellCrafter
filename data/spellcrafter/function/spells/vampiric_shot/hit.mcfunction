#> as projectile, at @s
# projectile hit


# Damage target
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

scoreboard players set $success spellcrafter.tmp 0
execute if score $damage spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ as @e[distance=..3,type=!#spellcrafter:untargetable] store result score $success spellcrafter.tmp run function spellcrafter:damage/add


# If a target is hit, heal caster
execute unless score $success spellcrafter.tmp matches 1.. run return 0
effect give @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id,type=!#minecraft:undead,tag=!spellcrafter.spectator] minecraft:instant_health 1 0 true
effect give @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id,type=#minecraft:undead,tag=!spellcrafter.spectator] minecraft:instant_damage 1 0 true


# Effects
playsound minecraft:entity.phantom.bite player @a ~ ~ ~ 2 0.8
