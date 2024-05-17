#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.black_hole

tag @s add isc.spell.ghost
tag @s add isc.spell.anchored
tag @s add isc.spell.piercing
tag @s add isc.spell.scaling
scoreboard players set $spell.multishot isc.tmp 0
scoreboard players set $spell.clone isc.tmp 0


# Set stats
scoreboard players add @s isc.speed 0
scoreboard players set @s isc.range 200
scoreboard players set @s isc.damage 0


# Effects
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 2 0.8
