#> as target, facing @s
#> recursive function (limited by score $ray spellcrafter.tmp)


# Block collision (target is facing the cast position but is behind a block)
execute if score $ray spellcrafter.tmp matches 1.. unless block ^.2 ^.2 ^ #spellcrafter:air run scoreboard players set $ray spellcrafter.tmp 0
execute if score $ray spellcrafter.tmp matches 1.. unless block ^.2 ^-.2 ^ #spellcrafter:air run scoreboard players set $ray spellcrafter.tmp 0
execute if score $ray spellcrafter.tmp matches 1.. unless block ^-.2 ^.2 ^ #spellcrafter:air run scoreboard players set $ray spellcrafter.tmp 0
execute if score $ray spellcrafter.tmp matches 1.. unless block ^-.2 ^-.2 ^ #spellcrafter:air run scoreboard players set $ray spellcrafter.tmp 0


# Target collision (target takes the hit)
execute if score $ray spellcrafter.tmp matches 1.. positioned ~ ~-1 ~ if entity @s[distance=..1.5] run function spellcrafter:spells/flash/hit


# Next iteration
scoreboard players remove $ray spellcrafter.tmp 1
execute if score $ray spellcrafter.tmp matches 1.. positioned ^ ^ ^.25 run function spellcrafter:spells/flash/raycast
