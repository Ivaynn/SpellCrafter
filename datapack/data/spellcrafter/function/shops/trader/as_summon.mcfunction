#> execute summon (trader), at @s
# score "$gen.shop.tier spellcrafter.tmp" must contain the tier of the shop
execute unless score $gen.shop.tier spellcrafter.tmp matches 1..5 run return run kill @s

effect give @s minecraft:glowing 10 0 true
data merge entity @s {DespawnDelay: 48000, Offers:{Recipes:[{buy:{id:"minecraft:emerald",count:2},sell:{id:"minecraft:emerald",count:1}}]}}
tag @s add spellcrafter.shop.trader
scoreboard players operation $gen.tier spellcrafter.tmp = $gen.shop.tier spellcrafter.tmp


# Get custom name
data modify storage spellcrafter:tmp summon.name set value []
execute summon minecraft:text_display run function spellcrafter:shops/trader/trader_name
data modify entity @s CustomName set from storage spellcrafter:tmp summon.name


# Add 0-1 random trade
scoreboard players set $gen.type spellcrafter.tmp 0
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 1-2 projectile spell trades
scoreboard players set $gen.type spellcrafter.tmp 1
function spellcrafter:shops/trader/add_spell_offer
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 0-1 random spell trade
scoreboard players set $gen.type spellcrafter.tmp 0
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 1-2 modifier spell trades
scoreboard players set $gen.type spellcrafter.tmp 2
function spellcrafter:shops/trader/add_spell_offer
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 0-1 random spell trade
scoreboard players set $gen.type spellcrafter.tmp 0
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 1-2 instant spell trades
scoreboard players set $gen.type spellcrafter.tmp 3
function spellcrafter:shops/trader/add_spell_offer
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 0-1 random spell trade
scoreboard players set $gen.type spellcrafter.tmp 0
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add 0-1 special spell trades
scoreboard players set $gen.type spellcrafter.tmp 4
execute if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_spell_offer


# Add up to 5 wands: limited to shop tier, 50% chance for each wand
scoreboard players set $gen.tier spellcrafter.tmp 1
execute if score $gen.shop.tier spellcrafter.tmp matches 1.. if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_wand_offer

scoreboard players set $gen.tier spellcrafter.tmp 2
execute if score $gen.shop.tier spellcrafter.tmp matches 2.. if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_wand_offer

scoreboard players set $gen.tier spellcrafter.tmp 3
execute if score $gen.shop.tier spellcrafter.tmp matches 3.. if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_wand_offer

scoreboard players set $gen.tier spellcrafter.tmp 4
execute if score $gen.shop.tier spellcrafter.tmp matches 4.. if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_wand_offer

scoreboard players set $gen.tier spellcrafter.tmp 5
execute if score $gen.shop.tier spellcrafter.tmp matches 5.. if predicate spellcrafter:random_50 run function spellcrafter:shops/trader/add_wand_offer


# Remove temporary items
data remove entity @s equipment.mainhand
data remove entity @s Offers.Recipes[0]
