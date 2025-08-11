#> as caster, at @s

tag @s add spellcrafter.caster

# Increment #new and give this entity that id
scoreboard players add #new spellcrafter.id 1
scoreboard players operation @s spellcrafter.id = #new spellcrafter.id


# Trader default cooldown
scoreboard players set @s spellcrafter.trader_timer 48000
