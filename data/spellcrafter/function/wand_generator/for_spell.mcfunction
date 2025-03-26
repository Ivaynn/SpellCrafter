#> recursive function (limited by score "$iter spellcrafter.tmp")
#> as item_display
# storage "spellcrafter:tmp gen.spells" contains a list of spell ids
# storage "spellcrafter:tmp wand.spells" must start empty


# Projectile or modifier (1, 2)
scoreboard players set $gen.type spellcrafter.tmp 2

execute store result score $gen.random spellcrafter.tmp run random value 1..5
execute unless score $gen.last_proj spellcrafter.tmp matches 1..4 run scoreboard players set $gen.type spellcrafter.tmp 1

execute if score $gen.last_proj spellcrafter.tmp matches 1..2 if score $gen.random spellcrafter.tmp matches ..1 run scoreboard players set $gen.type spellcrafter.tmp 1
execute if score $gen.last_proj spellcrafter.tmp matches 3..4 if score $gen.random spellcrafter.tmp matches ..2 run scoreboard players set $gen.type spellcrafter.tmp 1

execute if score $iter spellcrafter.tmp matches 1 run scoreboard players set $gen.type spellcrafter.tmp 1


# Instant or special (3, 4)
execute store result score $gen.random spellcrafter.tmp run random value 1..20
execute if score $gen.random spellcrafter.tmp matches 20 run scoreboard players set $gen.type spellcrafter.tmp 4
execute if score $gen.random spellcrafter.tmp matches 15..19 run scoreboard players set $gen.type spellcrafter.tmp 3


# Update "last_proj" counter
execute if score $gen.type spellcrafter.tmp matches 1 run scoreboard players set $gen.last_proj spellcrafter.tmp 4


# Insert item
loot replace entity @s contents loot spellcrafter:random_spell


# Get spell data
data remove storage spellcrafter:tmp spell
data modify storage spellcrafter:tmp spell set from entity @s item.components."minecraft:custom_data".spellcrafter.spell


# Update wand data
function spellcrafter:as_table/close/append_data


# Next iteration...
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:wand_generator/for_spell
