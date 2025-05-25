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

function spellcrafter:as_projectile/apply_me_modifiers
execute if score $spell.has_initial_rot spellcrafter.tmp matches 0 run return 0


# If it has multicast, the offset should be from that and not multishot
execute if score $spell.multicast spellcrafter.tmp matches 1 run return run function spellcrafter:spells/multicast/offset


# Rotation
scoreboard players operation $r0_offset spellcrafter.tmp *= $spell.multishot spellcrafter.tmp
scoreboard players operation $r0_offset spellcrafter.tmp += $r0 spellcrafter.tmp

execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0_offset spellcrafter.tmp
