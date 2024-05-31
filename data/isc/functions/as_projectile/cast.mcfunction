#> as projectile, on summon, at @s
#> recursive function (limited by length of storage "isc:tmp wand.spells")
# storage "isc:tmp wand.spells" must have the spell list


# If there are no more spells, the chain ends without a projectile --> return -1
execute unless data storage isc:tmp wand.spells[0] run return -1


# Put the next spell of the chain in storage "isc:tmp wand.first"
scoreboard players set $spell isc.tmp 0
execute store result score $spell isc.tmp run data get storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.spells[0]
scoreboard players set $success isc.tmp 0


# Random spells
execute if score $spell isc.tmp matches 50 run function isc:spells/random_spell/cast


# Projectiles (return)
execute if score $spell isc.tmp matches 1 run return run function isc:spells/magic_missile/projectile
execute if score $spell isc.tmp matches 2 run return run function isc:spells/fireball/projectile
execute if score $spell isc.tmp matches 3 run return run function isc:spells/laser/projectile
execute if score $spell isc.tmp matches 30 run return run function isc:spells/revealing_bolt/projectile
execute if score $spell isc.tmp matches 31 run return run function isc:spells/arcane_reaper/projectile
execute if score $spell isc.tmp matches 39 run return run function isc:spells/shulker_bullet/projectile
execute if score $spell isc.tmp matches 46 run return run function isc:spells/null_shot/projectile
execute if score $spell isc.tmp matches 53 run return run function isc:spells/poison_dart/projectile
execute if score $spell isc.tmp matches 57 run return run function isc:spells/freezing_bolt/projectile
execute if score $spell isc.tmp matches 58 run return run function isc:spells/drill/projectile
execute if score $spell isc.tmp matches 60 run return run function isc:spells/black_hole/projectile
execute if score $spell isc.tmp matches 63 run return run function isc:spells/boomerang/projectile
execute if score $spell isc.tmp matches 65 run return run function isc:spells/kinetic_bolt/projectile
execute if score $spell isc.tmp matches 78 run return run function isc:spells/arcane_shield/projectile
execute if score $spell isc.tmp matches 79 run return run function isc:spells/healing_circle/projectile


# Non-projectiles (no return)
function isc:as_projectile/cast_np


# Next spell
execute if score $success isc.tmp matches 0 if score warnings isc.options matches 1 run tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Invalid spell id from caster #","color":"gray"},{"score":{"name":"$id","objective":"isc.tmp"},"color":"gray"}]
execute if score $success isc.tmp matches 1 run return run function isc:as_projectile/cast
