#> as projectile, on summon, at @s


# Check projectile cap
scoreboard players operation $projectile_count spellcrafter.tmp += $spell.multishot spellcrafter.tmp
scoreboard players operation $projectile_count spellcrafter.tmp += $spell.multishot spellcrafter.tmp
execute if score $projectile_count spellcrafter.tmp > projectile_cap spellcrafter.options run return 0


# Multicast
execute if score $spell.multicast spellcrafter.tmp matches 1.. run data remove entity @s data.spellcrafter


# Get relevant data to create a copy
data remove storage spellcrafter:tmp copy
data modify storage spellcrafter:tmp copy.tags set from entity @s Tags
data modify storage spellcrafter:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $age spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $speed spellcrafter.tmp = @s spellcrafter.speed
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $range spellcrafter.tmp = @s spellcrafter.range
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind
scoreboard players operation $dist spellcrafter.tmp = @s spellcrafter.dist
scoreboard players operation $weight spellcrafter.tmp = @s spellcrafter.weight


# Nerf: copies deal reduces damage
scoreboard players operation $damage spellcrafter.tmp /= #2 spellcrafter.math


# Summon copies
execute store result score $r0 spellcrafter.tmp run data get storage spellcrafter:tmp copy.rotation[0] 1
function spellcrafter:spells/multishot/for_copy
