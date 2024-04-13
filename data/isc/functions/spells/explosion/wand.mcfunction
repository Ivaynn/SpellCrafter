#> any
# spell id / lore text / mana cost

data modify storage isc:tmp wand.spells append value "explosion"
data modify storage isc:tmp lore append value '{"text":"✦ Explosion","color":"red","italic":false}'
scoreboard players add $mana isc.tmp 50
