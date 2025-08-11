#> as player


execute unless score @s SpellCrafter matches 1.. run return run function spellcrafter:as_player/trigger/page/welcome

execute if score @s SpellCrafter matches 9 run return run function spellcrafter:as_player/trigger/toggle_spellcasting
execute if score @s SpellCrafter matches 10..99 run return run function spellcrafter:as_player/trigger/select_actionbar

function spellcrafter:as_player/trigger/page/home
