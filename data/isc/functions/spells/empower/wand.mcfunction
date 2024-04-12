
data modify storage isc:tmp wand.spells append value "empower"
data modify storage isc:tmp lore append value '{"text":"⛶ Empower","color":"blue","italic":false}'
scoreboard players add $mana isc.tmp 25
