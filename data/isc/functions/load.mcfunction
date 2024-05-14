#> executed by #minecraft:load


gamerule maxCommandChainLength 2147483647

scoreboard objectives add isc.id dummy
scoreboard objectives add isc.tmp dummy
scoreboard objectives add isc.mana dummy
scoreboard objectives add isc.max_mana dummy
scoreboard objectives add isc.age dummy
scoreboard objectives add isc.speed dummy
scoreboard objectives add isc.range dummy
scoreboard objectives add isc.damage dummy
scoreboard objectives add isc.blind dummy
scoreboard objectives add isc.cooldown dummy
scoreboard objectives add isc.clone dummy
scoreboard objectives add isc.weight dummy
scoreboard objectives add isc.inf_page dummy

scoreboard objectives add isc.math dummy
scoreboard players set #2 isc.math 2
scoreboard players set #4 isc.math 4
scoreboard players set #5 isc.math 5
scoreboard players set #6 isc.math 6
scoreboard players set #20 isc.math 20
scoreboard players set #100 isc.math 100

scoreboard objectives add isc.options dummy
scoreboard players set #tick isc.options 1
execute unless score range_mod isc.options matches 0..1000 run scoreboard players set range_mod isc.options 100
execute unless score damage_caster isc.options matches 0..1 run scoreboard players set damage_caster isc.options 1
execute unless score projectile_cap isc.options matches 0.. run scoreboard players set projectile_cap isc.options 500
execute unless score warnings isc.options matches 0..1 run scoreboard players set warnings isc.options 1
execute unless score clone_limit isc.options matches 0.. run scoreboard players set clone_limit isc.options 10
execute unless score min_cooldown isc.options matches 1.. run scoreboard players set min_cooldown isc.options 1
