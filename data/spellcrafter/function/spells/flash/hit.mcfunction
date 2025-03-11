#> as target


# Blind duration depends on distance
execute if score $ray spellcrafter.tmp matches ..10 run effect give @s minecraft:blindness 1 0 false
execute if score $ray spellcrafter.tmp matches 11..30 run effect give @s minecraft:blindness 2 0 false
execute if score $ray spellcrafter.tmp matches 31..50 run effect give @s minecraft:blindness 3 0 false
execute if score $ray spellcrafter.tmp matches 51..65 run effect give @s minecraft:blindness 4 0 false
execute if score $ray spellcrafter.tmp matches 66..80 run effect give @s minecraft:blindness 5 0 false
execute if score $ray spellcrafter.tmp matches 81..90 run effect give @s minecraft:blindness 6 0 false
execute if score $ray spellcrafter.tmp matches 91..100 run effect give @s minecraft:blindness 7 0 false
execute if score $ray spellcrafter.tmp matches 101..105 run effect give @s minecraft:blindness 8 0 false
execute if score $ray spellcrafter.tmp matches 106..110 run effect give @s minecraft:blindness 9 0 false
execute if score $ray spellcrafter.tmp matches 111.. run effect give @s minecraft:blindness 10 0 false


# Stop searching
scoreboard players set $ray spellcrafter.tmp 0
