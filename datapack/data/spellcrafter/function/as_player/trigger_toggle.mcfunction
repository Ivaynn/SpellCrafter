#> as player - /trigger spellcrafter.toggle


# Check if player is caster
scoreboard players set $is_caster spellcrafter.tmp 0
execute as @s[tag=spellcrafter.caster] run scoreboard players set $is_caster spellcrafter.tmp 1

# Toggle
execute if score @s spellcrafter.toggle matches 1 if score $is_caster spellcrafter.tmp matches 1 run tag @s remove spellcrafter.caster
execute if score @s spellcrafter.toggle matches 1 if score $is_caster spellcrafter.tmp matches 0 run tag @s add spellcrafter.caster

# Chat message
tellraw @s[tag=spellcrafter.caster] ["",{text:"> ",color:"dark_aqua",bold:true},{text:"Spell casting enabled",color:"gray"}]
tellraw @s[tag=!spellcrafter.caster] ["",{text:"> ",color:"red",bold:true},{text:"Spell casting disabled",color:"gray"}]

# Reset trigger
scoreboard players set @s spellcrafter.toggle 0
