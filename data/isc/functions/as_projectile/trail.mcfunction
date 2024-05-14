#> [tick] as projectile, at @s


# Special cases (does more than particles)
execute as @s[tag=isc.spell.revealing_bolt] run function isc:spells/revealing_bolt/trail


# Hidden skips all functions that are just particles
execute as @s[tag=isc.spell.hidden] run return 0


# Rainbow replaces particles
execute as @s[tag=isc.spell.rainbow] run return run function isc:spells/rainbow/trail


# Simple particle trails
execute as @s[tag=isc.spell.magic_missile] run function isc:spells/magic_missile/trail
execute as @s[tag=isc.spell.fireball] run function isc:spells/fireball/trail
execute as @s[tag=isc.spell.laser] run function isc:spells/laser/trail
execute as @s[tag=isc.spell.arcane_reaper] run function isc:spells/arcane_reaper/trail
execute as @s[tag=isc.spell.shulker_bullet] run function isc:spells/shulker_bullet/trail
