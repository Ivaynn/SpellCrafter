#> execute summon (text_display)

data modify entity @s text set value {selector:"@p[distance=..0.001,tag=scarena.tmp]"}
data modify storage scarena:stats entry.name set from entity @s text.extra[1]
data modify storage scarena:stats entry.uuid set from entity @s text.hover_event.uuid
kill @s
