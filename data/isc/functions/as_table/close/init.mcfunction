#> as table, at barrel


# Stop default sound
stopsound @a[distance=..10] block minecraft:block.barrel.close


# Unlock barrel
data remove block ~ ~ ~ Lock


# Put item data in storage & clear items
data remove storage isc:tmp items
data modify storage isc:tmp items set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items


# As player...
scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players set $success isc.tmp 0
execute as @a[limit=1,distance=..10,predicate=isc:match_id] store result score $success isc.tmp run function isc:as_table/close/as_player


# Lose player's id
scoreboard players reset @s isc.id


# If the conversion failed, drop items instead
execute if score $success isc.tmp matches 0 if data storage isc:tmp items[0] run function isc:as_table/close/drop_items


# Custom sounds
execute if score $success isc.tmp matches 1 run playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 1.2
