#> as any
# storage "spellcrafter:tmp wand.spells" must start empty


# Save spell slot
data modify storage spellcrafter:tmp wand.slots append from storage spellcrafter:tmp keep[0].Slot


# Get spell data
data remove storage spellcrafter:tmp spell
data modify storage spellcrafter:tmp spell set from storage spellcrafter:tmp keep[0].components."minecraft:custom_data".spellcrafter.spell


# Update wand data
function spellcrafter:as_table/close/append_data
