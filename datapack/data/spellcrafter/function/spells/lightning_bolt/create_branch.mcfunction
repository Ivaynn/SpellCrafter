#> as projectile, at @s

data remove storage spellcrafter:tmp copy
data modify storage spellcrafter:tmp copy.tags set from entity @s Tags
data modify storage spellcrafter:tmp copy.rotation set from entity @s Rotation

scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
scoreboard players operation $age spellcrafter.tmp = @s spellcrafter.age
scoreboard players operation $speed spellcrafter.tmp = @s spellcrafter.speed
scoreboard players operation $damage spellcrafter.tmp = @s spellcrafter.damage
scoreboard players operation $dist spellcrafter.tmp = @s spellcrafter.dist
scoreboard players operation $blind spellcrafter.tmp = @s spellcrafter.blind

execute summon minecraft:marker run function spellcrafter:spells/lightning_bolt/as_branch
