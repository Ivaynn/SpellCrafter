#> [tick] as summoned entity, at @s


execute as @s[tag=spellcrafter.spell.magic_barrier] run return run function spellcrafter:spells/magic_barrier/break
execute as @s[tag=spellcrafter.spell.magic_shield] run return run function spellcrafter:spells/magic_shield/timeout
execute as @s[tag=spellcrafter.spell.healing_circle] run return run function spellcrafter:spells/healing_circle/timeout
execute as @s[tag=spellcrafter.spell.anchor_explosion] run return run function spellcrafter:spells/anchor_explosion/timeout
execute as @s[tag=spellcrafter.spell.summon_crystal] run return run kill @s
execute as @s[tag=spellcrafter.spell.healing_crystal] run return run kill @s
execute as @s[tag=spellcrafter.spell.chaotic_crystal] run return run kill @s
execute as @s[tag=spellcrafter.spell.summon_arrow] run return run kill @s
execute as @s[tag=spellcrafter.spell.arrow_rain] run return run kill @s

function spellcrafter:as_summon/remove
