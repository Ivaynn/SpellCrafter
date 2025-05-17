#> as projectile, on summon, at @s
#> recursive (limited by score "$spell.summon_magma spellcrafter.tmp")
# instant cast


# Summon entity
execute align xyz positioned ~.5 ~ ~.5 run summon minecraft:magma_cube ~ ~ ~ {Tags:["spellcrafter.summon","spellcrafter.tmp"],Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,Size:1,Health:1.0f,attributes:[{id:"minecraft:max_health",base:1.0f}]}
execute align xyz positioned ~.5 ~ ~.5 as @e[limit=1,distance=..0.001,type=minecraft:magma_cube,tag=spellcrafter.tmp] run function spellcrafter:spells/summon_magma/as_magma


# Effects
playsound minecraft:entity.slime.squish_small player @a ~ ~ ~ 1 1


# Counter
scoreboard players remove $spell.summon_magma spellcrafter.tmp 5
execute if score $spell.summon_magma spellcrafter.tmp matches ..0 run scoreboard players set $spell.summon_magma spellcrafter.tmp 0
execute if score $spell.summon_magma spellcrafter.tmp matches 1.. run function spellcrafter:spells/summon_magma/summon
