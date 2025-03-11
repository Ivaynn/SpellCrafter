#> as any, at barrel


# Get the first spell
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[0]
data remove storage spellcrafter:tmp wand.spells[0]


# Insert item
function spellcrafter:as_table/open/loot_insert
