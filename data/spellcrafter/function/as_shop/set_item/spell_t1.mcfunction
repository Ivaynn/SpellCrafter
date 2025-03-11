
# Get spell data
data remove storage spellcrafter:tmp spell
execute on passengers as @s[tag=spellcrafter.shop.item] run data modify storage spellcrafter:tmp spell set from entity @s item.components."minecraft:custom_data".spellcrafter.spell


# Get price
execute store result score $shop.tier spellcrafter.tmp run data get storage spellcrafter:tmp spell.tier
execute unless score $shop.tier spellcrafter.tmp matches 1..5 run scoreboard players set $shop.tier spellcrafter.tmp 1

execute if score $shop.tier spellcrafter.tmp matches 1 store result score @s spellcrafter.shop.value run random value 6..8
execute if score $shop.tier spellcrafter.tmp matches 2 store result score @s spellcrafter.shop.value run random value 9..11
execute if score $shop.tier spellcrafter.tmp matches 3 store result score @s spellcrafter.shop.value run random value 12..14
execute if score $shop.tier spellcrafter.tmp matches 4 store result score @s spellcrafter.shop.value run random value 15..17
execute if score $shop.tier spellcrafter.tmp matches 5 store result score @s spellcrafter.shop.value run random value 18..20
