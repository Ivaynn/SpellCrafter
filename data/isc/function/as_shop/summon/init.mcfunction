#> any
# score "$shop.type isc.tmp" contains the shop type (0 is default)
# score "$shop.id isc.tmp" contains the caster id of who can use this shop

execute align xyz positioned ~.5 ~.1 ~.5 unless entity @e[distance=..0.001,type=minecraft:interaction,tag=isc.shop.interaction] summon minecraft:interaction run function isc:as_shop/summon/as_interaction
