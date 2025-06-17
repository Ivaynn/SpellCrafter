#> as player

scoreboard players add @s spellcrafter.inf_page 1
execute unless score @s spellcrafter.inf_page matches ..108 run return run scoreboard players set @s spellcrafter.inf_page 108
scoreboard players set $page_changed spellcrafter.tmp 1
