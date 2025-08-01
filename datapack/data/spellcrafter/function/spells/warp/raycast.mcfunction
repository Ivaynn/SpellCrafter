#> as projectile, facing @s
#> recursive function (limited by score "$iter spellcrafter.tmp")


# Fail: found anti-magic block - cannot teleport through that
execute if block ~ ~ ~ #spellcrafter:anti_magic run return 0


# Success: found self
execute if entity @s[distance=..1] run return run scoreboard players set $tmp.target_found spellcrafter.tmp 1


# Next iteration
scoreboard players remove $iter spellcrafter.tmp 1
execute if score $iter spellcrafter.tmp matches 1.. positioned ^ ^ ^1 run function spellcrafter:spells/warp/raycast
