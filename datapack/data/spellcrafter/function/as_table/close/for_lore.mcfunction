#> recursive function (limited by score "$iter spellcrafter.tmp")
#> as player
# storage "spellcrafter:tmp lore" must contain the lore array
# score "$iter spellcrafter.tmp" must contain the number of elements of the array


# Special case: secret
execute if score $spell.secret spellcrafter.tmp matches 1 run function spellcrafter:spells/secret/cast


# Add lore line
item modify entity @s weapon spellcrafter:wand/lore/add_spell
data remove storage spellcrafter:tmp lore[0]


# Iterate
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:as_table/close/for_lore
