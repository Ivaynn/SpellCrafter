#> [tick] as summoned entity, at @s


execute as @s[tag=spellcrafter.spell.magic_barrier] run return run function spellcrafter:spells/magic_barrier/break
execute as @s[tag=spellcrafter.spell.magic_shield] run return run function spellcrafter:spells/magic_shield/timeout
execute as @s[type=minecraft:sheep] run function spellcrafter:spells/sheep/explode

function spellcrafter:as_summon/remove
