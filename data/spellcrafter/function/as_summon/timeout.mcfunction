#> [tick] as summoned entity, at @s


execute as @s[tag=spellcrafter.spell.magic_barrier] run return run function spellcrafter:spells/magic_barrier/break
execute as @s[tag=spellcrafter.spell.magic_shield] run return run function spellcrafter:spells/magic_shield/timeout
execute as @s[tag=spellcrafter.spell.summon_arrow] run return run kill @s
execute as @s[tag=spellcrafter.spell.arrow_rain] run return run kill @s

function spellcrafter:as_summon/remove
