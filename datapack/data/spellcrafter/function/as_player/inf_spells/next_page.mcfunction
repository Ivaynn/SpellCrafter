#> as player
execute if score @s spellcrafter.inf_page matches 107 run return 0

execute if score @s spellcrafter.inf_page matches 101 if items entity @s inventory.13 #spellcrafter:wand run return run tellraw @s ["",{text:"> ",color:"red",bold:true},{text:"You must remove the wand from the middle slot before changing pages",color:"gray"}]

scoreboard players add @s spellcrafter.inf_page 1
scoreboard players set $page_changed spellcrafter.tmp 1
