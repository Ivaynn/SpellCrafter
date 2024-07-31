#> as projectile, on summon, at @s
# score "$spell isc.tmp" must contain the spell id

scoreboard players set $success isc.tmp 1

# Instant casts
execute if score $spell isc.tmp matches 4 run return run function isc:spells/explosion/cast
execute if score $spell isc.tmp matches 5 run return run function isc:spells/heal/cast
execute if score $spell isc.tmp matches 20 run return run function isc:spells/summon_lightning/cast
execute if score $spell isc.tmp matches 21 run return run function isc:spells/summon_vex/cast
execute if score $spell isc.tmp matches 22 run return run function isc:spells/teleport/cast
execute if score $spell isc.tmp matches 23 run return run function isc:spells/summon_bat/cast
execute if score $spell isc.tmp matches 24 run return run function isc:spells/summon_tnt/cast
execute if score $spell isc.tmp matches 25 run return run function isc:spells/counterspell/cast
execute if score $spell isc.tmp matches 27 run return run function isc:spells/double_teleport/cast
execute if score $spell isc.tmp matches 34 run return run function isc:spells/inverse_teleport/cast
execute if score $spell isc.tmp matches 35 run return run function isc:spells/summon_slime/cast
execute if score $spell isc.tmp matches 36 run return run function isc:spells/sheep/cast
execute if score $spell isc.tmp matches 37 run return run function isc:spells/summon_pufferfish/cast
execute if score $spell isc.tmp matches 38 run return run function isc:spells/firework_rocket/cast
execute if score $spell isc.tmp matches 49 run return run function isc:spells/shield/cast
execute if score $spell isc.tmp matches 56 run return run function isc:spells/summon_fangs/cast
execute if score $spell isc.tmp matches 71 run return run function isc:spells/cleanse/cast
execute if score $spell isc.tmp matches 72 run return run function isc:spells/angry_goat/cast
execute if score $spell isc.tmp matches 73 run return run function isc:spells/smoke_bomb/cast
execute if score $spell isc.tmp matches 74 run return run function isc:spells/flash/cast
execute if score $spell isc.tmp matches 75 run return run function isc:spells/flying_pig/cast
execute if score $spell isc.tmp matches 82 run return run function isc:spells/wind_charge/cast
execute if score $spell isc.tmp matches 85 run return run function isc:spells/diverge/cast
execute if score $spell isc.tmp matches 86 run return run function isc:spells/converge/cast
execute if score $spell isc.tmp matches 90 run return run function isc:spells/large_explosion/cast
execute if score $spell isc.tmp matches 97 run return run function isc:spells/forced_cast/cast


# Special
execute if score $spell isc.tmp matches 10 run return run scoreboard players add $spell.multicast isc.tmp 30
execute if score $spell isc.tmp matches 47 run return 1
execute if score $spell isc.tmp matches 48 run return 1
execute if score $spell isc.tmp matches 50 run return 1
execute if score $spell isc.tmp matches 52 run return run function isc:spells/shuffle/cast
execute if score $spell isc.tmp matches 64 run return 1
execute if score $spell isc.tmp matches 69 run return 1
execute if score $spell isc.tmp matches 70 run return 1
execute if score $spell isc.tmp matches 83 run return 1
execute if score $spell isc.tmp matches 84 run return 1
execute if score $spell isc.tmp matches 88 run return run scoreboard players add $spell.multicast isc.tmp 1
execute if score $spell isc.tmp matches 89 run return run scoreboard players add $spell.multicast isc.tmp 2
execute if score $spell isc.tmp matches 92 run return run function isc:spells/skip/cast
execute if score $spell isc.tmp matches 93 run return 1
execute if score $spell isc.tmp matches 95 run return run function isc:spells/reverse/cast
execute if score $spell isc.tmp matches 96 run return 1
execute if score $spell isc.tmp matches 112 run return run function isc:spells/transfer/cast


