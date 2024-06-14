#> as caster, at @s

tag @s add isc.caster

# Increment #new and give this entity that id
scoreboard players add #new isc.id 1
scoreboard players operation @s isc.id = #new isc.id
