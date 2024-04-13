#> any
# spell id / lore text / mana cost

data modify storage isc:tmp wand.spells append value "speed_dec"
data modify storage isc:tmp lore append value '{"text":"⛶ Speed -","color":"gray","italic":false}'
scoreboard players add $mana isc.tmp 10