# Unstackable modifiers
execute if score $spell isc.tmp matches 8 run return run tag @s add isc.spell.guide
execute if score $spell isc.tmp matches 9 run return run tag @s add isc.spell.homing
execute if score $spell isc.tmp matches 12 run return run tag @s add isc.spell.random_dir
execute if score $spell isc.tmp matches 26 run return run tag @s add isc.spell.ghost
execute if score $spell isc.tmp matches 32 run return run tag @s add isc.spell.instant
execute if score $spell isc.tmp matches 33 run return run tag @s add isc.spell.piercing
execute if score $spell isc.tmp matches 40 run return run tag @s add isc.spell.harmless
execute if score $spell isc.tmp matches 41 run return run tag @s add isc.spell.hidden
execute if score $spell isc.tmp matches 42 run return run tag @s add isc.spell.rainbow
execute if score $spell isc.tmp matches 43 run return run tag @s add isc.spell.zigzag
execute if score $spell isc.tmp matches 44 run return run tag @s add isc.spell.chaotic
execute if score $spell isc.tmp matches 51 run return run tag @s add isc.spell.spiral
execute if score $spell isc.tmp matches 54 run return run tag @s add isc.spell.aim_assist
execute if score $spell isc.tmp matches 55 run return run tag @s add isc.spell.scaling
execute if score $spell isc.tmp matches 59 run return run tag @s add isc.spell.anchored
execute if score $spell isc.tmp matches 61 run return run tag @s add isc.spell.return
execute if score $spell isc.tmp matches 62 run return run tag @s add isc.spell.trick_shot
execute if score $spell isc.tmp matches 66 run return run tag @s add isc.spell.accelerate
execute if score $spell isc.tmp matches 67 run return run tag @s add isc.spell.wave
execute if score $spell isc.tmp matches 68 run return run tag @s add isc.spell.warp
execute if score $spell isc.tmp matches 76 run return run tag @s add isc.spell.follow
execute if score $spell isc.tmp matches 77 run return run tag @s add isc.spell.safe_shot
execute if score $spell isc.tmp matches 81 run return run tag @s add isc.spell.bouncy
execute if score $spell isc.tmp matches 87 run return run tag @s add isc.spell.orbit
execute if score $spell isc.tmp matches 103 run return run tag @s add isc.spell.aim_up
execute if score $spell isc.tmp matches 104 run return run tag @s add isc.spell.aim_down
execute if score $spell isc.tmp matches 108 run return run tag @s add isc.spell.casters_call
execute if score $spell isc.tmp matches 109 run return run tag @s add isc.spell.casters_pull
execute if score $spell isc.tmp matches 110 run return run tag @s add isc.spell.casters_aim


# Stackable modifiers
execute if score $spell isc.tmp matches 6 run return run function isc:spells/clone/add
execute if score $spell isc.tmp matches 7 run return run function isc:spells/empower/cast
execute if score $spell isc.tmp matches 11 run return run function isc:spells/multishot/add
execute if score $spell isc.tmp matches 13 run return run function isc:spells/range_dec/cast
execute if score $spell isc.tmp matches 14 run return run function isc:spells/range_inc/cast
execute if score $spell isc.tmp matches 15 run return run function isc:spells/speed_dec/cast
execute if score $spell isc.tmp matches 16 run return run function isc:spells/speed_inc/cast
execute if score $spell isc.tmp matches 17 run return run function isc:spells/heavy_shot/cast
execute if score $spell isc.tmp matches 18 run return run function isc:spells/long_shot/cast
execute if score $spell isc.tmp matches 19 run return run function isc:spells/quick_shot/cast
execute if score $spell isc.tmp matches 28 run return run function isc:spells/gravity/cast
execute if score $spell isc.tmp matches 29 run return run function isc:spells/anti_gravity/cast
execute if score $spell isc.tmp matches 45 run return run function isc:spells/remote_cast/add
execute if score $spell isc.tmp matches 105 run return run function isc:spells/remote_up/add
execute if score $spell isc.tmp matches 106 run return run function isc:spells/remote_down/add
execute if score $spell isc.tmp matches 107 run return run function isc:spells/remote_back/add


# If it reaches this point, spell not found
scoreboard players set $success isc.tmp 0
