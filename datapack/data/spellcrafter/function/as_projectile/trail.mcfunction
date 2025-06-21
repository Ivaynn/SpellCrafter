#> [tick] as projectile, at @s


# Collide with shields
scoreboard players set $hit_shield spellcrafter.tmp 0
execute as @e[distance=0.001..3, type=minecraft:item_display, tag=spellcrafter.spell.arcane_shield, predicate=!spellcrafter:match_id] run function spellcrafter:spells/arcane_shield/hit
execute as @e[distance=0.001..1.1, type=minecraft:item_display, tag=spellcrafter.spell.magic_barrier] run function spellcrafter:spells/magic_barrier/hit
execute as @e[distance=0.001..0.9, type=minecraft:item_display, tag=spellcrafter.spell.magic_shield] run function spellcrafter:spells/magic_shield/hit
execute if score $hit_shield spellcrafter.tmp matches 1 run return run function spellcrafter:as_projectile/remove


# Trajectory modifiers
execute as @s[tag=!spellcrafter.spell.anchored,tag=spellcrafter.spell.zigzag] run function spellcrafter:spells/zigzag/trail
execute as @s[tag=!spellcrafter.spell.anchored,tag=spellcrafter.spell.chaotic] run function spellcrafter:spells/chaotic/trail
execute as @s[tag=!spellcrafter.spell.anchored,tag=spellcrafter.spell.spiral] run function spellcrafter:spells/spiral/trail
execute as @s[tag=!spellcrafter.spell.anchored,tag=spellcrafter.spell.wave] run function spellcrafter:spells/wave/trail


# Special cases (does more than particles)
execute as @s[tag=spellcrafter.spell.revealing_bolt] run return run function spellcrafter:spells/revealing_bolt/trail
execute as @s[tag=spellcrafter.spell.freezing_bolt] run return run function spellcrafter:spells/freezing_bolt/trail
execute as @s[tag=spellcrafter.spell.drill] run return run function spellcrafter:spells/drill/trail
execute as @s[tag=spellcrafter.spell.wither_blast] run return run function spellcrafter:spells/wither_blast/trail
execute as @s[tag=spellcrafter.spell.big_drill] run return run function spellcrafter:spells/big_drill/trail


# Hidden skips all functions that are just particles
execute as @s[tag=spellcrafter.spell.hidden] run return 0


# Rainbow replaces particles
execute as @s[tag=spellcrafter.spell.rainbow] run return run function spellcrafter:spells/rainbow/trail


# Simple particle trails
execute as @s[tag=spellcrafter.spell.magic_missile] run function spellcrafter:spells/magic_missile/trail
execute as @s[tag=spellcrafter.spell.fireball] run function spellcrafter:spells/fireball/trail
execute as @s[tag=spellcrafter.spell.laser] run function spellcrafter:spells/laser/trail
execute as @s[tag=spellcrafter.spell.crystal_laser] run function spellcrafter:spells/crystal_laser/trail
execute as @s[tag=spellcrafter.spell.arcane_reaper] run function spellcrafter:spells/arcane_reaper/trail
execute as @s[tag=spellcrafter.spell.shulker_bullet] run function spellcrafter:spells/shulker_bullet/trail
execute as @s[tag=spellcrafter.spell.poison_dart] run function spellcrafter:spells/poison_dart/trail
execute as @s[tag=spellcrafter.spell.boomerang] run function spellcrafter:spells/boomerang/trail
execute as @s[tag=spellcrafter.spell.kinetic_bolt] run function spellcrafter:spells/kinetic_bolt/trail
execute as @s[tag=spellcrafter.spell.vampiric_shot] run function spellcrafter:spells/vampiric_shot/trail
execute as @s[tag=spellcrafter.spell.drain_bolt] run function spellcrafter:spells/drain_bolt/trail
execute as @s[tag=spellcrafter.spell.healing_bolt] run function spellcrafter:spells/healing_bolt/trail
execute as @s[tag=spellcrafter.spell.soul_link] run function spellcrafter:spells/soul_link/trail
execute as @s[tag=spellcrafter.spell.delayed_cast] run function spellcrafter:spells/delayed_cast/trail
execute as @s[tag=spellcrafter.spell.resonant_pulse] run function spellcrafter:spells/resonant_pulse/trail
execute as @s[tag=spellcrafter.spell.bouncy_laser] run function spellcrafter:spells/bouncy_laser/trail
execute as @s[tag=spellcrafter.spell.lightning_bolt] run function spellcrafter:spells/lightning_bolt/trail
