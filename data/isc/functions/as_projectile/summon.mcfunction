#> execute summon (marker) at the player's eye position (use_wand)
#> execute summon (marker) at the non-player caster's eye position (use_wand)
#> execute summon (marker) at the previous projectile in the chain when it hits something (next_spell)
#> execute summon (marker) at the position of the projectile with multicast
# score "$id isc.tmp" must have the caster's id
# storage "isc:tmp copy.rotation" must have the projectile rotation
# storage "isc:tmp wand.spells" must have the spell list


# Make this a projectile
tag @s add isc.projectile


# Set projectile stats to 0. These are changed by modifiers and projectile type
scoreboard players set @s isc.speed 0
scoreboard players set @s isc.range 0
scoreboard players set @s isc.damage 0


# Reset modifier counters
scoreboard players set $spell.clone isc.tmp 0
scoreboard players set $spell.multishot isc.tmp 0


# Blind: don't hit the caster for the first X ticks - $new_cast is 1 when this is the first projectile of a cast
execute if score $new_cast isc.tmp matches 1 run scoreboard players set @s isc.blind 15
execute unless score $new_cast isc.tmp matches 1 run scoreboard players set @s isc.blind 5


# Get stored rotation and id, defined before executing this
scoreboard players operation @s isc.id = $id isc.tmp
data modify entity @s Rotation set from storage isc:tmp copy.rotation


# Go through the spells until the next projectile, applying modifiers and casting all instant spells along the way
data remove storage isc:tmp wand.first
execute store result score $result isc.tmp run function isc:as_projectile/cast


# If $result is -1, the chain ends without a projectile - stop here
execute if score $result isc.tmp matches -1 run kill @s
execute if score $result isc.tmp matches -1 run return 0


# Make sure projectile stats aren't negative
execute unless score @s isc.range matches 0.. run scoreboard players set @s isc.range 0
execute unless score @s isc.speed matches 1.. run scoreboard players set @s isc.speed 1
execute unless score @s isc.damage matches 0.. run scoreboard players set @s isc.damage 0


# Age = range * 4 * modifier / 100 --> 4 steps = 1 block (projectiles move in steps of 0.25)
scoreboard players operation @s isc.age = @s isc.range
scoreboard players operation @s isc.age *= #4 isc.math
scoreboard players operation @s isc.age *= range_mod isc.options
scoreboard players operation @s isc.age /= #100 isc.math


# Save stored spells - if this is executed by multicast, don't save
execute unless score $spell.multicast isc.tmp matches 1 run data modify entity @s data.isc.spells set from storage isc:tmp wand.spells


# If this is executed by multicast, prevent stacking & apply a random rotation offset
execute if score $spell.multicast isc.tmp matches 1 run tag @s remove isc.spell.multicast
execute if score $spell.multicast isc.tmp matches 1 run function isc:spells/multicast/offset


# Apply modifiers that create new projectiles - THEIR ORDER IS IMPORTANT!
execute as @s[tag=isc.spell.multicast] at @s run function isc:spells/multicast/cast
execute if score $spell.multishot isc.tmp matches 1.. at @s run function isc:spells/multishot/cast
execute if score $spell.clone isc.tmp matches 1.. at @s run function isc:spells/clone/cast


# Apply other tagged modifiers
execute as @s[tag=isc.spell.random_dir] at @s run function isc:spells/random_dir/cast
