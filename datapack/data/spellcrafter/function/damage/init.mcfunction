#> as target (any entity)


# (removed) If this entity is on damage cooldown, re-schedule this
# scoreboard players set $hurt_time spellcrafter.tmp 0
# execute store result score $hurt_time spellcrafter.tmp run data get entity @s HurtTime
# execute if score $hurt_time spellcrafter.tmp matches 1.. run return run schedule function spellcrafter:damage/scheduled 1t replace


# Get damage source
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.damage_src
execute unless score @s spellcrafter.damage_src matches 1.. run scoreboard players operation @s spellcrafter.damage_src = @s spellcrafter.id


# Damage entity
execute if score @s spellcrafter.damage matches 101.. run scoreboard players set @s spellcrafter.damage 100

execute if score @s spellcrafter.damage matches 1..10 run function spellcrafter:damage/d10
execute if score @s spellcrafter.damage matches 11..20 run function spellcrafter:damage/d20
execute if score @s spellcrafter.damage matches 21..30 run function spellcrafter:damage/d30
execute if score @s spellcrafter.damage matches 31..40 run function spellcrafter:damage/d40
execute if score @s spellcrafter.damage matches 41..50 run function spellcrafter:damage/d50
execute if score @s spellcrafter.damage matches 51..60 run function spellcrafter:damage/d60
execute if score @s spellcrafter.damage matches 61..70 run function spellcrafter:damage/d70
execute if score @s spellcrafter.damage matches 71..80 run function spellcrafter:damage/d80
execute if score @s spellcrafter.damage matches 81..90 run function spellcrafter:damage/d90
execute if score @s spellcrafter.damage matches 91..100 run function spellcrafter:damage/d100

scoreboard players set @s spellcrafter.damage 0
scoreboard players set @s spellcrafter.damage_src 0
