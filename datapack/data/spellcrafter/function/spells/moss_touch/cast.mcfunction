#> as projectile, on summon, at @s
# instant cast


# Effects
particle minecraft:spore_blossom_air ~ ~ ~ 1.5 1.5 1.5 1 10 force @a[distance=..50]
particle minecraft:spore_blossom_air ~ ~ ~ 1 1 1 1 30 normal @a[distance=..50]
playsound minecraft:item.bone_meal.use player @a[distance=..50] ~ ~ ~ 1.5 0.8


# Slow nearby entities
execute positioned ~ ~-0.75 ~ as @e[distance=..4,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] run effect give @s minecraft:slowness 5 2 false


# Destroy blocks
execute unless score destructive_spells spellcrafter.options matches 1 run return 0
place feature minecraft:moss_patch_bonemeal ~ ~ ~
