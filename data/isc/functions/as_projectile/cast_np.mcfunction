#> as projectile, on summon, at @s
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
execute if score $spell isc.tmp matches 47 run return run function isc:spells/refresh/cast
execute if score $spell isc.tmp matches 48 run return run function isc:spells/haste/cast
execute if score $spell isc.tmp matches 49 run return run function isc:spells/shield/cast


# Unstackable modifiers
execute if score $spell isc.tmp matches 8 run return run function isc:spells/guide/add
execute if score $spell isc.tmp matches 9 run return run function isc:spells/homing/add
execute if score $spell isc.tmp matches 10 run return run function isc:spells/multicast/add
execute if score $spell isc.tmp matches 12 run return run function isc:spells/random_dir/add
execute if score $spell isc.tmp matches 26 run return run function isc:spells/ghost/add
execute if score $spell isc.tmp matches 32 run return run function isc:spells/instant/add
execute if score $spell isc.tmp matches 33 run return run function isc:spells/piercing/add
execute if score $spell isc.tmp matches 40 run return run function isc:spells/harmless/add
execute if score $spell isc.tmp matches 41 run return run function isc:spells/hidden/add
execute if score $spell isc.tmp matches 42 run return run function isc:spells/rainbow/add
execute if score $spell isc.tmp matches 43 run return run function isc:spells/zigzag/add
execute if score $spell isc.tmp matches 44 run return run function isc:spells/chaotic/add


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


# If it reaches this point, spell not found
scoreboard players set $success isc.tmp 0
