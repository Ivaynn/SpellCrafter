#> as marker, at world origin
tag @s remove scarena.game.loading


# Alternate between pre-round and round
scoreboard players add @s scarena.game.round 1
scoreboard players operation $game.round scarena.tmp = @s scarena.game.round
scoreboard players operation $game.round scarena.tmp %= #2 scarena.math


# Execute from arena center
execute store result entity @s Pos[0] double 1 run scoreboard players get @s scarena.game.x
execute store result entity @s Pos[2] double 1 run scoreboard players get @s scarena.game.z
execute if score $game.round scarena.tmp matches 1 at @s positioned ~.5 -16 ~.5 run function scarena:game/as_marker/pre_round/init
execute if score $game.round scarena.tmp matches 0 at @s positioned ~.5 -16 ~.5 run function scarena:game/as_marker/round/init


# Return to original pos (world origin)
tp @s ~ ~ ~
