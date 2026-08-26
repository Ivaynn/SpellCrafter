#> as player, at barrel (player id matches table id)


# Get data
data modify storage spellcrafter:tmp trigger.code set value {string: "", character: "", characters: ""}
scoreboard players set $has_string spellcrafter.tmp 0
execute store success score $has_string spellcrafter.tmp run data modify storage spellcrafter:tmp trigger.code.string set from entity @s SelectedItem.components."minecraft:writable_book_content".pages[0].raw
execute unless score $has_string spellcrafter.tmp matches 1 store success score $has_string spellcrafter.tmp run data modify storage spellcrafter:tmp trigger.code.string set from entity @s SelectedItem.components."minecraft:written_book_content".pages[0].raw
execute unless score $has_string spellcrafter.tmp matches 1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]


# Prepare wand object
data remove storage spellcrafter:tmp wand
data modify storage spellcrafter:tmp wand set value {valid:1b, version:0, spells:[], slots:[], owner:0, mod:0, cap:0, cooldown:0, mana:0, base_cooldown:0, base_mana:0, skin:0}


# Schema version: must be 1 for now - use this field to support future schema changes
data modify storage spellcrafter:tmp trigger.code.character set string storage spellcrafter:tmp trigger.code.string 0 1
function spellcrafter:as_table/open/book/read_one
execute unless score $value spellcrafter.tmp matches 1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]


# Ensure exactly 64 characters in the string
execute store result score $count spellcrafter.tmp run data get storage spellcrafter:tmp trigger.code.string
execute unless score $count spellcrafter.tmp matches 64 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]


# Deserialize wand object
data modify storage spellcrafter:tmp trigger.code.characters set string storage spellcrafter:tmp trigger.code.string 1 3
function spellcrafter:as_table/open/book/read_two
execute if score $value spellcrafter.tmp matches -1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]
execute store result storage spellcrafter:tmp wand.base_mana int 1 run scoreboard players get $value spellcrafter.tmp

data modify storage spellcrafter:tmp trigger.code.characters set string storage spellcrafter:tmp trigger.code.string 3 5
function spellcrafter:as_table/open/book/read_two
execute if score $value spellcrafter.tmp matches -1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]
execute store result storage spellcrafter:tmp wand.base_cooldown int 1 run scoreboard players get $value spellcrafter.tmp

data modify storage spellcrafter:tmp trigger.code.character set string storage spellcrafter:tmp trigger.code.string 5 6
function spellcrafter:as_table/open/book/read_one
execute if score $value spellcrafter.tmp matches -1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]
execute store result storage spellcrafter:tmp wand.cap int 1 run scoreboard players get $value spellcrafter.tmp

data modify storage spellcrafter:tmp trigger.code.characters set string storage spellcrafter:tmp trigger.code.string 6 8
function spellcrafter:as_table/open/book/read_two
execute if score $value spellcrafter.tmp matches -1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]
execute store result storage spellcrafter:tmp wand.skin int 1 run scoreboard players get $value spellcrafter.tmp

data modify storage spellcrafter:tmp trigger.code.characters set string storage spellcrafter:tmp trigger.code.string 8 10
function spellcrafter:as_table/open/book/read_two
execute if score $value spellcrafter.tmp matches -1 run return run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Wand import failed - invalid code!",color:"gray"}]
execute store result storage spellcrafter:tmp wand.mod int 1 run scoreboard players get $value spellcrafter.tmp

data modify storage spellcrafter:tmp trigger.code.characters set string storage spellcrafter:tmp trigger.code.string 10 64
scoreboard players set $slot spellcrafter.tmp 0
function spellcrafter:as_table/open/book/for_spell


# Put data on wand
loot replace entity @s weapon.mainhand loot spellcrafter:wand
item modify entity @s weapon.mainhand spellcrafter:wand/set_skin

function spellcrafter:as_table/close/empty

tellraw @s ["",{text:"> ",color:"#965ed6", bold:true},{text:"Wand imported successfully!",color:"gray"}]
scoreboard players set $success spellcrafter.tmp 1
