#> as target (any entity)
# score "$id isc.tmp" must have the caster's id
# score "$damage isc.tmp" must have the damage to deal (up to 100)


# Check if this entity is the caster
execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0


# Check if damage value is valid
execute unless score $damage isc.tmp matches 1.. run return 0
execute if score $damage isc.tmp matches 101.. run scoreboard players set $damage isc.tmp 100


# Damage
execute if score $damage isc.tmp matches 1..10 run function isc:damage/d10
execute if score $damage isc.tmp matches 11..20 run function isc:damage/d20
execute if score $damage isc.tmp matches 21..30 run function isc:damage/d30
execute if score $damage isc.tmp matches 31..40 run function isc:damage/d40
execute if score $damage isc.tmp matches 41..50 run function isc:damage/d50
execute if score $damage isc.tmp matches 51..60 run function isc:damage/d60
execute if score $damage isc.tmp matches 61..70 run function isc:damage/d70
execute if score $damage isc.tmp matches 71..80 run function isc:damage/d80
execute if score $damage isc.tmp matches 81..90 run function isc:damage/d90
execute if score $damage isc.tmp matches 91..100 run function isc:damage/d100
