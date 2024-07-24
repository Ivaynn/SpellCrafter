#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.drain_bolt


# Base stats
scoreboard players add @s isc.speed 10
scoreboard players add @s isc.range 15
scoreboard players add @s isc.damage 0


# Effects
playsound minecraft:entity.allay.item_taken player @a ^ ^ ^3 2 0.8
