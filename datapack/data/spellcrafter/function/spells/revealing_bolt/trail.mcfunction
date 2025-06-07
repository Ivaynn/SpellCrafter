#> as projectile, at @s


# Glowing
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
effect give @e[distance=..5,type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,predicate=!spellcrafter:match_id] minecraft:glowing 5 0 false


# Effects
execute as @s[tag=spellcrafter.spell.hidden] run return 0
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail
particle minecraft:glow ~ ~ ~ 0 0 0 0 0 force @a[distance=..100]
