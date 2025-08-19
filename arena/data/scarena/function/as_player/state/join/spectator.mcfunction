#> as player, at @s
scoreboard players set @s scarena.player.state 1
function scarena:as_player/disable_triggers
scoreboard players set @s scarena.game.id 0
scoreboard players set @s scarena.player.room_id 0
scoreboard players set @s scarena.game.round 0


# Disable spectator
execute as @s[gamemode=spectator] run return run function scarena:as_player/state/join/lobby


# Enable spectator
gamemode spectator @s
tag @s remove spellcrafter.caster
tag @s add spellcrafter.untargetable
tp @s @a[limit=1,sort=random,gamemode=!spectator,scores={scarena.player.state=3..}]
