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
scoreboard objectives add isc.dist dummy

scoreboard objectives add isc.toggle trigger

scoreboard objectives add isc.math dummy
scoreboard players set #2 isc.math 2
scoreboard players set #4 isc.math 4
scoreboard players set #5 isc.math 5
scoreboard players set #6 isc.math 6
scoreboard players set #10 isc.math 10
scoreboard players set #16 isc.math 16
scoreboard players set #20 isc.math 20
scoreboard players set #32 isc.math 32
scoreboard players set #100 isc.math 100

scoreboard objectives add isc.options dummy
scoreboard players set #tick isc.options 1
function isc:options/update
