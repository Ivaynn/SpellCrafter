#> as target (caster)
# projectile hit

scoreboard players set $success isc.tmp 1

scoreboard players operation $mana_stolen isc.tmp = @s isc.mana
scoreboard players operation $mana_stolen isc.tmp /= #4 isc.math
scoreboard players operation @s isc.mana -= $mana_stolen isc.tmp

execute as @e[limit=1,type=#isc:caster,tag=isc.caster,predicate=isc:match_id,tag=!isc.spectator] run function isc:spells/drain_bolt/as_caster
