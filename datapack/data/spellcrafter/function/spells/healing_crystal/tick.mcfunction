#> [tick] as item_display, at @s


particle minecraft:dust{color:[0.8,0.3,0.3],scale:1.5} ~ ~ ~ 0.4 0.4 0.4 0 1 normal @a[distance=..50]
tp @s ~ ~ ~ ~5 ~


# Shoot every X seconds
scoreboard players operation $rem spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $rem spellcrafter.tmp %= #60 spellcrafter.math
execute unless score $rem spellcrafter.tmp matches 1 run return 0


# Get rotation: find neaby caster or cancel
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players set $success spellcrafter.tmp 0
execute at @s anchored feet positioned ~ ~-0.75 ~ facing entity @e[distance=..10,limit=1,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id] feet store success score $success spellcrafter.tmp run tp @s ~ ~1 ~ ~ ~
execute if score $success spellcrafter.tmp matches 1.. run function spellcrafter:spells/healing_crystal/create_projectile
execute unless score $success spellcrafter.tmp matches 1.. run function spellcrafter:spells/healing_crystal/no_targets
tp @s ~ ~ ~ ~ ~
