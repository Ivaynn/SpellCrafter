#> as any
# called on close table


# Get number of spells after this one
execute store result score $reduction isc.tmp run data get storage isc:tmp keep
scoreboard players remove $reduction isc.tmp 1

tellraw @a ["",{"score":{"name":"$reduction","objective": "isc.tmp"}}]

# Apply cost reduction
scoreboard players operation $reduction isc.tmp *= #10 isc.math
scoreboard players operation $add isc.tmp -= $reduction isc.tmp
