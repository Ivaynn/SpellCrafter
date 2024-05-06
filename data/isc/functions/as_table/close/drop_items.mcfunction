#> as table, at barrel
# storage "isc:tmp items" must contain barrel items

playsound minecraft:block.dispenser.dispense player @a ~ ~ ~ 1 1

setblock ~ ~ ~ minecraft:yellow_shulker_box replace
data modify block ~ ~ ~ Items set from storage isc:tmp items
loot spawn ~ ~1 ~ mine ~ ~ ~ minecraft:stone[minecraft:custom_data={drop_contents:1b}]
function isc:as_table/place/setblock
