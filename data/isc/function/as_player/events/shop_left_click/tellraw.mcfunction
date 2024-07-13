#> as player
# storage "isc:tmp item" contains item data


# Header
tellraw @s ["\n",{"text":"          ","strikethrough": true,"color":"dark_gray"},{"text":" SpellCrafter Shop ","color":"dark_gray"},{"text":"          ","strikethrough": true,"color":"dark_gray"}]


# Item Name
tellraw @p[distance=..10,tag=isc.shop.tmp] ["\n   ",{"nbt":"item.components.\"minecraft:item_name\"","storage":"isc:tmp","interpret":true,"color":"light_purple"}]


# Item lore
data modify storage isc:tmp lore set from storage isc:tmp item.components."minecraft:lore"
execute store result score $iter isc.tmp run data get storage isc:tmp lore
execute if score $iter isc.tmp matches 1.. run function isc:as_player/events/shop_left_click/for_lore

tellraw @s ""
