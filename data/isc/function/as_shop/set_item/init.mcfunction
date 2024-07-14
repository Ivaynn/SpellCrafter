#> as shop


# Shop type #1: spells (tier 1)
execute if score $shop.type isc.tmp matches 1 on passengers as @s[tag=isc.shop.item] run loot replace entity @s contents loot isc:shop/spell_t1
execute if score $shop.type isc.tmp matches 1 run function isc:as_shop/set_item/spell_t1


# Shop type #2: spells (tier 2)



# Shop type #3: spells (tier 3)


