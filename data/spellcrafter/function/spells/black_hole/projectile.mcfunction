#> as projectile, on summon, at @s
# projectile stats

tag @s add spellcrafter.spell.black_hole

tag @s add spellcrafter.spell.ghost
tag @s add spellcrafter.spell.anchored
tag @s add spellcrafter.spell.piercing
tag @s add spellcrafter.spell.scaling
scoreboard players set $spell.multishot spellcrafter.tmp 0
scoreboard players set $spell.clone spellcrafter.tmp 0

scoreboard players add @s spellcrafter.speed 0
scoreboard players set @s spellcrafter.range 200
scoreboard players set @s spellcrafter.damage 0

playsound minecraft:block.beacon.activate player @a ~ ~ ~ 2 0.8
