#> any

data remove storage spellcrafter:tmp lore
data remove storage spellcrafter:tmp items
data remove storage spellcrafter:tmp drop
data remove storage spellcrafter:tmp wand
data remove storage spellcrafter:tmp copy
data remove storage spellcrafter:tmp spell
data remove storage spellcrafter:tmp rotation
data remove storage spellcrafter:tmp time
data remove storage spellcrafter:tmp tmp

scoreboard objectives remove spellcrafter.id
scoreboard objectives remove spellcrafter.tmp
scoreboard objectives remove spellcrafter.mana
scoreboard objectives remove spellcrafter.max_mana
scoreboard objectives remove spellcrafter.mana_reg
scoreboard objectives remove spellcrafter.age
scoreboard objectives remove spellcrafter.speed
scoreboard objectives remove spellcrafter.range
scoreboard objectives remove spellcrafter.damage
scoreboard objectives remove spellcrafter.blind
scoreboard objectives remove spellcrafter.cooldown
scoreboard objectives remove spellcrafter.clone
scoreboard objectives remove spellcrafter.math
scoreboard objectives remove spellcrafter.options
scoreboard objectives remove spellcrafter.weight
scoreboard objectives remove spellcrafter.inf_page
scoreboard objectives remove spellcrafter.dist
scoreboard objectives remove spellcrafter.toggle
scoreboard objectives remove spellcrafter.tick
scoreboard objectives remove spellcrafter.actionbar
scoreboard objectives remove spellcrafter.damage_src
scoreboard objectives remove spellcrafter.hat
scoreboard objectives remove spellcrafter.cache.slot
scoreboard objectives remove spellcrafter.cache.cooldown
scoreboard objectives remove spellcrafter.cache.drain

kill @e[tag=spellcrafter.table]
kill @e[tag=spellcrafter.projectile]
kill @e[tag=spellcrafter.summon]
kill @e[tag=spellcrafter.target_dummy]
kill @e[tag=spellcrafter.dummy_text]
kill @e[tag=spellcrafter.gen]
kill @e[tag=spellcrafter.shop.trader]

tag @e remove spellcrafter.caster
