#> as player
execute if score @s spellcrafter.inf_page matches 101 run return 0

scoreboard players remove @s spellcrafter.inf_page 1
scoreboard players set $page_changed spellcrafter.tmp 1
