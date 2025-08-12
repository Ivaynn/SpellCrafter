#> as target dummy, at @s


# Drop held item
function spellcrafter:as_target_dummy/drop_item


# Drop spawn egg with custom name
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone",count:1b},Tags:["spellcrafter.tmp"]}
loot replace entity @e[limit=1,distance=..0.001,type=minecraft:item,tag=spellcrafter.tmp] contents loot spellcrafter:egg/dummy
execute if data entity @s CustomName unless data entity @s {CustomName:{translate:"spellcrafter.entity.target_dummy",fallback:"Target Dummy"}} run data modify entity @e[limit=1,distance=..0.001,type=minecraft:item,tag=spellcrafter.tmp] Item.components."minecraft:custom_name" set from entity @s CustomName
tag @e[limit=1,distance=..0.001,type=minecraft:item,tag=spellcrafter.tmp] remove spellcrafter.tmp


# Reset self
data modify entity @s DeathLootTable set value "spellcrafter:empty"
data remove entity @s CustomName


# Clean death
playsound minecraft:entity.allay.death neutral @a[distance=..100] ~ ~ ~ 1 0.8
effect give @s minecraft:invisibility infinite 0 true
execute at @s run tp @s ~ -999 ~
kill @s[type=!minecraft:player]
