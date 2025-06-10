#> as wandering trader, at @s


# Gemerate wand for this $gen.tier
function spellcrafter:shops/trader/generate_wand


# Obtain random emerald cost
scoreboard players operation $gen.trade.cost spellcrafter.tmp = $gen.tier spellcrafter.tmp
scoreboard players operation $gen.trade.cost spellcrafter.tmp *= #5 spellcrafter.math
scoreboard players add $gen.trade.cost spellcrafter.tmp 30

execute if score $gen.tier spellcrafter.tmp matches 1 store result score $gen.trade.random spellcrafter.tmp run random value -1..2
execute if score $gen.tier spellcrafter.tmp matches 2 store result score $gen.trade.random spellcrafter.tmp run random value -2..4
execute if score $gen.tier spellcrafter.tmp matches 3 store result score $gen.trade.random spellcrafter.tmp run random value -3..6
execute if score $gen.tier spellcrafter.tmp matches 4 store result score $gen.trade.random spellcrafter.tmp run random value -4..8
execute if score $gen.tier spellcrafter.tmp matches 5 store result score $gen.trade.random spellcrafter.tmp run random value -5..10

scoreboard players operation $gen.trade.cost spellcrafter.tmp += $gen.trade.random spellcrafter.tmp


# Create offer
execute unless score $gen.trade.cost spellcrafter.tmp matches 1.. run scoreboard players set $gen.trade.cost spellcrafter.tmp 1
execute unless score $gen.trade.cost spellcrafter.tmp matches ..64 run scoreboard players set $gen.trade.cost spellcrafter.tmp 64

data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:1,xp:0,buy:{id:"minecraft:emerald",count:1},sell:{id:"minecraft:stone",count:1}}
data modify entity @s Offers.Recipes[-1].sell set from entity @s equipment.mainhand
execute store result entity @s Offers.Recipes[-1].buy.count int 1 run scoreboard players get $gen.trade.cost spellcrafter.tmp
