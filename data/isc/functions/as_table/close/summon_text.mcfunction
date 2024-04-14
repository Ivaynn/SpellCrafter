#> as new text_display

data modify entity @s text set value '[{"text":"❖ ","color":"aqua","italic":false},{"score":{"name":"$mana","objective":"isc.tmp"},"color":"aqua","italic":false}]'
data modify storage isc:tmp lore[0] set from entity @s text
kill @s
