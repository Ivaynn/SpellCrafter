#> any

data remove storage isc:tmp lore
data remove storage isc:tmp items
data remove storage isc:tmp drop
data remove storage isc:tmp wand
data remove storage isc:tmp copy
data remove storage isc:tmp spell
data remove storage isc:tmp rotation
data remove storage isc:tmp time
data remove storage isc:tmp tmp

scoreboard objectives remove isc.id
scoreboard objectives remove isc.tmp
scoreboard objectives remove isc.mana
scoreboard objectives remove isc.max_mana
scoreboard objectives remove isc.mana_reg
scoreboard objectives remove isc.age
scoreboard objectives remove isc.speed
scoreboard objectives remove isc.range
scoreboard objectives remove isc.damage
scoreboard objectives remove isc.blind
scoreboard objectives remove isc.cooldown
scoreboard objectives remove isc.clone
scoreboard objectives remove isc.math
scoreboard objectives remove isc.options
scoreboard objectives remove isc.weight
scoreboard objectives remove isc.inf_page
scoreboard objectives remove isc.dist
scoreboard objectives remove isc.toggle
scoreboard objectives remove isc.tick
scoreboard objectives remove isc.actionbar
scoreboard objectives remove isc.damage_src
scoreboard objectives remove isc.shop.value
scoreboard objectives remove isc.shop.uses

kill @e[tag=isc.table]
kill @e[tag=isc.projectile]
kill @e[tag=isc.summon]
kill @e[tag=isc.target_dummy]
kill @e[tag=isc.dummy_text]
kill @e[tag=isc.shop]

tag @e remove isc.caster
