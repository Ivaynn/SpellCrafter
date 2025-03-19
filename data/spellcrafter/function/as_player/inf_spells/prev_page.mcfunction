#> as player

scoreboard players remove @s spellcrafter.inf_page 1
execute unless score @s spellcrafter.inf_page matches 101.. run return run scoreboard players set @s spellcrafter.inf_page 101
scoreboard players set $page_changed spellcrafter.tmp 1
