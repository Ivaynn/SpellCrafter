#> as player, holding wand
# storage "spellcrafter:tmp wand" contains the wand data


# Wand base stats
scoreboard players set $mana spellcrafter.tmp 0
scoreboard players set $cooldown spellcrafter.tmp 0
scoreboard players set $spell_cap spellcrafter.tmp 0
scoreboard players set $spell_count spellcrafter.tmp 0

execute store result score $mana spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_mana
execute store result score $cooldown spellcrafter.tmp run data get storage spellcrafter:tmp wand.base_cooldown
execute store result score $spell_cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap


# Set mana and cooldown
execute store result storage spellcrafter:tmp wand.mana int 1 run scoreboard players get $mana spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.cooldown int 1 run scoreboard players get $cooldown spellcrafter.tmp


# Create storage with the cooldown in seconds format for the lore
function spellcrafter:as_table/close/cooldown_sec


# Modify wand item
item modify entity @s weapon spellcrafter:wand/update
item modify entity @s weapon spellcrafter:wand/empty
item modify entity @s weapon spellcrafter:wand/lore/empty
