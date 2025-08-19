#> executed by #minecraft:tick

function scarena:arena/tick
function scarena:rooms/tick
function scarena:game/tick
execute as @a at @s run function scarena:as_player/tick
