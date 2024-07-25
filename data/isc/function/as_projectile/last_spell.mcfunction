#> as projectile, on summon, at @s


execute if score $spell.summon_slime isc.tmp matches 1.. run function isc:spells/summon_slime/summon


# Return -1 to signal this chain ended because there were no more projectiles
return -1
