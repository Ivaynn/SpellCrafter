#> as shop


# New item
execute unless score $shop.type isc.tmp matches 1..1 run scoreboard players set $shop.type isc.tmp 1
execute if score $shop.type isc.tmp matches 1 on passengers as @s[tag=isc.shop.item] run loot replace entity @s contents loot isc:shop/spell


# Get item value
execute if score $shop.type isc.tmp matches 1 run function isc:as_shop/summon/new_item/spell
execute unless score $shop.value isc.tmp matches 1.. run scoreboard players set $shop.value isc.tmp 1


# Save price
scoreboard players operation @s isc.shop.value = $shop.value isc.tmp
execute on passengers as @s[tag=isc.shop.text] run data modify entity @s text set value '{"score":{"name":"$shop.value","objective":"isc.tmp"},"color":"green"}'
