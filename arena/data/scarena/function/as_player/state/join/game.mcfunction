#> as player, at @s
scoreboard players set @s scarena.player.state 4
function scarena:as_player/disable_triggers
scoreboard players set @s scarena.player.room_id 0
team join game @s


# Reset player
xp set @s 0 points
xp set @s 0 levels
attribute @s minecraft:max_health base set 20
effect clear @s
effect give @s minecraft:instant_health 1 100 true


# SpellCrafter
scoreboard players set @s spellcrafter.inf_page 0
tag @s remove spellcrafter.caster
tag @s add spellcrafter.untargetable
tag @s remove spellcrafter.inf_mana
tag @s remove spellcrafter.no_cooldown
