#> as player


execute unless score @s SpellCrafter matches 1.. run return run function spellcrafter:as_player/trigger/welcome

execute if score @s SpellCrafter matches 9 run return run function spellcrafter:as_player/trigger/toggle_spellcasting
execute if score @s SpellCrafter matches 10..19 run return run function spellcrafter:as_player/trigger/select_actionbar
execute if score @s SpellCrafter matches 20 run return run function spellcrafter:as_player/trigger/share_wand/init
execute if score @s SpellCrafter matches 21 run return run function spellcrafter:as_player/trigger/wand_code/init

function spellcrafter:as_player/trigger/menu
