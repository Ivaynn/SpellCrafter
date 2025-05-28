#> execute summon (text_display)

data modify entity @s text set value {translate:"spellcrafter.entity.summon.endermite",fallback:"%s's Endermite",with:[{selector:"@e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id]"}]}
data modify storage spellcrafter:tmp summon.name append from entity @s text
kill @s
