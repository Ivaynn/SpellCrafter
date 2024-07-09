#> as target (any entity)
# score "$id isc.tmp" must have the caster's id
# score "$damage isc.tmp" must have the damage to deal (up to 100)


# Check if this entity is untargetable
execute as @s[tag=isc.untargetable] run return 0


# Check if this entity is the caster
execute unless score damage_caster isc.options matches 1 if score @s isc.id = $id isc.tmp run return 0
execute if score $spell.safe_shot isc.tmp matches 1 if score @s isc.id = $id isc.tmp run return 0


# Check if damage value is valid
execute unless score $damage isc.tmp matches 1.. run return 0


# Save damage source
scoreboard players operation @s isc.damage_src = $id isc.tmp


# Damage
scoreboard players operation @s isc.damage += $damage isc.tmp


# Schedule damage event
schedule function isc:damage/scheduled 1t replace
return 1
