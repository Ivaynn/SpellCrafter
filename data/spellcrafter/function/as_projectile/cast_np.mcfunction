#> as projectile, on summon, at @s
# score "$spell spellcrafter.tmp" must contain the spell id

scoreboard players set $success spellcrafter.tmp 1

# Stackable projectiles
execute if score $spell spellcrafter.tmp matches 60 run return run function spellcrafter:spells/resonant_pulse/add


# Instant casts
execute if score $spell spellcrafter.tmp matches 4 run return run function spellcrafter:spells/explosion/cast
execute if score $spell spellcrafter.tmp matches 5 run return run function spellcrafter:spells/heal/cast
execute if score $spell spellcrafter.tmp matches 20 run return run function spellcrafter:spells/summon_lightning/cast
execute if score $spell spellcrafter.tmp matches 21 run return run function spellcrafter:spells/summon_vex/cast
execute if score $spell spellcrafter.tmp matches 22 run return run function spellcrafter:spells/teleport/cast
execute if score $spell spellcrafter.tmp matches 23 run return run function spellcrafter:spells/summon_bat/cast
execute if score $spell spellcrafter.tmp matches 24 run return run function spellcrafter:spells/summon_crystal/cast
execute if score $spell spellcrafter.tmp matches 25 run return run function spellcrafter:spells/counterspell/cast
execute if score $spell spellcrafter.tmp matches 27 run return run function spellcrafter:spells/double_teleport/cast
execute if score $spell spellcrafter.tmp matches 34 run return run function spellcrafter:spells/inverse_teleport/cast
execute if score $spell spellcrafter.tmp matches 35 run return run function spellcrafter:spells/summon_slime/cast
execute if score $spell spellcrafter.tmp matches 36 run return run function spellcrafter:spells/summon_endermite/cast
execute if score $spell spellcrafter.tmp matches 37 run return run function spellcrafter:spells/summon_arrow/cast
execute if score $spell spellcrafter.tmp matches 38 run return run function spellcrafter:spells/firework_rocket/cast
execute if score $spell spellcrafter.tmp matches 49 run return run function spellcrafter:spells/shield/cast
execute if score $spell spellcrafter.tmp matches 56 run return run function spellcrafter:spells/summon_fangs/cast
execute if score $spell spellcrafter.tmp matches 71 run return run function spellcrafter:spells/cleanse/cast
execute if score $spell spellcrafter.tmp matches 72 run return run function spellcrafter:spells/angry_goat/cast
execute if score $spell spellcrafter.tmp matches 73 run return run function spellcrafter:spells/smoke_bomb/cast
execute if score $spell spellcrafter.tmp matches 74 run return run function spellcrafter:spells/flash/cast
execute if score $spell spellcrafter.tmp matches 75 run return run function spellcrafter:spells/summon_magma/cast
execute if score $spell spellcrafter.tmp matches 82 run return run function spellcrafter:spells/wind_charge/cast
execute if score $spell spellcrafter.tmp matches 85 run return run function spellcrafter:spells/diverge/cast
execute if score $spell spellcrafter.tmp matches 86 run return run function spellcrafter:spells/converge/cast
execute if score $spell spellcrafter.tmp matches 90 run return run function spellcrafter:spells/large_explosion/cast
execute if score $spell spellcrafter.tmp matches 97 run return run function spellcrafter:spells/forced_cast/cast
execute if score $spell spellcrafter.tmp matches 115 run return run function spellcrafter:spells/magic_barrier/cast
execute if score $spell spellcrafter.tmp matches 116 run return run function spellcrafter:spells/magic_shield/cast
execute if score $spell spellcrafter.tmp matches 117 run return run function spellcrafter:spells/arrow_rain/cast
execute if score $spell spellcrafter.tmp matches 118 run return run function spellcrafter:spells/healing_circle/cast
execute if score $spell spellcrafter.tmp matches 119 run return run function spellcrafter:spells/healing_crystal/cast
execute if score $spell spellcrafter.tmp matches 120 run return run function spellcrafter:spells/chaotic_crystal/cast


# Special
execute if score $spell spellcrafter.tmp matches 10 run return run scoreboard players add $spell.multicast spellcrafter.tmp 30
execute if score $spell spellcrafter.tmp matches 47 run return 1
execute if score $spell spellcrafter.tmp matches 48 run return 1
execute if score $spell spellcrafter.tmp matches 50 run return 1
execute if score $spell spellcrafter.tmp matches 52 run return run function spellcrafter:spells/shuffle/cast
execute if score $spell spellcrafter.tmp matches 64 run return 1
execute if score $spell spellcrafter.tmp matches 69 run return 1
execute if score $spell spellcrafter.tmp matches 70 run return 1
execute if score $spell spellcrafter.tmp matches 83 run return 1
execute if score $spell spellcrafter.tmp matches 84 run return 1
execute if score $spell spellcrafter.tmp matches 88 run return run scoreboard players add $spell.multicast spellcrafter.tmp 1
execute if score $spell spellcrafter.tmp matches 89 run return run scoreboard players add $spell.multicast spellcrafter.tmp 2
execute if score $spell spellcrafter.tmp matches 92 run return run function spellcrafter:spells/skip/cast
execute if score $spell spellcrafter.tmp matches 93 run return 1
execute if score $spell spellcrafter.tmp matches 95 run return run function spellcrafter:spells/reverse/cast
execute if score $spell spellcrafter.tmp matches 96 run return 1
execute if score $spell spellcrafter.tmp matches 112 run return run function spellcrafter:spells/transfer/cast
execute if score $spell spellcrafter.tmp matches 113 run return run function spellcrafter:spells/steal/cast


