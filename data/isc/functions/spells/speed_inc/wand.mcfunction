
data modify storage isc:tmp wand.spells append value "speed_inc"
data modify storage isc:tmp lore append value '{"text":"⛶ Speed +","color":"blue","italic":false}'
scoreboard players add $mana isc.tmp 10
