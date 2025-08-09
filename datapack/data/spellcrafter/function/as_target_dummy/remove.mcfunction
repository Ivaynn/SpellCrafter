#> as target dummy, at @s

function spellcrafter:as_target_dummy/drop_item
loot spawn ~ ~ ~ loot spellcrafter:egg/dummy
data modify entity @s DeathLootTable set value "spellcrafter:empty"
data remove entity @s CustomName

effect give @s minecraft:invisibility infinite 0 true
execute at @s run tp @s ~ -999 ~
kill @s[type=!minecraft:player]
