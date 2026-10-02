#> as player, at barrel

data modify storage spellcrafter:tmp attributes set value {sharp: 0, extended: 0, quickstep: 0}

execute store result storage spellcrafter:tmp attributes.sharp int 1 run scoreboard players get $spell.sharp spellcrafter.tmp
execute store result storage spellcrafter:tmp attributes.extended int 1 run scoreboard players get $spell.extended spellcrafter.tmp
execute store result storage spellcrafter:tmp attributes.quickstep int 1 run scoreboard players get $spell.quickstep spellcrafter.tmp

item modify entity @s weapon spellcrafter:wand/set_attributes
