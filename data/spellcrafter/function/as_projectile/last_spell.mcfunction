#> as projectile, on summon, at @s


execute if score $spell.summon_slime spellcrafter.tmp matches 1.. run function spellcrafter:spells/summon_slime/summon


# Return -1 to signal this chain ended because there were no more projectiles
return -1
