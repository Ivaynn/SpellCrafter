
data modify storage isc:tmp wand.spells append value "heal"
data modify storage isc:tmp lore append value '{"text":"✦ Heal","color":"green","italic":false}'
scoreboard players add $mana isc.tmp 20