# Unstackable modifiers
execute if score $spell spellcrafter.tmp matches 8 run return run tag @s add spellcrafter.spell.guide
execute if score $spell spellcrafter.tmp matches 9 run return run tag @s add spellcrafter.spell.homing
execute if score $spell spellcrafter.tmp matches 12 run return run tag @s add spellcrafter.spell.random_dir
execute if score $spell spellcrafter.tmp matches 26 run return run tag @s add spellcrafter.spell.ghost
execute if score $spell spellcrafter.tmp matches 32 run return run tag @s add spellcrafter.spell.instant
execute if score $spell spellcrafter.tmp matches 33 run return run tag @s add spellcrafter.spell.piercing
execute if score $spell spellcrafter.tmp matches 40 run return run tag @s add spellcrafter.spell.harmless
execute if score $spell spellcrafter.tmp matches 41 run return run tag @s add spellcrafter.spell.hidden
execute if score $spell spellcrafter.tmp matches 42 run return run tag @s add spellcrafter.spell.rainbow
execute if score $spell spellcrafter.tmp matches 43 run return run tag @s add spellcrafter.spell.zigzag
execute if score $spell spellcrafter.tmp matches 44 run return run tag @s add spellcrafter.spell.chaotic
execute if score $spell spellcrafter.tmp matches 51 run return run tag @s add spellcrafter.spell.spiral
execute if score $spell spellcrafter.tmp matches 54 run return run tag @s add spellcrafter.spell.aim_assist
execute if score $spell spellcrafter.tmp matches 55 run return run tag @s add spellcrafter.spell.scaling
execute if score $spell spellcrafter.tmp matches 59 run return run tag @s add spellcrafter.spell.anchored
execute if score $spell spellcrafter.tmp matches 61 run return run tag @s add spellcrafter.spell.return
execute if score $spell spellcrafter.tmp matches 62 run return run tag @s add spellcrafter.spell.trick_shot
execute if score $spell spellcrafter.tmp matches 66 run return run tag @s add spellcrafter.spell.accelerate
execute if score $spell spellcrafter.tmp matches 67 run return run tag @s add spellcrafter.spell.wave
execute if score $spell spellcrafter.tmp matches 68 run return run tag @s add spellcrafter.spell.warp
execute if score $spell spellcrafter.tmp matches 76 run return run tag @s add spellcrafter.spell.follow
execute if score $spell spellcrafter.tmp matches 77 run return run tag @s add spellcrafter.spell.safe_shot
execute if score $spell spellcrafter.tmp matches 81 run return run tag @s add spellcrafter.spell.bouncy
execute if score $spell spellcrafter.tmp matches 87 run return run tag @s add spellcrafter.spell.orbit
execute if score $spell spellcrafter.tmp matches 103 run return run tag @s add spellcrafter.spell.aim_up
execute if score $spell spellcrafter.tmp matches 104 run return run tag @s add spellcrafter.spell.aim_down
execute if score $spell spellcrafter.tmp matches 108 run return run tag @s add spellcrafter.spell.casters_call
execute if score $spell spellcrafter.tmp matches 109 run return run tag @s add spellcrafter.spell.casters_pull
execute if score $spell spellcrafter.tmp matches 110 run return run tag @s add spellcrafter.spell.casters_aim
execute if score $spell spellcrafter.tmp matches 114 run return run tag @s add spellcrafter.spell.height_lock


# Stackable modifiers
execute if score $spell spellcrafter.tmp matches 6 run return run function spellcrafter:spells/clone/add
execute if score $spell spellcrafter.tmp matches 7 run return run function spellcrafter:spells/empower/cast
execute if score $spell spellcrafter.tmp matches 11 run return run function spellcrafter:spells/multishot/add
execute if score $spell spellcrafter.tmp matches 13 run return run function spellcrafter:spells/range_dec/cast
execute if score $spell spellcrafter.tmp matches 14 run return run function spellcrafter:spells/range_inc/cast
execute if score $spell spellcrafter.tmp matches 15 run return run function spellcrafter:spells/speed_dec/cast
execute if score $spell spellcrafter.tmp matches 16 run return run function spellcrafter:spells/speed_inc/cast
execute if score $spell spellcrafter.tmp matches 17 run return run function spellcrafter:spells/heavy_shot/cast
execute if score $spell spellcrafter.tmp matches 18 run return run function spellcrafter:spells/long_shot/cast
execute if score $spell spellcrafter.tmp matches 19 run return run function spellcrafter:spells/quick_shot/cast
execute if score $spell spellcrafter.tmp matches 28 run return run function spellcrafter:spells/gravity/cast
execute if score $spell spellcrafter.tmp matches 29 run return run function spellcrafter:spells/anti_gravity/cast
execute if score $spell spellcrafter.tmp matches 45 run return run function spellcrafter:spells/remote_cast/add
execute if score $spell spellcrafter.tmp matches 105 run return run function spellcrafter:spells/remote_up/add
execute if score $spell spellcrafter.tmp matches 106 run return run function spellcrafter:spells/remote_down/add
execute if score $spell spellcrafter.tmp matches 107 run return run function spellcrafter:spells/remote_back/add


# If it reaches this point, spell not found
scoreboard players set $success spellcrafter.tmp 0
