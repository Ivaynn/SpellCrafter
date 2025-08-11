#> as wandering trader, at @s


# Get stock
execute store result score $count spellcrafter.tmp run random value -2..4
scoreboard players operation $count spellcrafter.tmp += $gen.shop.tier spellcrafter.tmp
execute if score $count spellcrafter.tmp matches ..0 run return 0


# Create offer
data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:1,xp:0,buy:{id:"minecraft:emerald",count:12},sell:{id:"minecraft:cookie",count:1}}
loot replace entity @s weapon.mainhand loot spellcrafter:cookie
data modify entity @s Offers.Recipes[-1].sell set from entity @s equipment.mainhand
execute store result entity @s Offers.Recipes[-1].maxUses int 1 run scoreboard players get $count spellcrafter.tmp
