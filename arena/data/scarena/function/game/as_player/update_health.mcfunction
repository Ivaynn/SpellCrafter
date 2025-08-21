#> as player


# 10 hearts --> 0 apples
execute unless score @s scarena.game.apples matches 1.. run return 0


# 20 hearts --> +2 apples (5 hearts each)
execute if score @s scarena.game.apples matches 1 run return run attribute @s minecraft:max_health base set 30
execute if score @s scarena.game.apples matches 2 run return run attribute @s minecraft:max_health base set 40


# 30 hearts --> +5 apples (2 hearts each)
execute if score @s scarena.game.apples matches 3 run return run attribute @s minecraft:max_health base set 44
execute if score @s scarena.game.apples matches 4 run return run attribute @s minecraft:max_health base set 48
execute if score @s scarena.game.apples matches 5 run return run attribute @s minecraft:max_health base set 52
execute if score @s scarena.game.apples matches 6 run return run attribute @s minecraft:max_health base set 56
execute if score @s scarena.game.apples matches 7 run return run attribute @s minecraft:max_health base set 60


# 40 hearts --> 10 apples (1 heart each)
execute if score @s scarena.game.apples matches 8 run return run attribute @s minecraft:max_health base set 62
execute if score @s scarena.game.apples matches 9 run return run attribute @s minecraft:max_health base set 64
execute if score @s scarena.game.apples matches 10 run return run attribute @s minecraft:max_health base set 66
execute if score @s scarena.game.apples matches 11 run return run attribute @s minecraft:max_health base set 68
execute if score @s scarena.game.apples matches 12 run return run attribute @s minecraft:max_health base set 70
execute if score @s scarena.game.apples matches 13 run return run attribute @s minecraft:max_health base set 72
execute if score @s scarena.game.apples matches 14 run return run attribute @s minecraft:max_health base set 74
execute if score @s scarena.game.apples matches 15 run return run attribute @s minecraft:max_health base set 76
execute if score @s scarena.game.apples matches 16 run return run attribute @s minecraft:max_health base set 78
execute if score @s scarena.game.apples matches 17.. run return run attribute @s minecraft:max_health base set 80
