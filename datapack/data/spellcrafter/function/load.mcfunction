#> executed by #minecraft:load


gamerule maxCommandChainLength 2147483647

scoreboard objectives add SpellCrafter trigger
scoreboard objectives add spellcrafter.id dummy
scoreboard objectives add spellcrafter.tmp dummy
scoreboard objectives add spellcrafter.mana dummy
scoreboard objectives add spellcrafter.max_mana dummy
scoreboard objectives add spellcrafter.mana_reg dummy
scoreboard objectives add spellcrafter.age dummy
scoreboard objectives add spellcrafter.speed dummy
scoreboard objectives add spellcrafter.range dummy
scoreboard objectives add spellcrafter.damage dummy
scoreboard objectives add spellcrafter.blind dummy
scoreboard objectives add spellcrafter.cooldown dummy
scoreboard objectives add spellcrafter.clone dummy
scoreboard objectives add spellcrafter.weight dummy
scoreboard objectives add spellcrafter.inf_page dummy
scoreboard objectives add spellcrafter.dist dummy
scoreboard objectives add spellcrafter.tick dummy
scoreboard objectives add spellcrafter.damage_src dummy
scoreboard objectives add spellcrafter.hat dummy
scoreboard objectives add spellcrafter.cache.slot dummy
scoreboard objectives add spellcrafter.cache.cooldown dummy
scoreboard objectives add spellcrafter.cache.drain dummy
scoreboard objectives add spellcrafter.trader_timer dummy
scoreboard objectives add spellcrafter.actionbar dummy
scoreboard objectives add spellcrafter.toggle dummy

scoreboard objectives add spellcrafter.math dummy
scoreboard players set #n1 spellcrafter.math -1
scoreboard players set #2 spellcrafter.math 2
scoreboard players set #3 spellcrafter.math 3
scoreboard players set #4 spellcrafter.math 4
scoreboard players set #5 spellcrafter.math 5
scoreboard players set #6 spellcrafter.math 6
scoreboard players set #10 spellcrafter.math 10
scoreboard players set #15 spellcrafter.math 15
scoreboard players set #16 spellcrafter.math 16
scoreboard players set #20 spellcrafter.math 20
scoreboard players set #32 spellcrafter.math 32
scoreboard players set #40 spellcrafter.math 40
scoreboard players set #60 spellcrafter.math 60
scoreboard players set #100 spellcrafter.math 100

scoreboard objectives add spellcrafter.options dummy
scoreboard players set #tick spellcrafter.options 1
function spellcrafter:options/update
