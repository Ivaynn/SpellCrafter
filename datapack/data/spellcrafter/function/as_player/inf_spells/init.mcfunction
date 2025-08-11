#> as player (scheduled by advancement "inf_inventory_changed")


# Buttons
function spellcrafter:as_player/inf_spells/change_page


# Update inventory
function spellcrafter:as_player/inf_spells/update


# Remove gui items from table (fix shift-clicking)
scoreboard players operation $id spellcrafter.tmp = @s spellcrafter.id
execute as @e[distance=..50,sort=nearest,type=minecraft:item_display,tag=spellcrafter.table,predicate=spellcrafter:match_id] at @s positioned ~ ~-1 ~ run function spellcrafter:as_player/inf_spells/as_table
