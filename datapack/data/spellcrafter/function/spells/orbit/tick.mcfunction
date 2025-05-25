#> [tick] as projectile, at @s


# Get rotation while facing the caster
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute store result score $spell.orbit spellcrafter.tmp positioned ~ ~-1 ~ facing entity @e[limit=1,distance=0.1..30,sort=nearest,type=#spellcrafter:caster,tag=spellcrafter.caster,predicate=spellcrafter:match_id,tag=!spellcrafter.spectator] feet rotated ~90 ~ run tp @s ~ ~ ~ ~ ~


# If no target was found, stop here
execute if score $spell.orbit spellcrafter.tmp matches 0 run return 0


# Negative speed
execute if score @s spellcrafter.speed matches ..-1 at @s run tp @s ~ ~ ~ facing ^ ^ ^-1


# Save rotation
execute store result score $target_r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $target_r1 spellcrafter.tmp run data get entity @s Rotation[1] 1


# Reset position & rotation to this function's context (at @s)
tp @s ~ ~ ~ ~ ~


# Update rotation
function spellcrafter:spells/homing/update_rot
