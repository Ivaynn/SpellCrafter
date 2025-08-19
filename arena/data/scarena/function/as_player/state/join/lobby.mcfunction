#> as player, at @s
scoreboard players set @s scarena.player.state 1
function scarena:as_player/disable_triggers
scoreboard players set @s scarena.game.id 0
scoreboard players set @s scarena.player.room_id 0
scoreboard players set @s scarena.game.round 0


# Reset player
advancement grant @s from spellcrafter:spells/root
gamemode adventure @s[gamemode=!adventure]
spawnpoint @s 0 -42 0 0
tp @s 0 -42 0 0 0
xp set @s 0 points
xp set @s 0 levels
effect clear @s
effect give @s minecraft:instant_health 1 100 true
effect give @s minecraft:saturation infinite 100 true


# SpellCrafter
scoreboard players set @s spellcrafter.inf_page 0
tag @s remove spellcrafter.caster
tag @s add spellcrafter.untargetable
title @s actionbar ""
scoreboard players set @s spellcrafter.mana_reg 0
scoreboard players set @s spellcrafter.mana 0
scoreboard players set @s spellcrafter.max_mana 1

function scarena:as_player/remove_non_wands
