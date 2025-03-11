#> executed every tick, if score #tick is 1..
scoreboard players add #tick spellcrafter.options 1


# Count projectiles check threshold and avoid lag
scoreboard players set $projectile_count spellcrafter.tmp 0


# Tick functions for different types of entities
execute as @a at @s run function spellcrafter:as_player/tick
execute as @e[type=minecraft:marker,tag=spellcrafter.projectile] at @s run function spellcrafter:as_projectile/tick
execute as @e[type=#spellcrafter:caster,type=!minecraft:player,tag=spellcrafter.caster] at @s run function spellcrafter:as_caster/nonplayer/tick
execute as @e[type=#spellcrafter:summon,tag=spellcrafter.summon] at @s run function spellcrafter:as_summon/tick
execute as @e[type=minecraft:block_display,tag=spellcrafter.table] at @s run function spellcrafter:as_table/tick
execute as @e[type=minecraft:iron_golem,tag=spellcrafter.target_dummy] at @s run function spellcrafter:as_target_dummy/tick
execute as @e[type=minecraft:text_display,tag=spellcrafter.dummy_text] at @s run function spellcrafter:as_target_dummy/text/tick


# Projectile cap
execute if score $projectile_count spellcrafter.tmp > projectile_cap spellcrafter.options run function spellcrafter:clear_projectiles
