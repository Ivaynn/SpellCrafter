#> as wandering trader, at @s


# Generate spell
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 0 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_1/all
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_1/projectile
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_1/modifier
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_1/instant
execute if score $gen.tier spellcrafter.tmp matches 1 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_1/special

execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 0 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_2/all
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_2/projectile
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_2/modifier
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_2/instant
execute if score $gen.tier spellcrafter.tmp matches 2 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_2/special

execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 0 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_3/all
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_3/projectile
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_3/modifier
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_3/instant
execute if score $gen.tier spellcrafter.tmp matches 3 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_3/special

execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 0 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_4/all
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_4/projectile
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_4/modifier
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_4/instant
execute if score $gen.tier spellcrafter.tmp matches 4 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_4/special

execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 0 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_5/all
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 1 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_5/projectile
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 2 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_5/modifier
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 3 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_5/instant
execute if score $gen.tier spellcrafter.tmp matches 5 if score $gen.type spellcrafter.tmp matches 4 run loot replace entity @s weapon.mainhand loot spellcrafter:gen/tier_5/special


# Get tier of the generated spell
execute store result score $gen.trade.tier spellcrafter.tmp run data get entity @s equipment.mainhand.components."minecraft:custom_data".spellcrafter.spell.tier


# Get cost of the spell
scoreboard players operation $gen.trade.cost spellcrafter.tmp = $gen.trade.tier spellcrafter.tmp
scoreboard players operation $gen.trade.cost spellcrafter.tmp *= #5 spellcrafter.math
scoreboard players add $gen.trade.cost spellcrafter.tmp 5

execute if score $gen.trade.tier spellcrafter.tmp matches 1 store result score $gen.trade.random spellcrafter.tmp run random value -1..3
execute if score $gen.trade.tier spellcrafter.tmp matches 2 store result score $gen.trade.random spellcrafter.tmp run random value -2..6
execute if score $gen.trade.tier spellcrafter.tmp matches 3 store result score $gen.trade.random spellcrafter.tmp run random value -3..9
execute if score $gen.trade.tier spellcrafter.tmp matches 4 store result score $gen.trade.random spellcrafter.tmp run random value -4..12
execute if score $gen.trade.tier spellcrafter.tmp matches 5 store result score $gen.trade.random spellcrafter.tmp run random value -5..15

scoreboard players operation $gen.trade.cost spellcrafter.tmp += $gen.trade.random spellcrafter.tmp


# Create offer
execute unless score $gen.trade.cost spellcrafter.tmp matches 1.. run scoreboard players set $gen.trade.cost spellcrafter.tmp 1
execute unless score $gen.trade.cost spellcrafter.tmp matches ..64 run scoreboard players set $gen.trade.cost spellcrafter.tmp 64

data modify entity @s Offers.Recipes append value {rewardExp:0b,maxUses:1,xp:0,buy:{id:"minecraft:emerald",count:1},sell:{id:"minecraft:stone",count:1}}
data modify entity @s Offers.Recipes[-1].sell set from entity @s equipment.mainhand
execute store result entity @s Offers.Recipes[-1].buy.count int 1 run scoreboard players get $gen.trade.cost spellcrafter.tmp
