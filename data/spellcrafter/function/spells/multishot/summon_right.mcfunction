#> execute summon (marker) at the position of the original projectile


# Get data from the original projectile
data modify entity @s Tags set from storage spellcrafter:tmp copy.tags
data modify entity @s Rotation set from storage spellcrafter:tmp copy.rotation

scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
scoreboard players operation @s spellcrafter.age = $age spellcrafter.tmp
scoreboard players operation @s spellcrafter.speed = $speed spellcrafter.tmp
scoreboard players operation @s spellcrafter.damage = $damage spellcrafter.tmp
scoreboard players operation @s spellcrafter.range = $range spellcrafter.tmp
scoreboard players operation @s spellcrafter.blind = $blind spellcrafter.tmp
scoreboard players operation @s spellcrafter.dist = $dist spellcrafter.tmp
scoreboard players operation @s spellcrafter.weight = $weight spellcrafter.tmp


# Re-apply certain modifiers
execute as @s[tag=spellcrafter.spell.chaotic] run function spellcrafter:spells/chaotic/cast
execute as @s[tag=spellcrafter.spell.random_dir] run return run function spellcrafter:spells/random_dir/cast
execute as @s[tag=spellcrafter.spell.casters_aim] run return run function spellcrafter:spells/casters_aim/cast
execute as @s[tag=spellcrafter.spell.casters_pull,tag=!spellcrafter.spell.casters_aim] run return run function spellcrafter:spells/casters_pull/cast
execute as @s[tag=spellcrafter.spell.aim_assist,tag=!spellcrafter.spell.casters_aim,tag=!spellcrafter.spell.casters_pull] run return run function spellcrafter:spells/aim_assist/cast
execute if score $spell.multicast spellcrafter.tmp matches 1 run return run function spellcrafter:spells/multicast/offset


# Rotation
scoreboard players set $r0_offset spellcrafter.tmp 25
scoreboard players operation $r0_offset spellcrafter.tmp *= $spell.multishot spellcrafter.tmp
scoreboard players operation $r0_offset spellcrafter.tmp += $r0 spellcrafter.tmp

execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0_offset spellcrafter.tmp
