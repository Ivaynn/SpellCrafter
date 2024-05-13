#> as projectile, on summon, at @s
#> recursive function (limited by length of storage "isc:tmp wand.spells")
# storage "isc:tmp wand.spells" must have the spell list


# If there are no more spells, the chain ends without a projectile --> return -1
execute unless data storage isc:tmp wand.spells[0] run return -1


# Put the next spell of the chain in storage "isc:tmp wand.first"
data modify storage isc:tmp wand.first set from storage isc:tmp wand.spells[0]
data remove storage isc:tmp wand.spells[0]
scoreboard players set $success isc.tmp 0


# Projectiles (return)
execute if data storage isc:tmp {wand:{first:"magic_missile"}} run return run function isc:spells/magic_missile/projectile
execute if data storage isc:tmp {wand:{first:"fireball"}} run return run function isc:spells/fireball/projectile
execute if data storage isc:tmp {wand:{first:"laser"}} run return run function isc:spells/laser/projectile
execute if data storage isc:tmp {wand:{first:"revealing_bolt"}} run return run function isc:spells/revealing_bolt/projectile
execute if data storage isc:tmp {wand:{first:"arcane_reaper"}} run return run function isc:spells/arcane_reaper/projectile


# Instant casts
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"explosion"}} run function isc:spells/explosion/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"teleport"}} run function isc:spells/teleport/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_lightning"}} run function isc:spells/summon_lightning/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"heal"}} run function isc:spells/heal/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_vex"}} run function isc:spells/summon_vex/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_bat"}} run function isc:spells/summon_bat/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_slime"}} run function isc:spells/summon_slime/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"summon_tnt"}} run function isc:spells/summon_tnt/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"counterspell"}} run function isc:spells/counterspell/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"double_teleport"}} run function isc:spells/double_teleport/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"inverse_teleport"}} run function isc:spells/inverse_teleport/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"sheep"}} run function isc:spells/sheep/cast


# Unstackable modifiers
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"homing"}} run function isc:spells/homing/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"guide"}} run function isc:spells/guide/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"random_dir"}} run function isc:spells/random_dir/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"multicast"}} run function isc:spells/multicast/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"ghost"}} run function isc:spells/ghost/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"gravity"}} run function isc:spells/gravity/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"anti_gravity"}} run function isc:spells/anti_gravity/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"instant"}} run function isc:spells/instant/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"piercing"}} run function isc:spells/piercing/add


# Stackable modifiers
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"clone"}} run function isc:spells/clone/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"multishot"}} run function isc:spells/multishot/add
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"speed_inc"}} run function isc:spells/speed_inc/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"speed_dec"}} run function isc:spells/speed_dec/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"range_inc"}} run function isc:spells/range_inc/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"range_dec"}} run function isc:spells/range_dec/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"empower"}} run function isc:spells/empower/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"heavy_shot"}} run function isc:spells/heavy_shot/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"long_shot"}} run function isc:spells/long_shot/cast
execute if score $success isc.tmp matches 0 store success score $success isc.tmp if data storage isc:tmp {wand:{first:"quick_shot"}} run function isc:spells/quick_shot/cast


# Next spell
execute if score $success isc.tmp matches 0 if score warnings isc.options matches 1 run tellraw @a ["",{"text":"> Warning! ","color":"gold"},{"text":"Invalid spell id from caster #","color":"gray"},{"score":{"name":"$id","objective":"isc.tmp"},"color":"gray"}]
execute if score $success isc.tmp matches 1 run return run function isc:as_projectile/cast
