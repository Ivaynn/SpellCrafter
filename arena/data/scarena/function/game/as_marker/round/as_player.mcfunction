#> as player, at arena center

spawnpoint @s ~ -14 ~
gamemode survival @s

tag @s add spellcrafter.caster
tag @s remove spellcrafter.untargetable

effect give @s minecraft:instant_health 1 100 true

scoreboard players set @s spellcrafter.cooldown 100
scoreboard players operation @s spellcrafter.mana = @s spellcrafter.max_mana
tag @s remove scarena.game.dead
tag @s remove scarena.game.ready


# Disable ready trigger
trigger ready set 0
