#> as projectile, on summon, at @s
# projectile stats

tag @s add isc.spell.kinetic_bolt


# Base stats
scoreboard players add @s isc.speed 2
scoreboard players add @s isc.range 15
scoreboard players add @s isc.damage 0


# Effects
execute if score @s isc.speed matches ..2 run playsound minecraft:entity.firework_rocket.shoot player @a ^ ^ ^3 2 1.2
execute if score @s isc.speed matches 3..5 run playsound minecraft:entity.firework_rocket.shoot player @a ^ ^ ^3 2 1.3
execute if score @s isc.speed matches 6..8 run playsound minecraft:entity.firework_rocket.shoot player @a ^ ^ ^3 2 1.4
execute if score @s isc.speed matches 9..11 run playsound minecraft:entity.firework_rocket.shoot player @a ^ ^ ^3 2 1.5
execute if score @s isc.speed matches 12.. run playsound minecraft:entity.firework_rocket.shoot player @a ^ ^ ^3 2 1.6
