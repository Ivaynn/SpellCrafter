#> [tick] as projectile, at @s


# Trajectory modifiers
execute as @s[tag=!isc.spell.anchored,tag=isc.spell.zigzag] run function isc:spells/zigzag/trail
execute as @s[tag=!isc.spell.anchored,tag=isc.spell.chaotic] run function isc:spells/chaotic/trail
execute as @s[tag=!isc.spell.anchored,tag=isc.spell.spiral] run function isc:spells/spiral/trail
execute as @s[tag=!isc.spell.anchored,tag=isc.spell.wave] run function isc:spells/wave/trail


# Special cases (does more than particles)
execute as @s[tag=isc.spell.revealing_bolt] run return run function isc:spells/revealing_bolt/trail
execute as @s[tag=isc.spell.freezing_bolt] run return run function isc:spells/freezing_bolt/trail
execute as @s[tag=isc.spell.drill] run return run function isc:spells/drill/trail
execute as @s[tag=isc.spell.black_hole] run return run function isc:spells/black_hole/trail


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
execute as @s[tag=isc.spell.poison_dart] run function isc:spells/poison_dart/trail
execute as @s[tag=isc.spell.boomerang] run function isc:spells/boomerang/trail
execute as @s[tag=isc.spell.kinetic_bolt] run function isc:spells/kinetic_bolt/trail
