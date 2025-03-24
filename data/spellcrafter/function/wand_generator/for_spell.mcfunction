#> recursive function (limited by score "$iter spellcrafter.tmp")
#> as item_display
# storage "spellcrafter:tmp gen.spells" contains a list of spell ids
# storage "spellcrafter:tmp wand.spells" must start empty


# Get first spell
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp gen.spells[0]
data remove storage spellcrafter:tmp gen.spells[0]


# Insert item
function spellcrafter:wand_generator/loot_insert


# Get spell data
data remove storage spellcrafter:tmp spell
data modify storage spellcrafter:tmp spell set from entity @s item.components."minecraft:custom_data".spellcrafter.spell


# Update wand data
function spellcrafter:as_table/close/append_data


# Next iteration...
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:wand_generator/for_spell
