# Executed by any entity - damage self by the amound in $damage isc.tmp


# Check if this entity is the caster
execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0
execute if score @s isc.id = $id isc.tmp if score $blind isc.tmp matches 1.. run return 0


# Check if damage value is valid
execute unless score $damage isc.tmp matches 1.. run return 0
execute if score $damage isc.tmp matches 51.. run scoreboard players set $damage isc.tmp 50


# Damage
execute if score $damage isc.tmp matches 1..10 run function isc:damage/d10
execute if score $damage isc.tmp matches 11..20 run function isc:damage/d20
execute if score $damage isc.tmp matches 21..30 run function isc:damage/d30
execute if score $damage isc.tmp matches 31..40 run function isc:damage/d40
execute if score $damage isc.tmp matches 41..50 run function isc:damage/d50
