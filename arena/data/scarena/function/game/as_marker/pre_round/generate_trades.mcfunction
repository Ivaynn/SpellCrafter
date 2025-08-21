#> execute summon (wandering_trader)


# Generate trades
function spellcrafter:shops/trader/as_summon


# Add apple offer
data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:5,xp:0,buy:{id:"minecraft:emerald",count:48},sell:{id:"minecraft:apple",count:1}}
loot replace entity @s weapon.mainhand loot scarena:apple
data modify entity @s Offers.Recipes[-1].sell set from entity @s equipment.mainhand
data remove entity @s equipment.mainhand


# Remove temporary trader
data modify storage scarena:tmp trades set from entity @s Offers
kill @s
