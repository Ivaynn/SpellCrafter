#> as wandering trader, at @s


# Gemerate wand for this $gen.tier
function spellcrafter:shops/trader/generate_wand


# Obtain random emerald cost
execute store result score $gen.trade.cost spellcrafter.tmp run random value 0..15
scoreboard players add $gen.trade.cost spellcrafter.tmp 35


# Create offer
execute unless score $gen.trade.cost spellcrafter.tmp matches 1.. run scoreboard players set $gen.trade.cost spellcrafter.tmp 1
execute unless score $gen.trade.cost spellcrafter.tmp matches ..64 run scoreboard players set $gen.trade.cost spellcrafter.tmp 64

data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:1,xp:0,buy:{id:"minecraft:emerald",count:1},sell:{id:"minecraft:stone",count:1}}
data modify entity @s Offers.Recipes[-1].sell set from entity @s equipment.head
execute store result entity @s Offers.Recipes[-1].buy.count int 1 run scoreboard players get $gen.trade.cost spellcrafter.tmp
