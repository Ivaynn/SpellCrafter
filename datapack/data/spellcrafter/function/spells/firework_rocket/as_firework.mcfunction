#> execute summon (firework_rocket) at the projectile's position


# Init
tag @s add spellcrafter.summon
tag @s add spellcrafter.spell.firework_rocket
data merge entity @s {LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:false,has_trail:false,colors:[I;0]}]}}}}


# Get owner
data modify entity @s Owner set from entity @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] UUID


# LifeTime
execute store result entity @s LifeTime int 1 run random value 10..30


# Shape
execute store result score $random spellcrafter.tmp run random value 1..5
execute if score $random spellcrafter.tmp matches 2 run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].shape set value "large_ball"
execute if score $random spellcrafter.tmp matches 3 run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].shape set value "star"
execute if score $random spellcrafter.tmp matches 4 run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].shape set value "creeper"
execute if score $random spellcrafter.tmp matches 5 run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].shape set value "burst"


# Color
execute store result entity @s FireworksItem.components."minecraft:fireworks".explosions[0].colors[0] int 1 run random value 0..16777215


# Trail/twinkle
execute store result score $random spellcrafter.tmp run random value 1..4
execute if score $random spellcrafter.tmp matches 4 run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].has_twinkle set value true
execute store result score $random spellcrafter.tmp run random value 1..4
execute if score $random spellcrafter.tmp matches 4 run data modify entity @s FireworksItem.components."minecraft:fireworks".explosions[0].has_trail set value true
