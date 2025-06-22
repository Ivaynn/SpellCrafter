#> as projectile, at @s


# Check if projectile is on block that boosts its damage
scoreboard players set $tmp.boost spellcrafter.tmp 0
execute if block ~ ~ ~ minecraft:water run scoreboard players set $tmp.boost spellcrafter.tmp 1
execute if block ^ ^ ^0.5 minecraft:water run scoreboard players set $tmp.boost spellcrafter.tmp 1
execute if score $tmp.boost spellcrafter.tmp matches 1 run scoreboard players set @s spellcrafter.blind 0


# Very chaotic trajectory
function spellcrafter:spells/lightning_bolt/chaotic


# Effects
function spellcrafter:spells/lightning_bolt/particles


# Get initial damage
scoreboard players operation $tmp.damage spellcrafter.tmp = @s spellcrafter.damage
execute unless score $tmp.damage spellcrafter.tmp matches 1.. run return 0


# Get stats
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind


# No boost: normal damage and range
execute if score $tmp.boost spellcrafter.tmp matches 0 if score @s spellcrafter.blind matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable,predicate=!spellcrafter:match_id] run function spellcrafter:spells/lightning_bolt/as_target
execute if score $tmp.boost spellcrafter.tmp matches 0 unless score @s spellcrafter.blind matches 1.. positioned ~ ~-0.75 ~ as @e[distance=..1.5,type=!#spellcrafter:untargetable] run function spellcrafter:spells/lightning_bolt/as_target


# Boost: increased damage and range
execute if score $tmp.boost spellcrafter.tmp matches 1 positioned ~ ~-0.75 ~ as @e[distance=..4,type=!#spellcrafter:untargetable] run function spellcrafter:spells/lightning_bolt/as_target_boosted
