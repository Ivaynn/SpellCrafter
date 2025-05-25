
# Disable
execute if score @s spellcrafter.inf_page matches 1.. run return run function spellcrafter:as_player/inf_spells/exit


# Enable
scoreboard players set @s spellcrafter.inf_page 101
function spellcrafter:as_player/inf_spells/update
return 1
