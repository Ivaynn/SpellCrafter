#> as projectile, at @s


# Create a projectile with the spell data
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $clone_count spellcrafter.tmp = @s spellcrafter.clone
execute if score @s spellcrafter.speed matches ..-1 at @s run tp @s ~ ~ ~ facing ^ ^ ^-1
data modify storage spellcrafter:tmp rotation set from entity @s Rotation
data remove storage spellcrafter:tmp wand
data modify storage spellcrafter:tmp wand.spells set from entity @s data.spellcrafter.spells
data modify storage spellcrafter:tmp wand.mod set from entity @s data.spellcrafter.mod

execute summon minecraft:marker run function spellcrafter:as_projectile/summon
