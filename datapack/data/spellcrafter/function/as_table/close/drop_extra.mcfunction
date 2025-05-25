#> as table, at barrel
# storage "spellcrafter:tmp drop" must contain barrel items that need to be dropped

data modify storage spellcrafter:tmp items set from storage spellcrafter:tmp drop
function spellcrafter:as_table/close/drop_items
