#> advancement reward
advancement revoke @s only spellcrafter:events/interact_with_allay


# Update nearby target dummies
execute as @e[distance=..10,type=minecraft:allay,tag=spellcrafter.target_dummy] at @s run function spellcrafter:as_target_dummy/update
