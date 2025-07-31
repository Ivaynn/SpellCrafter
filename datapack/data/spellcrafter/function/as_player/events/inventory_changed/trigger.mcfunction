#> advancement reward
advancement revoke @s only spellcrafter:events/inventory_changed


# Update hat
scoreboard players set @s spellcrafter.hat 0
execute store result score @s spellcrafter.hat run data get entity @s equipment.head.components."minecraft:custom_data".spellcrafter.hat.type


# Invalidate held item cache
scoreboard players set @s spellcrafter.cache.cooldown -1
scoreboard players set @s spellcrafter.cache.drain -1
scoreboard players set @s spellcrafter.cache.slot -1


# Infinite spells menu
# Schedule inventory update for this tick (advancement rewards trigger out of normal tick, which causes issues)
execute if score @s spellcrafter.inf_page matches 1..99 run scoreboard players add @s spellcrafter.inf_page 100
