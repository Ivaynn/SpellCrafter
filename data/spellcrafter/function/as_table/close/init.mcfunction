#> as table, at barrel


# Stop default sound
stopsound @a[distance=..10] block minecraft:block.barrel.close


# Unlock barrel
data remove block ~ ~ ~ lock


# Put item data in storage & clear items
data remove storage spellcrafter:tmp items
data modify storage spellcrafter:tmp items set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items


# As player...
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players set $success spellcrafter.tmp 0
execute as @a[limit=1,distance=..10,predicate=spellcrafter:match_id] store result score $success spellcrafter.tmp run function spellcrafter:as_table/close/as_player


# Lose player's id
scoreboard players reset @s spellcrafter.id


# If the conversion failed, drop items instead
execute if score $success spellcrafter.tmp matches 0 if data storage spellcrafter:tmp items[0] run function spellcrafter:as_table/close/drop_items


# Custom sounds
execute if score $success spellcrafter.tmp matches 1 run playsound minecraft:block.enchantment_table.use block @a ~ ~ ~ 1 1.2
execute if score $success spellcrafter.tmp matches 0 run playsound minecraft:item.book.page_turn block @a ~ ~ ~ 0.5 1.8


# Replace barrel
function spellcrafter:as_table/place/setblock
