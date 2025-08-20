#> as marker


# Reset all players
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
execute as @a[scores={scarena.player.state=4}] if score @s scarena.game.id = $game.id scarena.tmp run function scarena:game/as_player/win


# Remove forceloaded chunks
execute store result entity @s Pos[0] double 1 run scoreboard players get @s scarena.game.x
execute store result entity @s Pos[2] double 1 run scoreboard players get @s scarena.game.z
execute at @s run forceload remove ~48 ~48 ~-49 ~-49


# Remove game manager entity
kill @s
