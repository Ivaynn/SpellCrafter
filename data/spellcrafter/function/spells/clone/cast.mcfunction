#> as projectile, on summon, at @s


# Check projectile cap
scoreboard players operation $projectile_count spellcrafter.tmp += $spell.clone spellcrafter.tmp
execute if score $projectile_count spellcrafter.tmp > projectile_cap spellcrafter.options run return 0


# Check clone cap
scoreboard players operation @s spellcrafter.clone += $spell.clone spellcrafter.tmp
execute if score @s spellcrafter.clone matches 11.. if score warnings spellcrafter.options matches 1 run tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Clone limit reached! ","color":"gray"},{"score":{"name":"@s","objective":"spellcrafter.clone"},"color":"gray"}]
execute if score @s spellcrafter.clone matches 11.. run return 0


# Multicast
execute if score $spell.multicast spellcrafter.tmp matches 1.. run data remove entity @s data.spellcrafter


# Get relevant data to create a copy
data remove storage spellcrafter:tmp copy
data modify storage spellcrafter:tmp copy.spellcrafter set from entity @s data.spellcrafter
data modify storage spellcrafter:tmp copy.tags set from entity @s Tags
data modify storage spellcrafter:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $age spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $speed spellcrafter.tmp = @s spellcrafter.speed
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $range spellcrafter.tmp = @s spellcrafter.range
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind
scoreboard players operation $clone_count spellcrafter.tmp = @s spellcrafter.clone
scoreboard players operation $dist spellcrafter.tmp = @s spellcrafter.dist
scoreboard players operation $weight spellcrafter.tmp = @s spellcrafter.weight


# Starting rotation offset
scoreboard players set $r0_offset spellcrafter.tmp 10
scoreboard players operation $r0_offset spellcrafter.tmp *= $spell.clone spellcrafter.tmp

execute store result score $r0 spellcrafter.tmp run data get storage spellcrafter:tmp copy.rotation[0] 1
scoreboard players operation $r0 spellcrafter.tmp -= $r0_offset spellcrafter.tmp
execute store result entity @s[tag=!spellcrafter.spell.arcane_reaper] Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp


# Summon the clones
execute at @s run function spellcrafter:spells/clone/for_clone
