#> any

# score "$shop.id spellcrafter.tmp" contains the caster id of who can use this shop
# score "$shop.type spellcrafter.tmp" contains the shop type (0 is default)
# score "$shop.uses spellcrafter.tmp" contains the number times this shop can be used
# score "$shop.value spellcrafter.tmp" contains the default value of the item

# Note: certain input "type" will ignore input "value"

execute align xyz positioned ~.5 ~.1 ~.5 unless entity @e[distance=..0.001,type=minecraft:interaction,tag=spellcrafter.shop.interaction] summon minecraft:interaction run function spellcrafter:as_shop/summon/as_interaction
