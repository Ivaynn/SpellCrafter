#> execute summon (item_display) at @s
# score "$gen.tier spellcrafter.tmp" contains the tier of the generated wand
tag @s add spellcrafter.gen


# NOTE: most of these commands are duplicated in "spellcrafter:as_table/..."


# Wand base stats
scoreboard players set $mana spellcrafter.tmp 0
scoreboard players set $cooldown spellcrafter.tmp 0
scoreboard players set $spell_cap spellcrafter.tmp 0
scoreboard players set $spell_count spellcrafter.tmp 0


# Special spells that modify the wand item
scoreboard players set $spell.sharp spellcrafter.tmp 0
scoreboard players set $spell.extended spellcrafter.tmp 0
scoreboard players set $spell.quickstep spellcrafter.tmp 0
scoreboard players set $spell.secret spellcrafter.tmp 0
scoreboard players set $spell.locked spellcrafter.tmp 0
scoreboard players set $spell.skip spellcrafter.tmp 0


# Generate empty wand
data modify storage spellcrafter:tmp wand set value {valid:1b, spells:[], slots:[], owner:0, mod:0, cap:0, cooldown:0, mana:0, base_cooldown:0, base_mana:0, skin:0}
data modify storage spellcrafter:tmp lore set value []


# Base stats: spell counts, base mana & base cooldown
execute if score $gen.tier spellcrafter.tmp matches 1 store result score $base_mana spellcrafter.tmp run random value 4..5
execute if score $gen.tier spellcrafter.tmp matches 2 store result score $base_mana spellcrafter.tmp run random value 3..4
execute if score $gen.tier spellcrafter.tmp matches 3 store result score $base_mana spellcrafter.tmp run random value 2..3
execute if score $gen.tier spellcrafter.tmp matches 4 store result score $base_mana spellcrafter.tmp run random value 1..2
execute if score $gen.tier spellcrafter.tmp matches 5 store result score $base_mana spellcrafter.tmp run random value 0..1
scoreboard players operation $base_mana spellcrafter.tmp *= #5 spellcrafter.math
execute store result storage spellcrafter:tmp wand.base_mana int 1 run scoreboard players get $base_mana spellcrafter.tmp

execute if score $gen.tier spellcrafter.tmp matches 1 store result score $base_cooldown spellcrafter.tmp run random value 25..45
execute if score $gen.tier spellcrafter.tmp matches 2 store result score $base_cooldown spellcrafter.tmp run random value 15..30
execute if score $gen.tier spellcrafter.tmp matches 3 store result score $base_cooldown spellcrafter.tmp run random value 10..20
execute if score $gen.tier spellcrafter.tmp matches 4 store result score $base_cooldown spellcrafter.tmp run random value 5..15
execute if score $gen.tier spellcrafter.tmp matches 5 store result score $base_cooldown spellcrafter.tmp run random value 0..10
execute store result storage spellcrafter:tmp wand.base_cooldown int 1 run scoreboard players get $base_cooldown spellcrafter.tmp

execute if score $gen.tier spellcrafter.tmp matches 1 store result score $spell_cap spellcrafter.tmp run random value 3..4
execute if score $gen.tier spellcrafter.tmp matches 2 store result score $spell_cap spellcrafter.tmp run random value 5..7
execute if score $gen.tier spellcrafter.tmp matches 3 store result score $spell_cap spellcrafter.tmp run random value 8..11
execute if score $gen.tier spellcrafter.tmp matches 4 store result score $spell_cap spellcrafter.tmp run random value 12..18
execute if score $gen.tier spellcrafter.tmp matches 5 store result score $spell_cap spellcrafter.tmp run random value 19..27
execute store result storage spellcrafter:tmp wand.cap int 1 run scoreboard players get $spell_cap spellcrafter.tmp

execute if score $gen.tier spellcrafter.tmp matches 1 store result score $gen.spell_count spellcrafter.tmp run random value 2..3
execute if score $gen.tier spellcrafter.tmp matches 2 store result score $gen.spell_count spellcrafter.tmp run random value 3..5
execute if score $gen.tier spellcrafter.tmp matches 3 store result score $gen.spell_count spellcrafter.tmp run random value 4..7
execute if score $gen.tier spellcrafter.tmp matches 4 store result score $gen.spell_count spellcrafter.tmp run random value 5..9
execute if score $gen.tier spellcrafter.tmp matches 5 store result score $gen.spell_count spellcrafter.tmp run random value 6..11


