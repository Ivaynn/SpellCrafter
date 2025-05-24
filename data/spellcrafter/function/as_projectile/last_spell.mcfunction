#> as projectile, on summon, at @s


execute if score $spell.resonant_pulse spellcrafter.tmp matches 1.. run return run function spellcrafter:spells/resonant_pulse/projectile


execute if score $spell.summon_slime spellcrafter.tmp matches 1.. run function spellcrafter:spells/summon_slime/summon
execute if score $spell.summon_magma spellcrafter.tmp matches 1.. run function spellcrafter:spells/summon_magma/summon
execute if score $spell.summon_crystal spellcrafter.tmp matches 1.. run function spellcrafter:spells/summon_crystal/summon


# Return -1 to signal this chain ended because there were no more projectiles
return -1
