#> as player - /trigger isc.toggle


# Check if player is caster
scoreboard players set $is_caster isc.tmp 0
execute as @s[tag=isc.caster] run scoreboard players set $is_caster isc.tmp 1

# Toggle
execute if score @s isc.toggle matches 1 if score $is_caster isc.tmp matches 1 run tag @s remove isc.caster
execute if score @s isc.toggle matches 1 if score $is_caster isc.tmp matches 0 run tag @s add isc.caster

# Chat message
tellraw @s[tag=isc.caster] ["",{"text":"<SpellCrafter> ","color":"dark_aqua"},{"text":"Spell casting enabled","color":"gray"}]
tellraw @s[tag=!isc.caster] ["",{"text":"<SpellCrafter> ","color":"dark_aqua"},{"text":"Spell casting disabled","color":"gray"}]

# Reset trigger
scoreboard players set @s isc.toggle 0
