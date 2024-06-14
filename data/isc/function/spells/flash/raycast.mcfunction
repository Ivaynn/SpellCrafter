#> as target, facing @s
#> recursive function (limited by score $ray isc.tmp)


# Block collision (target is facing the cast position but is behind a block)
execute if score $ray isc.tmp matches 1.. unless block ^.2 ^.2 ^ #isc:air run scoreboard players set $ray isc.tmp 0
execute if score $ray isc.tmp matches 1.. unless block ^.2 ^-.2 ^ #isc:air run scoreboard players set $ray isc.tmp 0
execute if score $ray isc.tmp matches 1.. unless block ^-.2 ^.2 ^ #isc:air run scoreboard players set $ray isc.tmp 0
execute if score $ray isc.tmp matches 1.. unless block ^-.2 ^-.2 ^ #isc:air run scoreboard players set $ray isc.tmp 0


# Target collision (target takes the hit)
execute if score $ray isc.tmp matches 1.. positioned ~ ~-1 ~ if entity @s[distance=..1.5] run function isc:spells/flash/hit


# Next iteration
scoreboard players remove $ray isc.tmp 1
execute if score $ray isc.tmp matches 1.. positioned ^ ^ ^.25 run function isc:spells/flash/raycast
