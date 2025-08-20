
execute summon minecraft:wandering_trader run function spellcrafter:shops/trader/as_summon
data modify storage scarena:tmp trades set from entity @n[type=minecraft:wandering_trader,distance=..0.001] Offers
kill @e[type=minecraft:wandering_trader,distance=..0.001]
