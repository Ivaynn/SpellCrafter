#> recursive function (limited by score "$slot spellcrafter.tmp")

function spellcrafter:as_table/open/book/read_two
execute if score $value spellcrafter.tmp matches -1 run return 0

# If there's a spell, append it
execute if score $value spellcrafter.tmp matches 1.. run data modify storage spellcrafter:tmp wand.spells append value 0
execute if score $value spellcrafter.tmp matches 1.. store result storage spellcrafter:tmp wand.spells[-1] int 1 run scoreboard players get $value spellcrafter.tmp


# If there's a spell, save its slot too
execute if score $value spellcrafter.tmp matches 1.. run data modify storage spellcrafter:tmp wand.slots append value 0
execute if score $value spellcrafter.tmp matches 1.. store result storage spellcrafter:tmp wand.slots[-1] int 1 run scoreboard players get $slot spellcrafter.tmp


# Next slot
data modify storage spellcrafter:tmp trigger.code.characters set string storage spellcrafter:tmp trigger.code.characters 2
scoreboard players add $slot spellcrafter.tmp 1
execute if score $slot spellcrafter.tmp matches 0..26 run function spellcrafter:as_table/open/book/for_spell
