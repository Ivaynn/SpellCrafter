#> as target (any entity)
# score "$id spellcrafter.tmp" must have the caster's id
# score "$damage spellcrafter.tmp" must have the damage to deal (up to 100)


# Check if this entity is untargetable
execute as @s[tag=spellcrafter.untargetable] run return 0


# Check if this entity is the caster
execute unless score damage_caster spellcrafter.options matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0
execute if score $spell.safe_shot spellcrafter.tmp matches 1 if score @s spellcrafter.id = $id spellcrafter.tmp run return 0


# Check if damage value is valid
execute unless score $damage spellcrafter.tmp matches 1.. run return 0


# Save damage source
scoreboard players operation @s spellcrafter.damage_src = $id spellcrafter.tmp


# Damage
scoreboard players operation @s spellcrafter.damage += $damage spellcrafter.tmp


# Schedule damage event
schedule function spellcrafter:damage/scheduled 1t replace


# Only return success if the entity is not in invulnerability frames
execute store result score $hurt_time spellcrafter.tmp run data get entity @s HurtTime
execute if score $hurt_time spellcrafter.tmp matches 1.. run return 0
return 1
