
data modify storage isc:tmp wand.spells append value "summon_lightning"
data modify storage isc:tmp lore append value '{"text":"✦ Summon Lightning","color":"red","italic":false}'
scoreboard players add $mana isc.tmp 150
