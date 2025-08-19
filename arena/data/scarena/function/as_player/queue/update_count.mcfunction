
scoreboard players set queue.players scarena.main 0
execute as @a if score @s scarena.player.game_id matches -1 run scoreboard players add queue.players scarena.main 1
