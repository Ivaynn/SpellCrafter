#> any
# spell id / lore text / mana cost

data modify storage isc:tmp wand.spells append value "multishot"
data modify storage isc:tmp lore append value '{"text":"⛶ Multishot","color":"blue","italic":false}'
scoreboard players add $mana isc.tmp 50
