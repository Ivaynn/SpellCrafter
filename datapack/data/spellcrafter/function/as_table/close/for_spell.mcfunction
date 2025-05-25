#> recursive function (limited by score "$iter spellcrafter.tmp")
#> as any
# storage "spellcrafter:tmp wand.spells" must start empty


# Append data to storage lists (wand.spells, lore, drop)
function spellcrafter:as_table/close/append


# Next item
data remove storage spellcrafter:tmp keep[0]
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:as_table/close/for_spell
