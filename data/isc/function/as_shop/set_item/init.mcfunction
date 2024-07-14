#> as shop


# New item from shop type:
# 0 - default
# 1 - spell (tier 1)
execute unless score $shop.type isc.tmp matches 0.. run scoreboard players set $shop.type isc.tmp 0
execute if score $shop.type isc.tmp matches 1 on passengers as @s[tag=isc.shop.item] run loot replace entity @s contents loot isc:shop/spell_t1


# Get item value
execute if score $shop.type isc.tmp matches 1 run function isc:as_shop/set_item/spell_t1
