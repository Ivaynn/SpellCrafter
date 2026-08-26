#> recursive function (limited by score "$slot spellcrafter.tmp")

scoreboard players set $value spellcrafter.tmp 0
scoreboard players set $spell.slot spellcrafter.tmp 0
execute store result score $spell.slot spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.slots[0]
execute unless score $spell.slot spellcrafter.tmp matches 1.. run scoreboard players operation $spell.slot spellcrafter.tmp = $slot spellcrafter.tmp
execute if score $spell.slot spellcrafter.tmp = $slot spellcrafter.tmp store result score $value spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.wand.spells[0]

execute if score $value spellcrafter.tmp matches 1.. run data remove storage spellcrafter:tmp trigger.code.wand.spells[0]
execute if score $value spellcrafter.tmp matches 1.. run data remove storage spellcrafter:tmp trigger.code.wand.slots[0]

function spellcrafter:as_player/trigger/wand_code/append_two


# Next slot
scoreboard players add $slot spellcrafter.tmp 1
execute if score $slot spellcrafter.tmp matches 0..26 run function spellcrafter:as_player/trigger/wand_code/for_spell
