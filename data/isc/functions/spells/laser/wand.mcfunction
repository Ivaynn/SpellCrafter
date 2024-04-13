#> any
# spell id / lore text / mana cost

data modify storage isc:tmp wand.spells append value "laser"
data modify storage isc:tmp lore append value '{"text":"→ Laser","color":"gold","italic":false}'
scoreboard players add $mana isc.tmp 30
