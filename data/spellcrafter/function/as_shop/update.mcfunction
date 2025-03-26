#> as shop interaction entity

execute unless score @s spellcrafter.shop.value matches 1.. run scoreboard players set @s spellcrafter.shop.value 1
scoreboard players operation $shop.value spellcrafter.tmp = @s spellcrafter.shop.value
execute on passengers as @s[tag=spellcrafter.shop.text] run data modify entity @s text set value {"score":{"name":"$shop.value","objective":"spellcrafter.tmp"},"color":"green"}
