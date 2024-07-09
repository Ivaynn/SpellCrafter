#> execute summon (marker) at the player's eye position (use_wand)
#> execute summon (marker) at the non-player caster's eye position (use_wand)
#> execute summon (marker) at the previous projectile in the chain when it hits something (next_spell)
#> execute summon (marker) at the position of the projectile with multicast
# score "$id isc.tmp" must have the caster's id
# score "$clone_count isc.tmp" must have the caster's clone counter
# storage "isc:tmp rotation" must have the projectile rotation
# storage "isc:tmp wand.spells" must have the spell list


# Projectile cap
execute if score $projectile_count isc.tmp > projectile_cap isc.options run return run kill @s


# Make this a projectile
tag @s add isc.projectile


# Set projectile stats to 0. These are changed by modifiers and projectile type
scoreboard players set @s isc.speed 0
scoreboard players set @s isc.range 0
scoreboard players set @s isc.damage 0
scoreboard players set @s isc.weight 0
scoreboard players set @s isc.dist 0


# Reset modifier counters
scoreboard players set $spell.clone isc.tmp 0
scoreboard players set $spell.multishot isc.tmp 0
scoreboard players set $spell.remote_cast isc.tmp 0


# Check if wand has modifiers
scoreboard players set $wand_mod isc.tmp 0
execute store result score $wand_mod isc.tmp run data get storage isc:tmp wand.mod


# Blind: don't hit the caster for the first X steps - $new_cast is 1 when this is the first projectile of a cast
execute if score $new_cast isc.tmp matches 1 run scoreboard players set @s isc.blind 10
execute unless score $new_cast isc.tmp matches 1 run scoreboard players set @s isc.blind 0


# Get stored rotation and id, defined before executing this
scoreboard players operation @s isc.id = $id isc.tmp
scoreboard players operation @s isc.clone = $clone_count isc.tmp
data modify entity @s Rotation set from storage isc:tmp rotation


# Go through the spells until the next projectile, applying modifiers and casting all instant spells along the way (prepend apply wand modifiers)
execute if score $wand_mod isc.tmp matches 1.. run data modify storage isc:tmp wand.spells prepend from storage isc:tmp wand.mod
execute store result score $result isc.tmp run function isc:as_projectile/cast


# Special case: shuffle - this mod only applies once
execute if score $wand_mod isc.tmp matches 52 run scoreboard players set $wand_mod isc.tmp 0


# If $result is -1, the chain ends without a projectile - stop here
execute if score $result isc.tmp matches -1 run kill @s
execute if score $result isc.tmp matches -1 run return 0


# Make sure projectile stats aren't negative
execute unless score @s isc.range matches 0.. run scoreboard players set @s isc.range 0
execute unless score @s isc.speed matches 0.. run scoreboard players set @s isc.speed 0
execute unless score @s isc.damage matches 0.. run scoreboard players set @s isc.damage 0


# Age = range * 4 --> 4 steps = 1 block (projectiles move in steps of 0.25)
scoreboard players operation @s isc.age = @s isc.range
scoreboard players operation @s isc.age *= #4 isc.math


# Save stored spells - if this is executed by multicast, don't save
execute unless score $spell.multicast isc.tmp matches 1.. run data modify entity @s data.isc.spells set from storage isc:tmp wand.spells
execute unless score $spell.multicast isc.tmp matches 1.. if score $wand_mod isc.tmp matches 1.. run data modify entity @s data.isc.mod set from storage isc:tmp wand.mod


# Apply tagged modifiers (before creating new projectiles)
execute as @s[tag=isc.spell.random_dir] at @s run function isc:spells/random_dir/cast
execute as @s[tag=isc.spell.harmless] at @s run function isc:spells/harmless/cast
execute as @s[tag=!isc.spell.random_dir,tag=isc.spell.aim_assist] at @s run function isc:spells/aim_assist/cast
execute as @s[tag=isc.spell.warp] at @s run function isc:spells/warp/cast
execute as @s[tag=isc.spell.trick_shot] at @s run function isc:spells/trick_shot/cast
execute as @s[tag=isc.spell.safe_shot] at @s run function isc:spells/safe_shot/cast
execute as @s[tag=isc.spell.hidden] at @s run function isc:spells/hidden/cast


# Apply modifiers that create new projectiles
execute if score $spell.multishot isc.tmp matches 1.. at @s run function isc:spells/multishot/cast
execute if score $spell.clone isc.tmp matches 1.. at @s run function isc:spells/clone/cast
execute if score $spell.remote_cast isc.tmp matches 1.. run function isc:spells/remote_cast/cast


# Apply tagged modifiers (after creating new projectiles)
execute as @s[tag=isc.spell.chaotic] run function isc:spells/chaotic/cast


# Multicast
execute if score $spell.multicast isc.tmp matches 1.. at @s run function isc:spells/multicast/cast
