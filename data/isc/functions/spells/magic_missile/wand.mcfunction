
data modify storage isc:tmp wand.spells append value "magic_missile"
data modify storage isc:tmp lore append value '{"text":"→ Magic Missile","color":"gold","italic":false}'
scoreboard players add $mana isc.tmp 20
