#> as player
# storage "spellcrafter:tmp item" contains item data


# Header
tellraw @s ["\n\n\n",{"text":"          ","strikethrough": true,"color":"dark_gray"},{"text":" SpellCrafter Shop ","color":"dark_gray"},{"text":"          ","strikethrough": true,"color":"dark_gray"}]


# Item Name
tellraw @p[distance=..10,tag=spellcrafter.shop.tmp] ["\n   ",{"nbt":"item.components.\"minecraft:item_name\"","storage":"spellcrafter:tmp","interpret":true,"color":"light_purple"}]


# Item lore
data modify storage spellcrafter:tmp lore set from storage spellcrafter:tmp item.components."minecraft:lore"
execute store result score $iter spellcrafter.tmp run data get storage spellcrafter:tmp lore
execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:as_player/events/shop_left_click/for_lore

tellraw @s ""
