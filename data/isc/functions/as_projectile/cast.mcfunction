# Loops itself, gives tags for all modifiers

# tellraw @a ["",{"nbt":"wand.spells","storage":"isc:tmp"}]


# If there are no more spells, return
execute unless data storage isc:tmp wand.spells[0] run return -1


# Initialize
data modify storage isc:tmp wand.first set from storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.spells[0]
scoreboard players set $success isc.tmp 0


# Projectiles (return)
execute if data storage isc:tmp {wand:{first:"magic_missile"}} run return run function isc:spells/magic_missile/projectile
execute if data storage isc:tmp {wand:{first:"fireball"}} run return run function isc:spells/fireball/projectile
execute if data storage isc:tmp {wand:{first:"laser"}} run return run function isc:spells/laser/projectile


# Instant casts
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"explosion"}} run function isc:spells/explosion/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"teleport"}} run function isc:spells/teleport/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_lightning"}} run function isc:spells/summon_lightning/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"heal"}} run function isc:spells/heal/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_vex"}} run function isc:spells/summon_vex/cast 


# Modifiers
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"homing"}} run tag @s add isc.homing
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"guide"}} run tag @s add isc.guide
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"random_dir"}} run tag @s add isc.random_dir
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"duplicate"}} run tag @s add isc.duplicate
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"multishot"}} run tag @s add isc.multishot
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"multicast"}} run tag @s add isc.multicast


# Projectile stat modifiers
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"speed_inc"}} run function isc:spells/speed_inc/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"speed_dec"}} run function isc:spells/speed_dec/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"range_inc"}} run function isc:spells/range_inc/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"range_dec"}} run function isc:spells/range_dec/cast 
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"empower"}} run function isc:spells/empower/cast 


# Next spell
execute if score $success isc.tmp matches 1 run return run function isc:as_projectile/cast
