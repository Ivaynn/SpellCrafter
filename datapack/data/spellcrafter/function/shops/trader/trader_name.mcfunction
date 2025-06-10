#> execute summon (text_display)

data modify entity @s text set value {translate:"spellcrafter.entity.trader",fallback:"Mystic Merchant - Level %s",with:[{score:{"name":"$gen.shop.tier","objective":"spellcrafter.tmp"}}]}
data modify storage spellcrafter:tmp summon.name append from entity @s text
kill @s
