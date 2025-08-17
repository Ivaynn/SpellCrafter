#> as player, at @s
scoreboard players set @s scarena.player.state 1
function scarena:as_player/disable_triggers


# Reset player
advancement grant @s from spellcrafter:spells/root
gamemode adventure @s[gamemode=!adventure]
spawnpoint @s 0 -42 0
tp @s 0 -42 0 0 0
xp set @s 0 points
xp set @s 0 levels
effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true


# SpellCrafter
scoreboard players set @s spellcrafter.inf_page 102
tag @s remove spellcrafter.caster
title @s actionbar ""
scoreboard players set @s spellcrafter.mana_reg 0
scoreboard players set @s spellcrafter.mana 0
scoreboard players set @s spellcrafter.max_mana 1
