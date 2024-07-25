#> as projectile, on summon, at @s
#> recursive (limited by score "$spell.summon_slime isc.tmp")
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 run summon minecraft:slime ~ ~ ~ {Tags:["isc.summon","isc.tmp"],Invulnerable:1b,DeathLootTable:"empty",PersistenceRequired:1b,Size:0,Health:1.0f,attributes:[{id:"minecraft:generic.max_health",base:1.0f}]}
execute align xyz positioned ~.5 ~ ~.5 as @e[limit=1,distance=..0.001,type=minecraft:slime,tag=isc.tmp] run function isc:spells/summon_slime/as_slime


# Effects
playsound minecraft:entity.slime.squish_small player @a ~ ~ ~ 1 1


# Counter
scoreboard players remove $spell.summon_slime isc.tmp 5
execute if score $spell.summon_slime isc.tmp matches ..0 run scoreboard players set $spell.summon_slime isc.tmp 0
execute if score $spell.summon_slime isc.tmp matches 1.. run function isc:spells/summon_slime/summon
