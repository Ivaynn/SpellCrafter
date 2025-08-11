#> as marker, at trader's spawn location

function spellcrafter:shops/trader/summon
effect give @e[distance=..0.001,type=minecraft:wandering_trader,tag=spellcrafter.shop.trader] minecraft:glowing 30 0 true
scoreboard players set $success spellcrafter.tmp 1
