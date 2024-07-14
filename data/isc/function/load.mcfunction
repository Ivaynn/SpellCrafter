#> executed by #minecraft:load


gamerule maxCommandChainLength 2147483647

scoreboard objectives add isc.id dummy
scoreboard objectives add isc.tmp dummy
scoreboard objectives add isc.mana dummy
scoreboard objectives add isc.max_mana dummy
scoreboard objectives add isc.mana_reg dummy
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
scoreboard objectives add isc.tick dummy
scoreboard objectives add isc.damage_src dummy
scoreboard objectives add isc.shop.value dummy
scoreboard objectives add isc.shop.uses dummy

scoreboard objectives add isc.actionbar trigger
scoreboard objectives add isc.toggle trigger

scoreboard objectives add isc.math dummy
scoreboard players set #n1 isc.math -1
scoreboard players set #2 isc.math 2
scoreboard players set #3 isc.math 3
scoreboard players set #4 isc.math 4
scoreboard players set #5 isc.math 5
scoreboard players set #6 isc.math 6
scoreboard players set #10 isc.math 10
scoreboard players set #15 isc.math 15
scoreboard players set #16 isc.math 16
scoreboard players set #20 isc.math 20
scoreboard players set #32 isc.math 32
scoreboard players set #100 isc.math 100

scoreboard objectives add isc.options dummy
scoreboard players set #tick isc.options 1
function isc:options/update
