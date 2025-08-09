#> as marker, at @s

execute as @s[tag=spellcrafter.egg.table] align xyz positioned ~.5 ~ ~.5 run function spellcrafter:egg/table
execute as @s[tag=spellcrafter.egg.dummy] run function spellcrafter:egg/dummy
execute as @s[tag=spellcrafter.egg.trader] run function spellcrafter:egg/trader

execute as @s[tag=spellcrafter.egg.husk] run function spellcrafter:as_caster/nonplayer/summon/husk
execute as @s[tag=spellcrafter.egg.zombie_villager] run function spellcrafter:as_caster/nonplayer/summon/zombie_villager
execute as @s[tag=spellcrafter.egg.stray] run function spellcrafter:as_caster/nonplayer/summon/stray
execute as @s[tag=spellcrafter.egg.vindicator] run function spellcrafter:as_caster/nonplayer/summon/vindicator
execute as @s[tag=spellcrafter.egg.wither_skeleton] run function spellcrafter:as_caster/nonplayer/summon/wither_skeleton

kill @s[type=minecraft:marker]
