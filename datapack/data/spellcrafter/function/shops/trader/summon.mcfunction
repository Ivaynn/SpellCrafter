#> as any

execute store result score $gen.random spellcrafter.tmp run random value 1..10
execute if score $gen.random spellcrafter.tmp matches 1..2 run scoreboard players set $gen.shop.tier spellcrafter.tmp 1
execute if score $gen.random spellcrafter.tmp matches 3..5 run scoreboard players set $gen.shop.tier spellcrafter.tmp 2
execute if score $gen.random spellcrafter.tmp matches 6..7 run scoreboard players set $gen.shop.tier spellcrafter.tmp 3
execute if score $gen.random spellcrafter.tmp matches 8..9 run scoreboard players set $gen.shop.tier spellcrafter.tmp 4
execute if score $gen.random spellcrafter.tmp matches 10 run scoreboard players set $gen.shop.tier spellcrafter.tmp 5

execute summon minecraft:wandering_trader run function spellcrafter:shops/trader/as_summon
