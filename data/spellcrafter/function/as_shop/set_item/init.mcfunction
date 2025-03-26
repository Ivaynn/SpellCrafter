#> as shop


# Shop type #1: spells (tier 1)
scoreboard players set $gen.type spellcrafter.tmp 1
scoreboard players set $gen.tier spellcrafter.tmp 1

execute if score $shop.type spellcrafter.tmp matches 1 on passengers as @s[tag=spellcrafter.shop.item] run loot replace entity @s contents loot spellcrafter:random_spell
execute if score $shop.type spellcrafter.tmp matches 1 run function spellcrafter:as_shop/set_item/spell_t1


# Shop type #2: spells (tier 2)



# Shop type #3: spells (tier 3)


