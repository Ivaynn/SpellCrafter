#> as player, holding wand
# storage "isc:tmp wand" contains the wand data


# Wand base stats
scoreboard players set $mana isc.tmp 0
scoreboard players set $cooldown isc.tmp 0
scoreboard players set $spell_cap isc.tmp 0
scoreboard players set $spell_count isc.tmp 0

execute store result score $mana isc.tmp run data get storage isc:tmp wand.base_mana
execute store result score $cooldown isc.tmp run data get storage isc:tmp wand.base_cooldown
execute store result score $spell_cap isc.tmp run data get storage isc:tmp wand.cap


# Set mana and cooldown
execute store result storage isc:tmp wand.mana int 1 run scoreboard players get $mana isc.tmp
execute store result storage isc:tmp wand.cooldown int 1 run scoreboard players get $cooldown isc.tmp


# Create storage with the cooldown in seconds format for the lore
function isc:as_table/close/cooldown_sec


# Modify wand item
item modify entity @s weapon isc:wand/update
item modify entity @s weapon isc:wand/empty
item modify entity @s weapon isc:wand/lore/empty
