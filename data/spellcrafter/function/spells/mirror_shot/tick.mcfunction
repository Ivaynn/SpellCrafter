#> [tick] as projectile, at @s


# Set stats to 0
scoreboard players set $success spellcrafter.tmp 0

scoreboard players set $damage spellcrafter.tmp 0
scoreboard players set $age spellcrafter.tmp 0
scoreboard players set $speed spellcrafter.tmp 0


# Get stats of nearby projectiles
tag @s add spellcrafter.self
execute as @e[limit=1,distance=..50,sort=nearest,type=minecraft:marker,tag=!spellcrafter.self,tag=!spellcrafter.kill,tag=spellcrafter.projectile,tag=!spellcrafter.spell.mirror_shot] at @s run function spellcrafter:spells/mirror_shot/as_proj
tag @s remove spellcrafter.self


# If no projectiles, stop here
execute if score $success spellcrafter.tmp matches 0 run return 0


# Get copied data
data modify entity @s Tags set from storage spellcrafter:tmp copy.tags

scoreboard players operation @s spellcrafter.speed = $speed spellcrafter.tmp
scoreboard players operation @s spellcrafter.damage = $damage spellcrafter.tmp
scoreboard players operation @s spellcrafter.range = $range spellcrafter.tmp
scoreboard players operation @s spellcrafter.weight = $weight spellcrafter.tmp

scoreboard players operation @s spellcrafter.age = @s spellcrafter.range
scoreboard players operation @s spellcrafter.age *= #4 spellcrafter.math


# Effects
playsound minecraft:entity.illusioner.prepare_mirror player @a ^ ^ ^1 2 2
