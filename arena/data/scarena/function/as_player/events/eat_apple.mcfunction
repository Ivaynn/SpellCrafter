#> advancement reward
advancement revoke @s only scarena:eat_apple

scoreboard players add @s scarena.game.apples 1
execute if score @s scarena.game.apples matches 18.. run effect give @s minecraft:absorption infinite 4 true

function scarena:game/as_player/update_health
