#> as table, at barrel


# Stop default sound
stopsound @a[distance=..10] block minecraft:block.barrel.open


# Lock barrel (max anvil name is 50 characters long, this is 100 random characters)
data modify block ~ ~ ~ Lock set value "75NoYb40vYJvWC7cxWBKNsKqWUfdS1mCjRidmlhHY8xz1WFuNxOrLQ31DpYjjY19YXn0D6Fg0dfG846NpOn4Vzyj8oNscbDrteMU"


# Empty barrel
data remove storage isc:tmp items
data modify storage isc:tmp items set from block ~ ~ ~ Items
execute if data block ~ ~ ~ Items[0] run function isc:as_table/close/drop_items


# As player...
scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players set $success isc.tmp 0
execute as @a[limit=1,distance=..10,predicate=isc:match_id] store result score $success isc.tmp run function isc:as_table/open/as_player


# If wand information was not found, stop here
execute if score $success isc.tmp matches 0 run return 0


# Custom sounds
playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 1.6


# Convert spell data into items
scoreboard players set $iter isc.tmp 0
data modify storage isc:tmp items set value []
function isc:as_table/open/for_spell
data remove block ~ ~ ~ Items[{tag:{isc:{invalid:1b}}}]
