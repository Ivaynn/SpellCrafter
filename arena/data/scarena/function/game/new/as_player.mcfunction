#> as player, at @s

scoreboard players operation @s scarena.player.game_id = $new scarena.player.game_id

function scarena:as_player/state/join/game
scoreboard players set @s spellcrafter.max_mana 1000
scoreboard players set @s spellcrafter.mana_reg 10
scoreboard players set @s spellcrafter.mana 1000
scoreboard players set @s spellcrafter.cooldown 0
