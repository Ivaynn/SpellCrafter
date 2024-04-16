#> any

data remove storage isc:tmp lore
data remove storage isc:tmp items
data remove storage isc:tmp drop
data remove storage isc:tmp wand
data remove storage isc:tmp copy
data remove storage isc:tmp spell
data remove storage isc:tmp rotation

scoreboard objectives remove isc.id
scoreboard objectives remove isc.tmp
scoreboard objectives remove isc.right_click
scoreboard objectives remove isc.mana
scoreboard objectives remove isc.max_mana
scoreboard objectives remove isc.age
scoreboard objectives remove isc.speed
scoreboard objectives remove isc.range
scoreboard objectives remove isc.damage
scoreboard objectives remove isc.blind
scoreboard objectives remove isc.cooldown
scoreboard objectives remove isc.clone
scoreboard objectives remove isc.math
scoreboard objectives remove isc.options

kill @e[tag=isc.table]
kill @e[tag=isc.projectile]
kill @e[tag=isc.summon]

tag @e remove isc.caster
