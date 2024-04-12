
# Get item id
data modify storage isc:tmp id set from storage isc:tmp wand.items[0].id


# Items -> spells (TODO - optimize: stop checking after the first match & sort by most common)
execute if data storage isc:tmp {id:"minecraft:ghast_tear"} run function isc:spells/magic_missile/wand
execute if data storage isc:tmp {id:"minecraft:fire_charge"} run function isc:spells/fireball/wand
execute if data storage isc:tmp {id:"minecraft:tnt"} run function isc:spells/explosion/wand
execute if data storage isc:tmp {id:"minecraft:diamond"} run function isc:spells/duplicate/wand
execute if data storage isc:tmp {id:"minecraft:target"} run function isc:spells/homing/wand
execute if data storage isc:tmp {id:"minecraft:golden_apple"} run function isc:spells/heal/wand
execute if data storage isc:tmp {id:"minecraft:lightning_rod"} run function isc:spells/summon_lightning/wand
execute if data storage isc:tmp {id:"minecraft:ender_pearl"} run function isc:spells/teleport/wand
execute if data storage isc:tmp {id:"minecraft:blaze_powder"} run function isc:spells/empower/wand
execute if data storage isc:tmp {id:"minecraft:chorus_fruit"} run function isc:spells/random_dir/wand
execute if data storage isc:tmp {id:"minecraft:amethyst_shard"} run function isc:spells/laser/wand
execute if data storage isc:tmp {id:"minecraft:arrow"} run function isc:spells/multishot/wand
execute if data storage isc:tmp {id:"minecraft:gold_ingot"} run function isc:spells/speed_inc/wand
execute if data storage isc:tmp {id:"minecraft:gold_nugget"} run function isc:spells/speed_dec/wand
execute if data storage isc:tmp {id:"minecraft:iron_ingot"} run function isc:spells/range_inc/wand
execute if data storage isc:tmp {id:"minecraft:iron_nugget"} run function isc:spells/range_dec/wand
execute if data storage isc:tmp {id:"minecraft:vex_spawn_egg"} run function isc:spells/summon_vex/wand
execute if data storage isc:tmp {id:"minecraft:emerald"} run function isc:spells/multicast/wand
execute if data storage isc:tmp {id:"minecraft:lever"} run function isc:spells/guide/wand


# Next item
data remove storage isc:tmp wand.items[0]
scoreboard players remove $iter isc.tmp 1
execute if score $iter isc.tmp matches 1.. run function isc:as_player/update_wand/for_item
