#> [tick] as projectile, at @s


# Return if speed is 0
execute if score @s spellcrafter.speed matches 0 run return 0


# Get caster's rotation
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute store result score $spell.guide spellcrafter.tmp run data modify entity @s Rotation set from entity @e[limit=1,type=#spellcrafter:caster,tag=spellcrafter.caster,tag=!spellcrafter.spectator,predicate=spellcrafter:match_id] Rotation 
execute if score $spell.guide spellcrafter.tmp matches 0 run return 0


# Negative speed
execute if score @s spellcrafter.speed matches ..-1 at @s run tp @s ~ ~ ~ facing ^ ^ ^-1


# Save rotation
execute store result score $target_r0 spellcrafter.tmp run data get entity @s Rotation[0] 1
execute store result score $target_r1 spellcrafter.tmp run data get entity @s Rotation[1] 1


# Reset position & rotation to this function's context (at @s)
tp @s ~ ~ ~ ~ ~


# Update rotation
function spellcrafter:spells/homing/update_rot
