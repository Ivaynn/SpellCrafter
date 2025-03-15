#> execute summon (marker) at the player's eye position (use_wand)
#> execute summon (marker) at the non-player caster's eye position (use_wand)
#> execute summon (marker) at the previous projectile in the chain when it hits something (next_spell)
#> execute summon (marker) at the position of the projectile with multicast
# score "$id spellcrafter.tmp" must have the caster's id
# score "$clone_count spellcrafter.tmp" must have the caster's clone counter
# storage "spellcrafter:tmp rotation" must have the projectile rotation
# storage "spellcrafter:tmp wand.spells" must have the spell list


# Projectile cap
execute if score $projectile_count spellcrafter.tmp > projectile_cap spellcrafter.options run return run kill @s


# Make this a projectile
tag @s add spellcrafter.projectile


# Set projectile stats to 0. These are changed by modifiers and projectile type
scoreboard players set @s spellcrafter.speed 0
scoreboard players set @s spellcrafter.range 0
scoreboard players set @s spellcrafter.damage 0
scoreboard players set @s spellcrafter.weight 0
scoreboard players set @s spellcrafter.dist 0


# Reset modifier counters
scoreboard players set $spell.clone spellcrafter.tmp 0
scoreboard players set $spell.multishot spellcrafter.tmp 0
scoreboard players set $spell.remote_cast spellcrafter.tmp 0
scoreboard players set $spell.remote_up spellcrafter.tmp 0
scoreboard players set $spell.remote_down spellcrafter.tmp 0
scoreboard players set $spell.remote_back spellcrafter.tmp 0
scoreboard players set $spell.summon_slime spellcrafter.tmp 0


# Check if wand has modifiers
scoreboard players set $wand_mod spellcrafter.tmp 0
execute store result score $wand_mod spellcrafter.tmp run data get storage spellcrafter:tmp wand.mod


# Blind: don't hit the caster for the first X steps - $new_cast is 1 when this is the first projectile of a cast
execute if score $new_cast spellcrafter.tmp matches 1 run scoreboard players set @s spellcrafter.blind 10
execute unless score $new_cast spellcrafter.tmp matches 1 run scoreboard players set @s spellcrafter.blind 0


# Get stored rotation and id, defined before executing this
scoreboard players operation @s spellcrafter.id = $id spellcrafter.tmp
scoreboard players operation @s spellcrafter.clone = $clone_count spellcrafter.tmp
data modify entity @s Rotation set from storage spellcrafter:tmp rotation


# Wand modifiers
scoreboard players set $allowed_mod spellcrafter.tmp 0
execute store result score $allowed_mod spellcrafter.tmp run function spellcrafter:as_projectile/wand_mods
execute if score $allowed_mod spellcrafter.tmp matches 1 if score $wand_mod spellcrafter.tmp matches 1.. run data modify storage spellcrafter:tmp wand.spells prepend from storage spellcrafter:tmp wand.mod
execute if score $allowed_mod spellcrafter.tmp matches 0 run scoreboard players set $wand_mod spellcrafter.tmp 0


# Go through the spells until the next projectile, applying modifiers and casting all instant spells along the way
execute store result score $result spellcrafter.tmp run function spellcrafter:as_projectile/cast


# Special case: shuffle - this mod only applies once
execute if score $wand_mod spellcrafter.tmp matches 52 run scoreboard players set $wand_mod spellcrafter.tmp 0


# If $result is -1, the chain ends without a projectile - stop here
execute if score $result spellcrafter.tmp matches -1 run kill @s
execute if score $result spellcrafter.tmp matches -1 run return 0


# Make sure projectile stats aren't negative
execute unless score @s spellcrafter.range matches 0.. run scoreboard players set @s spellcrafter.range 0
execute unless score @s spellcrafter.speed matches 0.. run scoreboard players set @s spellcrafter.speed 0
execute unless score @s spellcrafter.damage matches 0.. run scoreboard players set @s spellcrafter.damage 0


# Age = range * 4 --> 4 steps = 1 block (projectiles move in steps of 0.25)
scoreboard players operation @s spellcrafter.age = @s spellcrafter.range
scoreboard players operation @s spellcrafter.age *= #4 spellcrafter.math


# Save stored spells - if this is executed by multicast, don't save
execute unless score $spell.multicast spellcrafter.tmp matches 1.. run data modify entity @s data.spellcrafter.spells set from storage spellcrafter:tmp wand.spells
execute unless score $spell.multicast spellcrafter.tmp matches 1.. if score $wand_mod spellcrafter.tmp matches 1.. run data modify entity @s data.spellcrafter.mod set from storage spellcrafter:tmp wand.mod


# Apply remote cast modifiers (first, so that they always use the original rotation)
execute if score $spell.remote_cast spellcrafter.tmp matches 1.. run function spellcrafter:spells/remote_cast/cast
execute if score $spell.remote_up spellcrafter.tmp matches 1.. run function spellcrafter:spells/remote_up/cast
execute if score $spell.remote_down spellcrafter.tmp matches 1.. run function spellcrafter:spells/remote_down/cast
execute if score $spell.remote_back spellcrafter.tmp matches 1.. run function spellcrafter:spells/remote_back/cast


# Apply modifiers that affect the initial rotation (they are mutually exclusive)
function spellcrafter:as_projectile/apply_me_modifiers


# Apply other tagged modifiers
execute as @s[tag=spellcrafter.spell.warp,tag=!spellcrafter.spell.casters_call] at @s run function spellcrafter:spells/warp/cast
execute as @s[tag=spellcrafter.spell.casters_call] at @s run function spellcrafter:spells/casters_call/cast
execute as @s[tag=spellcrafter.spell.trick_shot] at @s run function spellcrafter:spells/trick_shot/cast
execute as @s[tag=spellcrafter.spell.harmless] at @s run function spellcrafter:spells/harmless/cast
execute as @s[tag=spellcrafter.spell.safe_shot] at @s run function spellcrafter:spells/safe_shot/cast
execute as @s[tag=spellcrafter.spell.hidden] at @s run function spellcrafter:spells/hidden/cast


# Apply modifiers that create new projectiles
execute if score $spell.multishot spellcrafter.tmp matches 1.. at @s run function spellcrafter:spells/multishot/cast
execute if score $spell.clone spellcrafter.tmp matches 1.. at @s run function spellcrafter:spells/clone/cast


# Apply tagged modifiers that shouldn't affect copies (new projectiles)
execute as @s[tag=spellcrafter.spell.chaotic] run function spellcrafter:spells/chaotic/cast


# Multicast
execute if score $spell.multicast spellcrafter.tmp matches 1.. at @s run function spellcrafter:spells/multicast/cast
