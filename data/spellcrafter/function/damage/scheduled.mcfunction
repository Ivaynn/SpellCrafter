#> scheduled

execute as @e[type=!#spellcrafter:untargetable,tag=!spellcrafter.untargetable,tag=!spellcrafter.spectator] if score @s spellcrafter.damage matches 1.. run function spellcrafter:damage/init
