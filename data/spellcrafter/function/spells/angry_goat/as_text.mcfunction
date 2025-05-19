#> execute summon (text_display)

data modify entity @s text set value [{selector:"@e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id]"}, "'s Angry Goat"]
data modify storage spellcrafter:tmp summon.name set from entity @s text
kill @s
