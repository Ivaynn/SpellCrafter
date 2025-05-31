#> recursive function (limited by score "$iter spellcrafter.tmp")
#> as any
# storage "spellcrafter:tmp drop" must start empty
# storage "spellcrafter:tmp keep" must start empty


# Check if item is a spell
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp items[0].components."minecraft:custom_data".spellcrafter.spell.id


# Special case: consumable spells that change wand stats
execute if score $spell spellcrafter.tmp matches 121 run function spellcrafter:spells/upgrade_mana/cast
execute if score $spell spellcrafter.tmp matches 122 run function spellcrafter:spells/upgrade_cooldown/cast
execute if score $spell spellcrafter.tmp matches 123 run function spellcrafter:spells/upgrade_slots/cast


# Spell cap
execute unless score $spell_cap spellcrafter.tmp matches 1.. run scoreboard players set $spell spellcrafter.tmp 0
execute if score $spell spellcrafter.tmp matches 1.. run scoreboard players remove $spell_cap spellcrafter.tmp 1


# Separate items to keep and items to drop
execute if score $spell spellcrafter.tmp matches 0 run data modify storage spellcrafter:tmp drop append from storage spellcrafter:tmp items[0]
execute if score $spell spellcrafter.tmp matches 1.. run data modify storage spellcrafter:tmp keep append from storage spellcrafter:tmp items[0]


# Next item
data remove storage spellcrafter:tmp items[0]
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:as_table/close/for_item
