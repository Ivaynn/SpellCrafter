#> as projectile, on summon, at @s
#> recursive (limited by score "$spell.summon_slime spellcrafter.tmp")
# instant cast


# Summon entities
scoreboard players operation $spell.summon_slime.stack spellcrafter.tmp = $spell.summon_slime spellcrafter.tmp
execute if score $spell.summon_slime.stack spellcrafter.tmp matches 6.. run scoreboard players set $spell.summon_slime.stack spellcrafter.tmp 5
execute align xyz positioned ~.5 ~ ~.5 run summon minecraft:slime ~ ~ ~ {Tags:["spellcrafter.summon","spellcrafter.tmp"],Invulnerable:1b,DeathLootTable:"spellcrafter:empty",PersistenceRequired:1b,Size:0,Health:1.0f,attributes:[{id:"minecraft:max_health",base:1.0f}]}
execute align xyz positioned ~.5 ~ ~.5 as @e[limit=1,distance=..0.001,type=minecraft:slime,tag=spellcrafter.tmp] run function spellcrafter:spells/summon_slime/as_slime


# Effects
playsound minecraft:entity.slime.squish_small player @a ~ ~ ~ 1 1


# Counter
scoreboard players remove $spell.summon_slime spellcrafter.tmp 5
execute if score $spell.summon_slime spellcrafter.tmp matches ..0 run scoreboard players set $spell.summon_slime spellcrafter.tmp 0
execute if score $spell.summon_slime spellcrafter.tmp matches 1.. run function spellcrafter:spells/summon_slime/summon
