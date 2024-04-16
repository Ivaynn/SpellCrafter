#> executed by #minecraft:load


gamerule maxCommandChainLength 2147483647

scoreboard objectives add isc.id dummy
scoreboard objectives add isc.tmp dummy
scoreboard objectives add isc.right_click minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add isc.mana dummy
scoreboard objectives add isc.max_mana dummy
scoreboard objectives add isc.age dummy
scoreboard objectives add isc.speed dummy
scoreboard objectives add isc.range dummy
scoreboard objectives add isc.damage dummy
scoreboard objectives add isc.blind dummy
scoreboard objectives add isc.cooldown dummy

scoreboard objectives add isc.math dummy
scoreboard players set #2 isc.math 2
scoreboard players set #4 isc.math 4
scoreboard players set #100 isc.math 100

scoreboard objectives add isc.options dummy
execute unless score range_mod isc.options matches 0..1000 run scoreboard players set range_mod isc.options 100
execute unless score damage_caster isc.options matches 0..1 run scoreboard players set damage_caster isc.options 0
execute unless score projectile_cap isc.options matches 0.. run scoreboard players set projectile_cap isc.options 500
execute unless score warnings isc.options matches 0..1 run scoreboard players set warnings isc.options 1
