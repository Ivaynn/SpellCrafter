#> as player, at @s
scoreboard players set @s scarena.player.state 2
function scarena:as_player/disable_triggers


# Reset player
gamemode adventure @s[gamemode=!adventure]
spawnpoint @s 0 0 0
effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true


# Teleport
# TODO


# SpellCrafter
scoreboard players set @s spellcrafter.inf_page 102
tag @s add spellcrafter.caster
title @s actionbar ""
scoreboard players set @s spellcrafter.mana_reg 0
scoreboard players set @s spellcrafter.mana 0
scoreboard players set @s spellcrafter.max_mana 1
