#> as projectile, at target, facing @s


# Raycast to check if the tp is valid
scoreboard players set $iter spellcrafter.tmp 100
scoreboard players set $tmp.target_found spellcrafter.tmp 0
function spellcrafter:spells/warp/raycast


# Fail: cancel tp
execute unless score $tmp.target_found spellcrafter.tmp matches 1 run return 0


# Effects at original location
execute at @s run particle minecraft:reverse_portal ~ ~ ~ 0 0 0 0.5 5 force @a[distance=..100]


# Tp to this location (caster)
tp @s ~ ~ ~


# Effects at the destination (here)
particle minecraft:reverse_portal ~ ~ ~ 0 0 0 .2 5 force @a[distance=..100]
playsound minecraft:entity.enderman.teleport player @a[distance=..100] ~ ~ ~ 1 1.8
