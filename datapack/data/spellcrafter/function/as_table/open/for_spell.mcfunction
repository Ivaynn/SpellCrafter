#> recursive function (limited by length of storage "spellcrafter:tmp wand.spells")
#> as any, at barrel
# storage "spellcrafter:tmp wand.spells" must contain the spell list


# Insert item into barrel
execute if score $has_slots spellcrafter.tmp matches 1 run function spellcrafter:as_table/open/insert
execute if score $has_slots spellcrafter.tmp matches 0 run function spellcrafter:as_table/open/insert_fast


# Next iteration...
scoreboard players add $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches ..26 if data storage spellcrafter:tmp wand.spells[0] run function spellcrafter:as_table/open/for_spell
