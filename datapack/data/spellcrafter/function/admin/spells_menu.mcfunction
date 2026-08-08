
# Disable
execute if score @s spellcrafter.inf_page matches 1.. run return run function spellcrafter:as_player/inf_spells/exit


# Must have empty inventory
execute if items entity @s inventory.* * run tellraw @s ["",{text:"> ",color:"red", bold:true},{text:"Your inventory must be empty to use this!",color:"gray"}]
execute if items entity @s inventory.* * run return fail


# Enable
scoreboard players set @s spellcrafter.inf_page 101
function spellcrafter:as_player/inf_spells/update
return 1
