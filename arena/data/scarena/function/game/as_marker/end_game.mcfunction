#> as marker


# Reset all players
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
execute as @a[scores={scarena.player.state=4}] if score @s scarena.game.id = $game.id scarena.tmp run function scarena:game/as_player/exit


# Remove game manager entity
kill @s
