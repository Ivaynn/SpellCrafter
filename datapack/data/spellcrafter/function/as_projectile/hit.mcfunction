#> as projectile, at @s
# tick, but only executes once because it ends with a kill command


# Hit targets
execute as @s[tag=spellcrafter.spell.magic_missile] run function spellcrafter:spells/magic_missile/hit
execute as @s[tag=spellcrafter.spell.fireball] run function spellcrafter:spells/fireball/hit
execute as @s[tag=spellcrafter.spell.revealing_bolt] run function spellcrafter:spells/revealing_bolt/hit
execute as @s[tag=spellcrafter.spell.arcane_reaper] run function spellcrafter:spells/arcane_reaper/hit
execute as @s[tag=spellcrafter.spell.shulker_bullet] run function spellcrafter:spells/shulker_bullet/hit
execute as @s[tag=spellcrafter.spell.poison_dart] run function spellcrafter:spells/poison_dart/hit
execute as @s[tag=spellcrafter.spell.freezing_bolt] run function spellcrafter:spells/freezing_bolt/hit
execute as @s[tag=spellcrafter.spell.drill] run function spellcrafter:spells/drill/hit
execute as @s[tag=spellcrafter.spell.boomerang] run function spellcrafter:spells/boomerang/hit
execute as @s[tag=spellcrafter.spell.kinetic_bolt] run function spellcrafter:spells/kinetic_bolt/hit
execute as @s[tag=spellcrafter.spell.wither_blast] run function spellcrafter:spells/wither_blast/hit
execute as @s[tag=spellcrafter.spell.big_drill] run function spellcrafter:spells/big_drill/hit
execute as @s[tag=spellcrafter.spell.vampiric_shot] run function spellcrafter:spells/vampiric_shot/hit
execute as @s[tag=spellcrafter.spell.drain_bolt] run function spellcrafter:spells/drain_bolt/hit
execute as @s[tag=spellcrafter.spell.mirror_shot] run function spellcrafter:spells/mirror_shot/hit
execute as @s[tag=spellcrafter.spell.healing_bolt] run function spellcrafter:spells/healing_bolt/hit
execute as @s[tag=spellcrafter.spell.soul_link] run function spellcrafter:spells/soul_link/hit
execute as @s[tag=spellcrafter.spell.resonant_pulse] run function spellcrafter:spells/resonant_pulse/hit


# Next spell...
execute if data entity @s data.spellcrafter.spells[0] run function spellcrafter:as_projectile/next_spell


# Remove self
kill @s[tag=spellcrafter.projectile]