# Get a random spell modifier (shuffle: 25%, multicast: 10%, reverse: 5%)
execute store result score $wand_mod spellcrafter.tmp run random value -400..600
execute if score $wand_mod spellcrafter.tmp matches -250..0 run scoreboard players set $wand_mod spellcrafter.tmp 52
execute if score $wand_mod spellcrafter.tmp matches -350..-251 run scoreboard players set $wand_mod spellcrafter.tmp 10
execute if score $wand_mod spellcrafter.tmp matches -400..-351 run scoreboard players set $wand_mod spellcrafter.tmp 95
scoreboard players set $allowed_mod spellcrafter.tmp 0
execute store result score $allowed_mod spellcrafter.tmp run function spellcrafter:as_projectile/wand_mods
execute if score $allowed_mod spellcrafter.tmp matches 1 store result storage spellcrafter:tmp wand.mod int 1 run scoreboard players get $wand_mod spellcrafter.tmp


# Get spell base stats
scoreboard players operation $mana spellcrafter.tmp = $base_mana spellcrafter.tmp
scoreboard players operation $cooldown spellcrafter.tmp = $base_cooldown spellcrafter.tmp


# Iterate through the generated spell list
scoreboard players set $gen.last_proj spellcrafter.tmp 0
scoreboard players set $clone_multiplier spellcrafter.tmp 1
scoreboard players operation $iter spellcrafter.tmp = $gen.spell_count spellcrafter.tmp
function spellcrafter:wand_generator/for_spell


# Get empty wand item
item replace entity @s contents with minecraft:air
loot replace entity @s contents loot spellcrafter:gen/base_wand


# Special case: attribute spells -> calculate and save mana drain
scoreboard players set $attribute_drain spellcrafter.tmp 0
scoreboard players operation $attribute_drain spellcrafter.tmp += $spell.sharp spellcrafter.tmp
scoreboard players operation $attribute_drain spellcrafter.tmp += $spell.extended spellcrafter.tmp
scoreboard players operation $attribute_drain spellcrafter.tmp += $spell.quickstep spellcrafter.tmp
scoreboard players operation $attribute_drain spellcrafter.tmp *= #15 spellcrafter.math

execute store result storage spellcrafter:tmp wand.drain int 1 run scoreboard players get $attribute_drain spellcrafter.tmp
execute if score $attribute_drain spellcrafter.tmp matches 1.. run item modify entity @s contents spellcrafter:wand/set_attributes


# Save mana cost & cooldown to wand object
execute unless score $mana spellcrafter.tmp matches 0.. run scoreboard players set $mana spellcrafter.tmp 0
execute unless score $cooldown spellcrafter.tmp matches 0.. run scoreboard players set $cooldown spellcrafter.tmp 0
execute store result storage spellcrafter:tmp wand.mana int 1 run scoreboard players get $mana spellcrafter.tmp
execute store result storage spellcrafter:tmp wand.cooldown int 1 run scoreboard players get $cooldown spellcrafter.tmp


# Create storage with the cooldown in seconds format for the lore
function spellcrafter:as_table/close/cooldown_sec


# Update wand with data from storage
execute store result score $spell_count spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells
execute store result score $spell_cap spellcrafter.tmp run data get storage spellcrafter:tmp wand.cap
item modify entity @s contents spellcrafter:wand/update
item modify entity @s contents spellcrafter:wand/lore/stats


# Add spells to item lore
execute store result score $iter spellcrafter.tmp run data get storage spellcrafter:tmp lore
function spellcrafter:wand_generator/for_lore


# Wand modifier
item modify entity @s contents spellcrafter:wand/lore/wand_mod_add


# Reset scores
scoreboard players set $gen.tier spellcrafter.tmp 0
scoreboard players set $gen.type spellcrafter.tmp 0
