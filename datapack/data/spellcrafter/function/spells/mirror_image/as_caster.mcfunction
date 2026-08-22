#> as caster, at projectile, on summon


effect give @s[distance=..7.5] minecraft:invisibility 3 0 true


# Non-player casters are not supported
execute as @s[type=!minecraft:player] run return fail


# Delete previous mirror
execute as @e[distance=..100,type=minecraft:mannequin,predicate=spellcrafter:match_id,tag=spellcrafter.summon,tag=spellcrafter.spell.mirror_image] run function spellcrafter:as_summon/remove


# Summon
summon minecraft:mannequin ~ ~ ~ {Tags:["spellcrafter.tmp"]}
execute at @s as @e[limit=1,type=minecraft:mannequin,tag=spellcrafter.tmp] run function spellcrafter:spells/mirror_image/as_clone
