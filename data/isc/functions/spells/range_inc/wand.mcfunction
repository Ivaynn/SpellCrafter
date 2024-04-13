#> any
# spell id / lore text / mana cost

data modify storage isc:tmp wand.spells append value "range_inc"
data modify storage isc:tmp lore append value '{"text":"⛶ Range +","color":"gray","italic":false}'
scoreboard players add $mana isc.tmp 10
