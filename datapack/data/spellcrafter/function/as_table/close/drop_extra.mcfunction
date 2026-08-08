#> as player, at barrel
# storage "spellcrafter:tmp drop" must contain barrel items that need to be dropped

execute unless score $table.warning spellcrafter.tmp matches 1.. run scoreboard players set $table.warning spellcrafter.tmp 2

data modify storage spellcrafter:tmp items set from storage spellcrafter:tmp drop
function spellcrafter:as_table/close/drop_items
