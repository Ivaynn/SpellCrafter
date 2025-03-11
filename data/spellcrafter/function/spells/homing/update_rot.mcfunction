#> [tick] as projectile, at @s (homing)
#> [tick] as projectile, at @s (guide)
#> [tick] as projectile, at @s (follow)
#> [tick] as projectile, at @s (orbit)


# Get current rotation
execute store result score $r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $r1 spellcrafter.tmp run data get entity @s Rotation[1] 1


# Vertical rotation
scoreboard players operation $target_r1 spellcrafter.tmp -= $r1 spellcrafter.tmp

execute if score $target_r1 spellcrafter.tmp matches 11.. run scoreboard players set $target_r1 spellcrafter.tmp 10
execute if score $target_r1 spellcrafter.tmp matches ..-11 run scoreboard players set $target_r1 spellcrafter.tmp -10

scoreboard players operation $r1 spellcrafter.tmp += $target_r1 spellcrafter.tmp
execute store result entity @s Rotation[1] float 1 run scoreboard players get $r1 spellcrafter.tmp


# Horizontal rotation
scoreboard players operation $target_r0 spellcrafter.tmp -= $r0 spellcrafter.tmp

execute if score $target_r0 spellcrafter.tmp matches 11..179 run scoreboard players set $target_r0 spellcrafter.tmp 10
execute if score $target_r0 spellcrafter.tmp matches 180.. run scoreboard players set $target_r0 spellcrafter.tmp -10
execute if score $target_r0 spellcrafter.tmp matches -179..-11 run scoreboard players set $target_r0 spellcrafter.tmp -10
execute if score $target_r0 spellcrafter.tmp matches ..-180 run scoreboard players set $target_r0 spellcrafter.tmp 10

scoreboard players operation $r0 spellcrafter.tmp += $target_r0 spellcrafter.tmp
execute store result entity @s Rotation[0] float 1 run scoreboard players get $r0 spellcrafter.tmp
