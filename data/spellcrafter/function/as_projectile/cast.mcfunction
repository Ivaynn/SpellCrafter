#> as projectile, on summon, at @s
#> recursive function (limited by length of storage "spellcrafter:tmp wand.spells")
# storage "spellcrafter:tmp wand.spells" must have the spell list


# If there are no more spells, the chain ends without a projectile
execute unless data storage spellcrafter:tmp wand.spells[0] run return run function spellcrafter:as_projectile/last_spell


# Put the next spell of the chain in score "$spell spellcrafter.tmp"
scoreboard players set $spell spellcrafter.tmp 0
execute store result score $spell spellcrafter.tmp run data get storage spellcrafter:tmp wand.spells[0]
data remove storage spellcrafter:tmp wand.spells[0]


# Spells that have consecutive copies stack: they trigger after the last copy
execute if score $spell.summon_slime spellcrafter.tmp matches 1.. unless score $spell spellcrafter.tmp matches 35 run function spellcrafter:spells/summon_slime/summon


# Spells that turn into other spells (echo)
execute if score $spell spellcrafter.tmp matches 50 run function spellcrafter:spells/echo/cast
execute if score $spell spellcrafter.tmp matches 96 run function spellcrafter:spells/chaotic_echo/cast
execute if score $spell spellcrafter.tmp matches 93 run function spellcrafter:spells/final_echo/cast
execute unless score $spell spellcrafter.tmp matches 1.. run return -1


# Projectiles (return)
execute if score $spell spellcrafter.tmp matches 1 run return run function spellcrafter:spells/magic_missile/projectile
execute if score $spell spellcrafter.tmp matches 2 run return run function spellcrafter:spells/fireball/projectile
execute if score $spell spellcrafter.tmp matches 3 run return run function spellcrafter:spells/laser/projectile
execute if score $spell spellcrafter.tmp matches 30 run return run function spellcrafter:spells/revealing_bolt/projectile
execute if score $spell spellcrafter.tmp matches 31 run return run function spellcrafter:spells/arcane_reaper/projectile
execute if score $spell spellcrafter.tmp matches 39 run return run function spellcrafter:spells/shulker_bullet/projectile
execute if score $spell spellcrafter.tmp matches 46 run return run function spellcrafter:spells/null_shot/projectile
execute if score $spell spellcrafter.tmp matches 53 run return run function spellcrafter:spells/poison_dart/projectile
execute if score $spell spellcrafter.tmp matches 57 run return run function spellcrafter:spells/freezing_bolt/projectile
execute if score $spell spellcrafter.tmp matches 58 run return run function spellcrafter:spells/drill/projectile
execute if score $spell spellcrafter.tmp matches 60 run return run function spellcrafter:spells/black_hole/projectile
execute if score $spell spellcrafter.tmp matches 63 run return run function spellcrafter:spells/boomerang/projectile
execute if score $spell spellcrafter.tmp matches 65 run return run function spellcrafter:spells/kinetic_bolt/projectile
execute if score $spell spellcrafter.tmp matches 78 run return run function spellcrafter:spells/arcane_shield/projectile
execute if score $spell spellcrafter.tmp matches 79 run return run function spellcrafter:spells/healing_circle/projectile
execute if score $spell spellcrafter.tmp matches 80 run return run function spellcrafter:spells/toxic_cloud/projectile
execute if score $spell spellcrafter.tmp matches 91 run return run function spellcrafter:spells/wither_blast/projectile
execute if score $spell spellcrafter.tmp matches 94 run return run function spellcrafter:spells/big_drill/projectile
execute if score $spell spellcrafter.tmp matches 98 run return run function spellcrafter:spells/vampiric_shot/projectile
execute if score $spell spellcrafter.tmp matches 99 run return run function spellcrafter:spells/drain_bolt/projectile
execute if score $spell spellcrafter.tmp matches 100 run return run function spellcrafter:spells/mirror_shot/projectile
execute if score $spell spellcrafter.tmp matches 101 run return run function spellcrafter:spells/healing_bolt/projectile
execute if score $spell spellcrafter.tmp matches 102 run return run function spellcrafter:spells/soul_link/projectile
execute if score $spell spellcrafter.tmp matches 111 run return run function spellcrafter:spells/delayed_cast/projectile


# Non-projectiles (no return)
scoreboard players set $success spellcrafter.tmp 0
function spellcrafter:as_projectile/cast_np


# Next spell
execute if score $success spellcrafter.tmp matches 0 if score warnings spellcrafter.options matches 1 run tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Invalid spell id from caster #","color":"gray"},{"score":{"name":"$id","objective":"spellcrafter.tmp"},"color":"gray"}]
execute if score $success spellcrafter.tmp matches 1 run return run function spellcrafter:as_projectile/cast
