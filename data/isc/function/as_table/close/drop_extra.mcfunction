#> as table, at barrel
# storage "isc:tmp drop" must contain barrel items that need to be dropped

data modify storage isc:tmp items set from storage isc:tmp drop
function isc:as_table/close/drop_items
