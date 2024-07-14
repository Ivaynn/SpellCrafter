
# Get spell data
data remove storage isc:tmp spell
execute on passengers as @s[tag=isc.shop.item] run data modify storage isc:tmp spell set from entity @s item.components."minecraft:custom_data".isc.spell


# Get price
execute store result score $shop.tier isc.tmp run data get storage isc:tmp spell.tier
execute unless score $shop.tier isc.tmp matches 1..5 run scoreboard players set $shop.tier isc.tmp 1

execute if score $shop.tier isc.tmp matches 1 store result score @s isc.shop.value run random value 6..8
execute if score $shop.tier isc.tmp matches 2 store result score @s isc.shop.value run random value 9..11
execute if score $shop.tier isc.tmp matches 3 store result score @s isc.shop.value run random value 12..14
execute if score $shop.tier isc.tmp matches 4 store result score @s isc.shop.value run random value 15..17
execute if score $shop.tier isc.tmp matches 5 store result score @s isc.shop.value run random value 18..20
