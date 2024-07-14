#> as shop interaction entity

execute unless score @s isc.shop.value matches 1.. run scoreboard players set @s isc.shop.value 1
scoreboard players operation $shop.value isc.tmp = @s isc.shop.value
execute on passengers as @s[tag=isc.shop.text] run data modify entity @s text set value '{"score":{"name":"$shop.value","objective":"isc.tmp"},"color":"green"}'
