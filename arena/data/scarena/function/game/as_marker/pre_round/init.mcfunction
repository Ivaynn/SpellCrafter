#> as marker, at arena center
scoreboard players set @s scarena.game.timer 100
scoreboard players operation @s scarena.game.timer *= @s scarena.game.round
scoreboard players add @s scarena.game.timer 400


# Remove entities
execute positioned ~ ~-32 ~ as @e[type=!minecraft:player,distance=..200] at @s run function scarena:arena/remove_entity


# Respawn area
fill ~13 -14 ~13 ~-13 -2 ~-13 minecraft:barrier replace
fill ~ -14 ~ ~ -13 ~ minecraft:air replace


# Equal trades for everyone
execute if score @s scarena.game.round matches 1.. run scoreboard players set $gen.shop.tier spellcrafter.tmp 1
execute if score @s scarena.game.round matches 3.. run scoreboard players set $gen.shop.tier spellcrafter.tmp 2
execute if score @s scarena.game.round matches 5.. run scoreboard players set $gen.shop.tier spellcrafter.tmp 3
execute if score @s scarena.game.round matches 7.. run scoreboard players set $gen.shop.tier spellcrafter.tmp 4
execute if score @s scarena.game.round matches 9.. run scoreboard players set $gen.shop.tier spellcrafter.tmp 5
execute positioned 0 100 0 run function scarena:game/as_marker/pre_round/generate_trades


# Players
scoreboard players set $game.player.slot scarena.tmp 0
scoreboard players operation $game.id scarena.tmp = @s scarena.game.id
scoreboard players operation $game.round scarena.tmp = @s scarena.game.round
scoreboard players operation $game.timer scarena.tmp = @s scarena.game.timer
execute as @a[predicate=scarena:match_game_id] run function scarena:game/as_marker/pre_round/as_player
