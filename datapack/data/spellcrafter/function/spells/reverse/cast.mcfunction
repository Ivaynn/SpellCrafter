#> as projectile, on summon, at @s
# instant cast


# Inverts the order of the storage "spellcrafter:tmp wand.spells"

data modify storage spellcrafter:tmp tmp set value []
execute store result score $iter spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells

execute if score $iter spellcrafter.tmp matches 1.. run function spellcrafter:spells/reverse/for_spell
data modify storage spellcrafter:tmp wand.spells set from storage spellcrafter:tmp tmp
