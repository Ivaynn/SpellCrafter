#> as table, at barrel


# Stop default sound
stopsound @a[distance=..10] block minecraft:block.barrel.open


# Lock barrel
data merge block ~ ~ ~ {lock:{components:{"minecraft:custom_data":{spellcrafter:{table_lock:1}}}}}


# Empty barrel
data remove storage spellcrafter:tmp items
data modify storage spellcrafter:tmp items set from block ~ ~ ~ Items
execute if data storage spellcrafter:tmp items[0] run function spellcrafter:as_table/close/drop_items


# As player...
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
scoreboard players set $success spellcrafter.tmp 0
execute as @a[limit=1,distance=..10,predicate=spellcrafter:match_id] run function spellcrafter:as_table/open/as_player


# Custom sounds
execute if score $success spellcrafter.tmp matches 1 run playsound minecraft:block.enchantment_table.use block @a[distance=..100] ~ ~ ~ 1 1.6
execute if score $success spellcrafter.tmp matches 0 run playsound minecraft:item.book.page_turn block @a[distance=..100] ~ ~ ~ 0.5 1.9


# If wand information was not found, stop here
execute if score $success spellcrafter.tmp matches 0 run return 0


# Convert spell data into items
scoreboard players set $iter spellcrafter.tmp 0
data remove storage spellcrafter:tmp items
execute store success score $has_slots spellcrafter.tmp run data get storage spellcrafter:tmp wand.slots[0]
function spellcrafter:as_table/open/for_spell
data remove block ~ ~ ~ Items[{components:{"minecraft:custom_data":{spellcrafter:{invalid:1b}}}}]
